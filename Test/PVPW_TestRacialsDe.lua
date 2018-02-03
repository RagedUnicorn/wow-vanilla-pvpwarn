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
mod.testRacialsDe = me

me.tag = "TestRacialsDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[11]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_RACIALS_DE__Test()
  mod.testReporter.StartTestRun("global_racials_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_racials_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_racials_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end
--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll(playManual)
  -- test sound
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWachsamkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWachsamkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWilleDerVerlassenen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWilleDerVerlassenen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSteingestalt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSteingestalt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntfesselungskuenstler)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKriegsdonner)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserker)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserker)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenhaftigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenhaftigkeit)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundWachsamkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundWachsamkeit",
    "wachsamkeit"
  )
end

function me.TestSoundDownWachsamkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWachsamkeit",
    "wachsamkeit"
  )
end

function me.TestSoundWilleDerVerlassenen()
  mod.testHelper.TestSound(
    className,
    "TestSoundWilleDerVerlassenen",
    "wille_der_verlassenen"
  )
end

function me.TestSoundDownWilleDerVerlassenen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWilleDerVerlassenen",
    "wille_der_verlassenen"
  )
end

function me.TestSoundSteingestalt()
  mod.testHelper.TestSound(
    className,
    "TestSoundSteingestalt",
    "steingestalt"
  )
end

function me.TestSoundDownSteingestalt()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSteingestalt",
    "steingestalt"
  )
end

function me.TestSoundEntfesselungskuenstler()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntfesselungskuenstler",
    "entfesselungskuenstler"
  )
end

function me.TestSoundKriegsdonner()
  mod.testHelper.TestSound(
    className,
    "TestSoundKriegsdonner",
    "kriegsdonner"
  )
end

function me.TestSoundBerserker()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserker",
    "berserker"
  )
end

function me.TestSoundDownBerserker()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserker",
    "berserker"
  )
end

function me.TestSoundSchattenhaftigkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenhaftigkeit",
    "schattenhaftigkeit"
  )
end

function me.TestSoundDownSchattenhaftigkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenhaftigkeit",
    "schattenhaftigkeit"
  )
end
