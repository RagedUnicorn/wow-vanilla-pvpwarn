--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

local mod = pvpw
local me = {}
mod.testReporter = me

me.tag = "TestReporter"

me.colors = {}
me.colors.success = "|cff4caf50"  -- green
me.colors.fail = "|cffff5252"     -- red
me.colors.neutral = "|cff2196f3"  -- blue

-- currently running testrun report
me.report = nil
-- whether writing to a savedvariable is active or not
local writeLogFile = true

local testQueueWithDelay = {}
local testQueue = {}

--[[
  Store logdata for tests
]]--
PVPWarnLog = {}

--[[
  Reset SavedVariable for storing logs
]]--
function me.ClearSavedTestReports()
  PVPWarnLog = {}
  mod.logger.LogInfo(me.tag, "Resetted SavedVariable PVPWarnLog")
end

--[[
  add a function to the testqueue
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueueWithDelay(testFunction, testReport)
  local test = {testFunction, testReport}

  table.insert(testQueueWithDelay, test)
end

--[[
  add a function to the testqueue
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueue(testFunction, testReport)
  local test = {testFunction, testReport}

  table.insert(testQueue, test)
end

--[[
  if you playback sound you must use the TestQueue to avoid playback issues.
  WoW cannot play dozens of sounds at the same time instead each test is executed
  after another
]]--
function me.PlayTestQueueWithDelay()
  for i = 1, table.getn(testQueueWithDelay) do
    testQueueWithDelay[i][1](testQueueWithDelay[i][2])
    table.remove(testQueueWithDelay, i)

    -- do one test at a time
    local random = math.floor(math.random() * 100000)
    mod.timer.CreateTimer("TestSetQueue" .. random, me.PlayTestQueueWithDelay, 2)
    mod.timer.StartTimer("TestSetQueue" .. random)
    return
  end
  -- empty queue
  testQueueWithDelay = {}
end

--[[
  run through testQueue and execute testfunctions
]]--
function me.PlayTestQueue()
  for i = 1, table.getn(testQueue) do
    testQueue[i][1](testQueue[i][2])
  end
  -- empty queue
  testQueue = {}
end

--[[
  Used for logging to a SavedVariable. Make sure to call this function before
  you start running tests
  @param {string} prefix
    string to prefix testreport name
]]--
function me.StartTestRun(prefix)
  if writeLogFile then
    -- start new report
    me.report = {}

    if prefix then
      prefix = prefix .. "_"
    else
      prefix = ""
    end

    me.report.name = prefix .. "Test_" .. date("%m/%d/%y %H:%M:%S")
    PVPWarnLog[me.report.name] = {}
  end
end

--[[
  Starting a new testrun for a certain class
  @param {string} className
]]--
function me.StartTestClass(className)
  assert(type(className) == "string",
    string.format("bad argument #1 to `StartTestClass` (expected string got %s)", type(className)))

  local logMessage = string.format(
    "%s%s: %s Starting testset for %s", me.colors.neutral, PVPW_ENVIRONMENT.ADDON_NAME_SHORT, me.tag, className)

  DEFAULT_CHAT_FRAME:AddMessage(logMessage)
  me.AddLine()

  if writeLogFile then
    if me.report.name == nil or me.report.name == "" then
      me.logger.LogError(me.tag, "Error unable to find started testrun. Make sure to call 'StartTestRun' before running any tests")
      return
    end

    -- set current className for report
    me.report.className = className

    if PVPWarnLog[me.report.name][me.report.className] == nil then
      PVPWarnLog[me.report.name][me.report.className] = {}
    end

    table.insert(PVPWarnLog[me.report.name][me.report.className], logMessage)
  end
end

--[[
  Start new test
  @param {string} className
  @param {number} testType
    type of the test e.g. sound, parse, base
  @param {string} testName
]]--
function me.StartTest(className, testType, testName)
  assert(type(className) == "string",
    string.format("bad argument #1 to `StartTest` (expected string got %s)", type(className)))

  assert(type(testType) == "number",
    string.format("bad argument #2 to `StartTest` (expected number got %s)", type(testType)))

  assert(type(testName) == "string",
    string.format("bad argument #3 to `StartTest` (expected string got %s)", type(testName)))

  local logMessage = string.format(
    "%s%s: %s Starting testset for %s", me.colors.neutral, PVPW_ENVIRONMENT.ADDON_NAME_SHORT, me.tag, testName)

  me.AddLine()
  DEFAULT_CHAT_FRAME:AddMessage(logMessage)

  if writeLogFile then
    local testType = mod.testHelper.GetTestType(testType)

    if me.report.name == nil or me.report.name == "" then
      me.logger.LogError(me.tag, "Error unable to find started testrun. Make sure to call 'StartTestRun' before running any tests")
      return
    end

    if PVPWarnLog[me.report.name][className][testType] == nil then
      PVPWarnLog[me.report.name][className][testType] = {}
    end

    PVPWarnLog[me.report.name][className][testType][testName] = {}
    table.insert(PVPWarnLog[me.report.name][className][testType][testName], logMessage)
  end
end

--[[
  End current running test
  @param {string} className
  @param {number} testType
    type of the test e.g. sound, parse, base
  @param {string} testName
]]--
function me.EndTest(className, testType, testName)
  assert(type(className) == "string",
    string.format("bad argument #1 to `EndTest` (expected string got %s)", type(className)))

  assert(type(testType) == "number",
    string.format("bad argument #2 to `EndTest` (expected number got %s)", type(testType)))

  assert(type(testName) == "string",
    string.format("bad argument #3 to `EndTest` (expected string got %s)", type(testName)))

  local logMessage = string.format(
    "%s%s: %s End testset for %s", me.colors.neutral, PVPW_ENVIRONMENT.ADDON_NAME_SHORT, me.tag, testName)

  DEFAULT_CHAT_FRAME:AddMessage(logMessage)
  me.AddLine()

  if writeLogFile then
    local testType = mod.testHelper.GetTestType(testType)

    if me.report.name == nil or me.report.name == "" then
      me.logger.LogError(me.tag, "Error unable to find started testrun. Make sure to call 'StartTestRun' before running any tests")
      return
    end

    if PVPWarnLog[me.report.name][className][testType] == nil then
      mod.logger.LogError(me.tag, "Error missing entry for testType - "
      .. testType .. " in class - " .. className)
      return
    end

    table.insert(PVPWarnLog[me.report.name][className][testType][testName], logMessage)
  end
end

--[[
  @param {string} className
  @param {string} testName
  @param {number} testType
    type of the test e.g. sound, parse, base
  @param {string} reason
    logMessage reason why the test was successful
]]--
function me.ReportSuccessTest(className, testName, testType, reason)
  assert(type(className) == "string",
    string.format("bad argument #1 to `ReportSuccessTest` (expected string got %s)", type(className)))

  assert(type(testName) == "string",
    string.format("bad argument #2 to `ReportSuccessTest` (expected string got %s)", type(testName)))

  assert(type(testType) == "number",
    string.format("bad argument #3 to `ReportSuccessTest` (expected number got %s)", type(testType)))

  assert(type(reason) == "string",
    string.format("bad argument #4 to `ReportSuccessTest` (expected string got %s)", type(reason)))

  local logMessage = string.format(
    "%s%s: %s %s", me.colors.success, PVPW_ENVIRONMENT.ADDON_NAME_SHORT, me.tag, reason)

  DEFAULT_CHAT_FRAME:AddMessage(logMessage)

  if writeLogFile then
    local testType = mod.testHelper.GetTestType(testType)

    if me.report.name == nil or me.report.name == "" then
      me.logger.LogError(me.tag, "Error unable to find started testrun. Make sure to call 'StartTestRun' before running any tests")
      return
    end

    table.insert(PVPWarnLog[me.report.name][className][testType][testName], logMessage)
  end
end

--[[
  @param {string} className
  @param {string} testName
  @param {number} testType
    type of the test e.g. sound, parse, base
  @param {string} reason
    logMessage reason why the test failed
]]--
function me.ReportFailTest(className, testName, testType, reason)
  assert(type(className) == "string",
    string.format("bad argument #1 to `ReportFailTest` (expected string got %s)", type(className)))

  assert(type(testName) == "string",
    string.format("bad argument #2 to `ReportFailTest` (expected string got %s)", type(testName)))

  assert(type(testType) == "number",
    string.format("bad argument #3 to `ReportFailTest` (expected number got %s)", type(testType)))

  assert(type(reason) == "string",
    string.format("bad argument #4 to `ReportFailTest` (expected string got %s)", type(reason)))

  local logMessage = string.format(
    "%s%s: %s %s", me.colors.fail, PVPW_ENVIRONMENT.ADDON_NAME_SHORT, me.tag, reason)

  DEFAULT_CHAT_FRAME:AddMessage(logMessage)

  if writeLogFile then
    local testType = mod.testHelper.GetTestType(testType)

    if me.report.name == nil or me.report.name == "" then
      me.logger.LogError(me.tag, "Error unable to find started testrun. Make sure to call 'StartTestRun' before running any tests")
      return
    end

    table.insert(PVPWarnLog[me.report.name][className][testType][testName], logMessage)
  end
end

--[[
  add line seperator based on the width of the DEFAULT_CHAT_FRAME
]]--
function me.AddLine()
  local chatFrameWidth = DEFAULT_CHAT_FRAME:GetWidth()
  local line = "="

  for i = 1, math.floor(chatFrameWidth / 10)  do
    line = line .. "="
  end

  DEFAULT_CHAT_FRAME:AddMessage(string.format("%s%s", me.colors.neutral, line))
end
