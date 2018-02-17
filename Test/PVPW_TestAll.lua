--[[
  PVPWarn - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2018 Michael Wiesendanger <michael.wiesendanger@gmail.com>

  This file is part of PVPWarn.

  PVPWarn is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  PVPWarn is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with PVPWarn.  If not, see <http://www.gnu.org/licenses/>.
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
