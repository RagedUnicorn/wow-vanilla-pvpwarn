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
mod.testMiscDe = me

me.tag = "TestMiscDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[12]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_MISC_DE__Test()
  mod.testReporter.StartTestRun("global_misc_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_MISC_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_misc_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_misc_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MISC_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_misc_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_misc_de_parse_down")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnergieWiederherstellen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErsteHilfe)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnverwundbarkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownUnverwundbarkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreieAktion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFreieAktion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundThoriumgranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownThoriumgranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEisengranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEisengranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeuerschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFeuerschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArkanschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArkanschutz)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseDisteltee)
  mod.testReporter.AddToTestQueue(me.TestParseReneration)
  mod.testReporter.AddToTestQueue(me.TestParseDownReneration)
  mod.testReporter.AddToTestQueue(me.TestParseErsteHilfe)
  mod.testReporter.AddToTestQueue(me.TestParseUnverwundbarkeit)
  mod.testReporter.AddToTestQueue(me.TestParseDownUnverwundbarkeit)
  mod.testReporter.AddToTestQueue(me.TestParseFreieAktion)
  mod.testReporter.AddToTestQueue(me.TestParseDownFreieAktion)
  mod.testReporter.AddToTestQueue(me.TestParseThoriumgranate)
  mod.testReporter.AddToTestQueue(me.TestParseDownThoriumgranate)
  mod.testReporter.AddToTestQueue(me.TestParseEisengranate)
  mod.testReporter.AddToTestQueue(me.TestParseDownEisengranate)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchattenschutz)
  mod.testReporter.AddToTestQueue(me.TestParseFrostProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostschutz)
  mod.testReporter.AddToTestQueue(me.TestParseFeuerschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownFeuerschutz)
  mod.testReporter.AddToTestQueue(me.TestParseNaturschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownNaturschutz)
  mod.testReporter.AddToTestQueue(me.TestParseArkanschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownArkanschutz)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundEnergieWiederherstellen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEnergieWiederherstellen",
    "energie_wiederherstellen"
  )
end

function me.TestSoundRegeneration()
  mod.testHelper.TestSound(
    className,
    "TestSoundRegeneration",
    "regeneration"
  )
end

function me.TestSoundDownRegeneration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRegeneration",
    "regeneration"
  )
end

function me.TestSoundErsteHilfe()
  mod.testHelper.TestSound(
    className,
    "TestSoundErsteHilfe",
    "erste_hilfe"
  )
end

function me.TestSoundUnverwundbarkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundUnverwundbarkeit",
    "unverwundbarkeit"
  )
end

function me.TestSoundDownUnverwundbarkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownUnverwundbarkeit",
    "unverwundbarkeit"
  )
end

function me.TestSoundFreieAktion()
  mod.testHelper.TestSound(
    className,
    "TestSoundFreieAktion",
    "freie_aktion"
  )
end

function me.TestSoundDownFreieAktion()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFreieAktion",
    "freie_aktion"
  )
end

function me.TestSoundThoriumgranate()
  mod.testHelper.TestSound(
    className,
    "TestSoundThoriumgranate",
    "thoriumgranate"
  )
end

function me.TestSoundDownThoriumgranate()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownThoriumgranate",
    "thoriumgranate"
  )
end

function me.TestSoundEisengranate()
  mod.testHelper.TestSound(
    className,
    "TestSoundEisengranate",
    "eisengranate"
  )
end

function me.TestSoundDownEisengranate()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEisengranate",
    "eisengranate"
  )
end

function me.TestSoundSchattenschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenschutz",
    "schattenschutz"
  )
end

function me.TestSoundDownSchattenschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenschutz",
    "schattenschutz"
  )
end

function me.TestSoundFrostschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostschutz",
    "frostschutz"
  )
end

function me.TestSoundDownFrostschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostschutz",
    "frostschutz"
  )
end

function me.TestSoundFeuerschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeuerschutz",
    "feuerschutz"
  )
end

function me.TestSoundDownFeuerschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFeuerschutz",
    "feuerschutz"
  )
end

function me.TestSoundNaturschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundNaturschutz",
    "naturschutz"
  )
end

function me.TestSoundDownNaturschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownNaturschutz",
    "naturschutz"
  )
end

function me.TestSoundArkanschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundArkanschutz",
    "arkanschutz"
  )
end

function me.TestSoundDownArkanschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownArkanschutz",
    "arkanschutz"
  )
end

function me.TestParseDisteltee()
  mod.testHelper.TestParse(
    className,
    "TestParseDisteltee",
    "energie_wiederherstellen",
    "$player$ bekommt $amount$ Energie durch $player$s Energie wiederherstellen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseRegeneration()
  mod.testHelper.TestParse(
    className,
    "TestParseRegeneration",
    "regeneration",
    "$player$ bekommt Regeneration.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRegeneration()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRegeneration",
    "regeneration",
    "Regeneration schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseErsteHilfe()
  mod.testHelper.TestParse(
    className,
    "TestParseErsteHilfe",
    "erste_hilfe",
    "$player$ bekommt Erste Hilfe.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseUnverwundbarkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseUnverwundbarkeit",
    "unverwundbarkeit",
    "$player$ bekommt Unverwundbarkeit.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownUnverwundbarkeit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownUnverwundbarkeit",
    "unverwundbarkeit",
    "Unverwundbarkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFreieAktion()
  mod.testHelper.TestParse(
    className,
    "TestParseFreieAktion",
    "freie_aktion",
    "$player$ bekommt Freie Aktion.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFreieAktion()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFreieAktion",
    "freie_aktion",
    "Freie Aktion schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseThoriumgranate()
  mod.testHelper.TestParse(
    className,
    "TestParseThoriumgranate",
    "thoriumgranate",
    "Ihr seid von Thoriumgranate betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseDownThoriumgranate()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownThoriumgranate",
    "thoriumgranate",
    "Thoriumgranate schwindet von euch.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEisengranate()
  mod.testHelper.TestParse(
    className,
    "TestParseEisengranate",
    "eisengranate",
    "Ihr seid von Eisengranate betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseDownEisengranate()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEisengranate",
    "eisengranate",
    "Eisengranate schwindet von euch.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchattenschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenschutz",
    "schattenschutz",
    "$player$ bekommt Schattenschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchattenschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchattenschutz",
    "schattenschutz",
    "Schattenschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostschutz",
    "frostschutz",
    "$player$ bekommt Frostschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostschutz",
    "frostschutz",
    "Frostschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFeuerschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFeuerschutz",
    "feuerschutz",
    "$player$ bekommt Feuerschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFeuerschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFeuerschutz",
    "feuerschutz",
    "Feuerschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNaturschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseNaturschutz",
    "naturschutz",
    "$player$ bekommt Naturschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownNaturschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownNaturschutz",
    "naturschutz",
    "Naturschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseArkanschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseArkanschutz",
    "arkanschutz",
    "$player$ bekommt Arkanschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownArkanschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownArkanschutz",
    "arkanschutz",
    "Arkanschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end
