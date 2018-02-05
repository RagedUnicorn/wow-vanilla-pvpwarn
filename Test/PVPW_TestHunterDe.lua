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
mod.testHunterDe = me

me.tag = "TestHunterDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[9]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_HUNTER_DE__Test()
  mod.testReporter.StartTestRun("global_hunter_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_hunter_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_hunter_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_hunter_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_hunter_de_parse_down")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErschuetternderSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerbesserterErschuetternderSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspektDesAffen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspektDesFalken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchnellfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchnellfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAbschreckung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAbschreckung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprengfalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEiskaeltefalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeuerbrandfalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostfalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStichDesFluegeldrachen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVipernbiss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStreuschuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLeuchtfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildtierAengstigen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEinschuechterung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEinschuechterung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZornDesWildtiers)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownZornDesWildtiers)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseVerbesserterErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseAspektDesAffen)
  mod.testReporter.AddToTestQueue(me.TestParseAspektDesFalken)
  mod.testReporter.AddToTestQueue(me.TestParseSchnellfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchnellfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseAbschreckung)
  mod.testReporter.AddToTestQueue(me.TestParseDownAbschreckung)
  mod.testReporter.AddToTestQueue(me.TestParseSprengfalle)
  mod.testReporter.AddToTestQueue(me.TestParseEiskaeltefalle)
  mod.testReporter.AddToTestQueue(me.TestParseFeuerbrandfalle)
  mod.testReporter.AddToTestQueue(me.TestParseFrostfalle)
  mod.testReporter.AddToTestQueue(me.TestParseStichDesFluegeldrachen)
  mod.testReporter.AddToTestQueue(me.TestParseVipernbiss)
  mod.testReporter.AddToTestQueue(me.TestParseStreuschuss)
  mod.testReporter.AddToTestQueue(me.TestParseLeuchtfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseWildtierAengstigen)
  mod.testReporter.AddToTestQueue(me.TestParseEinschuechterung)
  mod.testReporter.AddToTestQueue(me.TestParseDownEinschuechterung)
  mod.testReporter.AddToTestQueue(me.TestParseZornDesWildtiers)
  mod.testReporter.AddToTestQueue(me.TestParseDownZornDesWildtiers)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundErschuetternderSchuss()
  mod.testHelper.TestSound(
    className,
    "TestSoundErschuetternderSchuss",
    "erschuetternder_schuss"
  )
end

function me.TestSoundVerbesserterErschuetternderSchuss()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerbesserterErschuetternderSchuss",
    "verbesserter_erschuetternder_schuss"
  )
end

function me.TestSoundAspektDesAffen()
  mod.testHelper.TestSound(
    className,
    "TestSoundAspektDesAffen",
    "aspekt_des_affen"
  )
end

function me.TestSoundAspektDesFalken()
  mod.testHelper.TestSound(
    className,
    "TestSoundAspektDesFalken",
    "aspekt_des_falken"
  )
end

function me.TestSoundSchnellfeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchnellfeuer",
    "schnellfeuer"
  )
end

function me.TestSoundDownSchnellfeuer()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchnellfeuer",
    "schnellfeuer"
  )
end

function me.TestSoundAbschreckung()
  mod.testHelper.TestSound(
    className,
    "TestSoundAbschreckung",
    "abschreckung"
  )
end

function me.TestSoundDownAbschreckung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAbschreckung",
    "abschreckung"
  )
end

function me.TestSoundSprengfalle()
  mod.testHelper.TestSound(
    className,
    "TestSoundSprengfalle",
    "sprengfalle"
  )
end

function me.TestSoundEiskaeltefalle()
  mod.testHelper.TestSound(
    className,
    "TestSoundEiskaeltefalle",
    "eiskaeltefalle"
  )
end

function me.TestSoundFeuerbrandfalle()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeuerbrandfalle",
    "feuerbrandfalle"
  )
end

function me.TestSoundFrostfalle()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostfalle",
    "frostfalle"
  )
end

function me.TestSoundStichDesFluegeldrachen()
  mod.testHelper.TestSound(
    className,
    "TestSoundStichDesFluegeldrachen",
    "stich_des_fluegeldrachen"
  )
end

function me.TestSoundVipernbiss()
  mod.testHelper.TestSound(
    className,
    "TestSoundVipernbiss",
    "vipernbiss"
  )
end

function me.TestSoundStreuschuss()
  mod.testHelper.TestSound(
    className,
    "TestSoundStreuschuss",
    "streuschuss"
  )
end

function me.TestSoundLeuchtfeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundLeuchtfeuer",
    "leuchtfeuer"
  )
end

function me.TestSoundWildtierAengstigen()
  mod.testHelper.TestSound(
    className,
    "TestSoundWildtierAengstigen",
    "wildtier_aengstigen"
  )
end

function me.TestSoundEinschuechterung()
  mod.testHelper.TestSound(
    className,
    "TestSoundEinschuechterung",
    "einschuechterung"
  )
end

function me.TestSoundDownEinschuechterung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEinschuechterung",
    "einschuechterung"
  )
end

function me.TestSoundZornDesWildtiers()
  mod.testHelper.TestSound(
    className,
    "TestSoundZornDesWildtiers",
    "zorn_des_wildtiers"
  )
end

function me.TestSoundDownZornDesWildtiers()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownZornDesWildtiers",
    "zorn_des_wildtiers"
  )
end

function me.TestParseErschuetternderSchuss()
  mod.testHelper.TestParse(
    className,
    "TestParseErschuetternderSchuss",
    "erschuetternder_schuss",
    "Ihr seid von Erschütternder Schuss betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerbesserterErschuetternderSchuss()
  mod.testHelper.TestParse(
    className,
    "TestParseVerbesserterErschuetternderSchuss",
    "verbesserter_erschuetternder_schuss",
    "Ihr seid von Verbesserter erschütternder Schuss betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAspektDesAffen()
  mod.testHelper.TestParse(
    className,
    "TestParseAspektDesAffen",
    "aspekt_des_affen",
    "$player$ bekommt Aspekt des Affen.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseAspektDesFalken()
  mod.testHelper.TestParse(
    className,
    "TestParseAspektDesFalken",
    "aspekt_des_falken",
    "$player$ bekommt Aspekt des Falken.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSchnellfeuer()
  mod.testHelper.TestParse(
    className,
    "TestParseSchnellfeuer",
    "schnellfeuer",
    "$player$ bekommt Schnellfeuer.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchnellfeuer()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchnellfeuer",
    "schnellfeuer",
    "Schnellfeuer schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAbschreckung()
  mod.testHelper.TestParse(
    className,
    "TestParseAbschreckung",
    "abschreckung",
    "$player$ bekommt Abschreckung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAbschreckung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAbschreckung",
    "abschreckung",
    "Abschreckung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSprengfalle()
  mod.testHelper.TestParse(
    className,
    "TestParseSprengfalle",
    "sprengfalle",
    "$player$ wirkt Sprengfalle.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseEiskaeltefalle()
  mod.testHelper.TestParse(
    className,
    "TestParseEiskaeltefalle",
    "eiskaeltefalle",
    "$player$ wirkt Eiskältefalle.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFeuerbrandfalle()
  mod.testHelper.TestParse(
    className,
    "TestParseFeuerbrandfalle",
    "feuerbrandfalle",
    "$player$ wirkt Feuerbrandfalle.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFrostfalle()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostfalle",
    "frostfalle",
    "$player$ wirkt Frostfalle.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseStichDesFluegeldrachen()
  mod.testHelper.TestParse(
    className,
    "TestParseStichDesFluegeldrachen",
    "stich_des_fluegeldrachen",
    "Ihr seid von Stich des Flügeldrachen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVipernbiss()
  mod.testHelper.TestParse(
    className,
    "TestParseVipernbiss",
    "vipernbiss",
    "Ihr seid von Vipernbiss betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseStreuschuss()
  mod.testHelper.TestParse(
    className,
    "TestParseStreuschuss",
    "streuschuss",
    "Ihr seid von Streuschuss betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseLeuchtfeuer()
  mod.testHelper.TestParse(
    className,
    "TestParseLeuchtfeuer",
    "leuchtfeuer",
    "Ihr seid von Leuchtfeuer betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseWildtierAengstigen()
  mod.testHelper.TestParse(
    className,
    "TestParseWildtierAengstigen",
    "wildtier_aengstigen",
    "$player$ beginnt Wildtier ängstigen zu wirken.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseEinschuechterung()
  mod.testHelper.TestParse(
    className,
    "TestParseEinschuechterung",
    "einschuechterung",
    "$player$ bekommt Einschüchterung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEinschuechterung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEinschuechterung",
    "einschuechterung",
    "Einschüchterung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseZornDesWildtiers()
  mod.testHelper.TestParse(
    className,
    "TestParseZornDesWildtiers",
    "zorn_des_wildtiers",
    "$player$ bekommt Zorn des Wildtiers.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownZornDesWildtiers()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownZornDesWildtiers",
    "zorn_des_wildtiers",
    "Zorn des Wildtiers schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end
