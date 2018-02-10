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
mod.testRogueDe = me

me.tag = "TestRogueDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[3]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ROGUE_DE__Test()
  mod.testReporter.StartTestRun("global_rogue_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

--[[
  tests if a sound testcase can be found for each registered spell in PVPW_SpellMap
]]--
function _G.__PVPW__TEST_ROGUE_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_rogue_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_rogue_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_rogue_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_rogue_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll(playManual)
  -- test sound
  --[[mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlenden)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTritt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNierenhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFieserTrick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKlingenwirbel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownKlingenwirbel)]]--

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseTritt)
  mod.testReporter.AddToTestQueue(me.TestParseCritTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSprinten)
  mod.testReporter.AddToTestQueue(me.TestParseDownSprinten)
  mod.testReporter.AddToTestQueue(me.TestParseEntrinnen)
  mod.testReporter.AddToTestQueue(me.TestParseDownEntrinnen)
  mod.testReporter.AddToTestQueue(me.TestParseNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseAdrenalinrausch)
  mod.testReporter.AddToTestQueue(me.TestParseDownAdrenalinrausch)
  mod.testReporter.AddToTestQueue(me.TestParseKlingenwirbel)
  mod.testReporter.AddToTestQueue(me.TestParseDownKlingenwirbel)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBlenden()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlenden",
    "blenden"
  )
end

function me.TestSoundTritt()
  mod.testHelper.TestSound(
    className,
    "TestSoundTritt",
    "tritt"
  )
end

function me.TestSoundSprinten()
  mod.testHelper.TestSound(
    className,
    "TestSoundSprinten",
    "sprinten"
  )
end

function me.TestSoundDownSprinten()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSprinten",
    "sprinten"
  )
end

function me.TestSoundEntrinnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundDownEntrinnen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundNierenhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundNierenhieb",
    "nierenhieb"
  )
end

function me.TestSoundFieserTrick()
  mod.testHelper.TestSound(
    className,
    "TestSoundFieserTrick",
    "fieser_trick"
  )
end

function me.TestSoundAdrenalinrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundDownAdrenalinrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundKlingenwirbel()
  mod.testHelper.TestSound(
    className,
    "TestSoundKlingenwirbel",
    "klingenwirbel"
  )
end

function me.TestSoundDownKlingenwirbel()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownKlingenwirbel",
    "klingenwirbel"
  )
end

function me.TestParseBlenden()
  mod.testHelper.TestParse(
    className,
    "TestParseBlenden",
    "blenden",
    "Ihr seid von Blenden betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseTritt()
  mod.testHelper.TestParse(
    className,
    "TestParseTritt",
    "tritt",
    "$player$ trifft Euch (mit Tritt). Schaden: $amount$",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritTritt()
  mod.testHelper.TestParse(
    className,
    "TestParseCritTritt",
    "tritt",
    "$player$ trifft Euch kritisch (mit Tritt). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSprinten()
  mod.testHelper.TestParse(
    className,
    "TestParseSprinten",
    "sprinten",
    "$player$ bekommt Sprinten.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSprinten()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSprinten",
    "sprinten",
    "Sprinten schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEntrinnen()
  mod.testHelper.TestParse(
    className,
    "TestParseEntrinnen",
    "entrinnen",
    "$player$ bekommt Entrinnen.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEntrinnen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEntrinnen",
    "entrinnen",
    "Entrinnen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNierenhieb()
  mod.testHelper.TestParse(
    className,
    "TestParseNierenhieb",
    "nierenhieb",
    "Ihr seid von Nierenhieb betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFieserTrick()
  mod.testHelper.TestParse(
    className,
    "TestParseFieserTrick",
    "fieser_trick",
    "Ihr seid von Fieser Trick betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAdrenalinrausch()
  mod.testHelper.TestParse(
    className,
    "TestParseAdrenalinrausch",
    "adrenalinrausch",
    "$player$ bekommt Adrenalinrausch.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAdrenalinrausch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAdrenalinrausch",
    "adrenalinrausch",
    "Adrenalinrausch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKlingenwirbel()
  mod.testHelper.TestParse(
    className,
    "TestParseKlingenwirbel",
    "klingenwirbel",
    "$player$ bekommt Klingenwirbel.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownKlingenwirbel()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownKlingenwirbel",
    "klingenwirbel",
    "Klingenwirbel schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end
