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

--[[
  To run the tests make sure to include this file into PVPWarn.toc.

  start test by calling from the game with /run [functionName]
]]--
local mod = pvpw
local me = {}
mod.testAll = me

me.tag = "TestAll"

-- global
local _G = getfenv(0)

--[[
  Global function to run all tests
]]--
function _G.__PVPW__TEST_ALL()
  local testClasses = {
    "druid",
    "hunter",
    "mage",
    "paladin",
    "priest",
    "rogue",
    "shaman",
    "warlock",
    "warrior",
    "items",
    "misc",
    "racials"
  }

  -- clear saved testcases
  mod.testReporter.ClearSavedTestReports()
  -- start new testrun
  mod.testReporter.StartTestRun("test_all")

  for i = 1, table.getn(testClasses) do
    local moduleName
    local testClassWithLocale

    if GetLocale() == "deDE" then
      testClassWithLocale = testClasses[i] .. "De"
    else
      -- default locale english
      testClassWithLocale = testClasses[i] .. "En"
    end

    mod.testReporter.StartTestClass(testClasses[i])
    moduleName = "test" .. string.gsub(testClassWithLocale, "^%l", string.upper)

    assert(type(mod[moduleName].RunAll) == "function",
      string.format("Each test class should have a `RunAll`" ..
      " testcase (expected function got %s)", type(mod[moduleName].RunAll)))

    -- run actual tests
    mod.testHelper.TestShouldHaveASoundTestForEachSpell(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveAParseTestForEachSpell(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(mod[moduleName], testClasses[i])
    mod.testHelper.TestShouldHaveASelfAvoidParseTestForEachSpell(mod[moduleName], testClasses[i])
    -- set queue to manual running to prevent multiple queues running
    mod[moduleName].RunAll(true)
  end
  -- start sound queue manually
  mod.testReporter.PlayTestQueueWithDelay()
end
