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
mod.testWarriorDe = me

me.tag = "TestWarriorDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[1]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARRIOR_DE__Test()
  mod.testReporter.StartTestRun("global_warrior_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_warrior_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warrior_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_warrior_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warrior_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warrior_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll(playManual)
  -- test sound
  --[[mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKampfhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerteidigungshaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntwaffnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErschuetternderSchlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZuschlagen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBetaeubungAbfangen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDrohruf)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildhieb)]]--

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseBerserkerwut)
  mod.testReporter.AddToTestQueue(me.TestParseDownBerserkerwut)
  mod.testReporter.AddToTestQueue(me.TestParseTollkuehnheit)
  mod.testReporter.AddToTestQueue(me.TestParseDownTollkuehnheit)
  mod.testReporter.AddToTestQueue(me.TestParseTodeswunsch)
  mod.testReporter.AddToTestQueue(me.TestParseDownTodeswunsch)
  mod.testReporter.AddToTestQueue(me.TestParseSchildwall)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchildwall)
  mod.testReporter.AddToTestQueue(me.TestParseKampfhaltung)
  mod.testReporter.AddToTestQueue(me.TestParseBerserkerhaltung)
  mod.testReporter.AddToTestQueue(me.TestParseVerteidigungshaltung)
  mod.testReporter.AddToTestQueue(me.TestParseSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseLetztesGefecht)
  mod.testReporter.AddToTestQueue(me.TestParseDownLetztesGefecht)
  mod.testReporter.AddToTestQueue(me.TestParseEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseBlutrausch)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlutrausch)
  mod.testReporter.AddToTestQueue(me.TestParseZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseCritZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchildhieb)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBerserkerwut()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundDownBerserkerwut()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundTollkuehnheit()
  mod.testHelper.TestSound(
    className,
    "TestSoundTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundDownTollkuehnheit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundTodeswunsch()
  mod.testHelper.TestSound(
    className,
    "TestSoundTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundDownTodeswunsch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundSchildwall()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildwall",
    "schildwall"
  )
end

function me.TestSoundDownSchildwall()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildwall",
    "schildwall"
  )
end

function me.TestSoundKampfhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundKampfhaltung",
    "kampfhaltung"
  )
end

function me.TestSoundBerserkerhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerhaltung",
    "berserkerhaltung"
  )
end

function me.TestSoundVerteidigungshaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerteidigungshaltung",
    "verteidigungshaltung"
  )
end

function me.TestSoundSturmangriffsbetaeubung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung"
  )
end

function me.TestSoundLetztesGefecht()
  mod.testHelper.TestSound(
    className,
    "TestSoundLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundDownLetztesGefecht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundEntwaffnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntwaffnen",
    "entwaffnen"
  )
end

function me.TestSoundErschuetternderSchlag()
  mod.testHelper.TestSound(
    className,
    "TestSoundErschuetternderSchlag",
    "erschuetternder_schlag"
  )
end

function me.TestSoundBlutrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundDownBlutrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundZuschlagen()
  mod.testHelper.TestSound(
    className,
    "TestSoundZuschlagen",
    "zuschlagen"
  )
end

function me.TestSoundBetaeubungAbfangen()
  mod.testHelper.TestSound(
    className,
    "TestSoundBetaeubungAbfangen",
    "betaeubung_abfangen"
  )
end

function me.TestSoundDrohruf()
  mod.testHelper.TestSound(
    className,
    "TestSoundDrohruf",
    "drohruf"
  )
end

function me.TestSoundSchildhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildhieb",
    "schildhieb"
  )
end

function me.TestSoundDownSchildhieb()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildhieb",
    "schildhieb"
  )
end

function me.TestParseBerserkerwut()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerwut",
    "berserkerwut",
    "$player$ bekommt Berserkerwut.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBerserkerwut()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBerserkerwut",
    "berserkerwut",
    "Berserkerwut schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTollkuehnheit()
  mod.testHelper.TestParse(
    className,
    "TestParseTollkuehnheit",
    "tollkuehnheit",
    "$player$ bekommt Tollkühnheit.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTollkuehnheit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTollkuehnheit",
    "tollkuehnheit",
    "Tollkühnheit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTodeswunsch()
  mod.testHelper.TestParse(
    className,
    "TestParseTodeswunsch",
    "todeswunsch",
    "$player$ bekommt Todeswunsch.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTodeswunsch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTodeswunsch",
    "todeswunsch",
    "Todeswunsch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchildwall()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildwall",
    "schildwall",
    "$player$ bekommt Schildwall.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchildwall()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchildwall",
    "schildwall",
    "Schildwall schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKampfhaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseKampfhaltung",
    "kampfhaltung",
    "$player$ bekommt Kampfhaltung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseBerserkerhaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerhaltung",
    "berserkerhaltung",
    "$player$ bekommt Berserkerhaltung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseVerteidigungshaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerteidigungshaltung",
    "verteidigungshaltung",
    "$player$ bekommt Verteidigungshaltung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSturmangriffsbetaeubung()
  mod.testHelper.TestParse(
    className,
    "TestParseSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "Ihr seid von Sturmangriffsbetäubung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseLetztesGefecht()
  mod.testHelper.TestParse(
    className,
    "TestParseLetztesGefecht",
    "letztes_gefecht",
    "$player$ bekommt Letztes Gefecht.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownLetztesGefecht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownLetztesGefecht",
    "letztes_gefecht",
    "Letztes Gefecht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEntwaffnen()
  mod.testHelper.TestParse(
    className,
    "TestParseEntwaffnen",
    "entwaffnen",
    "Ihr seid von Entwaffnen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseErschuetternderSchlag()
  mod.testHelper.TestParse(
    className,
    "TestParseErschuetternderSchlag",
    "erschuetternder_schlag",
    "Ihr seid von Erschütternder Schlag betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBlutrausch()
  mod.testHelper.TestParse(
    className,
    "TestParseBlutrausch",
    "blutrausch",
    "$player$ bekommt Blutrausch.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBlutrausch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBlutrausch",
    "blutrausch",
    "Blutrausch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseZuschlagen()
  mod.testHelper.TestParse(
    className,
    "TestParseZuschlagen",
    "zuschlagen",
    "$player$ trifft Euch (mit Zuschlagen). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritZuschlagen()
  mod.testHelper.TestParse(
    className,
    "TestParseCritZuschlagen",
    "zuschlagen",
    "$player$ trifft Euch kritisch (mit Zuschlagen). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseBetaeubungAbfangen()
  mod.testHelper.TestParse(
    className,
    "TestParseBetaeubungAbfangen",
    "betaeubung_abfangen",
    "Ihr seid von Betäubung abfangen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseDrohruf()
  mod.testHelper.TestParse(
    className,
    "TestParseDrohruf",
    "drohruf",
    "Ihr seid von Drohruf betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSchildhieb()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildhieb",
    "schildhieb",
    "$player$ bekommt Schildhieb.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchildhieb()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchildhieb",
    "schildhieb",
    "Schildhieb schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end
