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
mod.testDruidDe = me

me.tag = "TestDruidDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[8]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_DRUID_DE__Test()
  mod.testReporter.StartTestRun("global_druid_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_DRUID_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_druid_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_druid_de_sound_down")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBaumrinde)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBaumrinde)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGriffDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGriffDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildeAttacke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRasendeRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRasendeRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVergiftungAufheben)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVergiftungAufheben)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAnregen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAnregen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeenfeuer)


  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBaumrinde()
  mod.testHelper.TestSound(
    className,
    "TestSoundBaumrinde",
    "baumrinde"
  )
end

function me.TestSoundDownBaumrinde()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBaumrinde",
    "baumrinde"
  )
end

function me.TestSoundGriffDerNatur()
  mod.testHelper.TestSound(
    className,
    "TestSoundGriffDerNatur",
    "griff_der_natur"
  )
end

function me.TestSoundDownGriffDerNatur()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGriffDerNatur",
    "griff_der_natur"
  )
end

function me.TestSoundHieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundHieb",
    "hieb"
  )
end

function me.TestSoundWildeAttacke()
  mod.testHelper.TestSound(
    className,
    "TestSoundWildeAttacke",
    "wilde_attacke"
  )
end

function me.TestSoundRasendeRegeneration()
  mod.testHelper.TestSound(
    className,
    "TestSoundRasendeRegeneration",
    "rasende_regeneration"
  )
end

function me.TestSoundDownRasendeRegeneration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRasendeRegeneration",
    "rasende_regeneration"
  )
end

function me.TestSoundVergiftungAufheben()
  mod.testHelper.TestSound(
    className,
    "TestSoundVergiftungAufheben",
    "vergiftung_aufheben"
  )
end

function me.TestSoundDownVergiftungAufheben()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownVergiftungAufheben",
    "vergiftung_aufheben"
  )
end

function me.TestSoundAnregen()
  mod.testHelper.TestSound(
    className,
    "TestSoundAnregen",
    "anregen"
  )
end

function me.TestSoundDownAnregen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAnregen",
    "anregen"
  )
end

function me.TestSoundSchnelligkeitDerNatur()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchnelligkeitDerNatur",
    "schnelligkeit_der_natur"
  )
end

function me.TestSoundDownSchnelligkeitDerNatur()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchnelligkeitDerNatur",
    "schnelligkeit_der_natur"
  )
end

function me.TestSoundFeenfeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeenfeuer",
    "feenfeuer"
  )
end
