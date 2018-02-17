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
  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidParseTestForEachSpell(me, className)

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

function _G.__PVPW__TEST_HUNTER_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_hunter_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_hunter_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_hunter_de_parse_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidParseTestForEachSpell(me, className)
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGezielterSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidErschuetternderSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidStreuschuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchlangenbiss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVipernbiss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEiskaeltefalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidZurechtstutzen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGezielterSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidErschuetternderSchuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidStreuschuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchlangenbiss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVipernbiss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEiskaeltefalle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidZurechtstutzen)

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
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGezielterSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissGezielterSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneStreuschuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissStreuschuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchlangenbiss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissSchlangenbiss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVipernbiss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissVipernbiss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneEiskaeltefalle)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGezielterSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissGezielterSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistErschuetternderSchuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneStreuschuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissStreuschuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchlangenbiss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissSchlangenbiss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVipernbiss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissVipernbiss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneEiskaeltefalle)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockZurechtstutzen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistZurechtstutzen)

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

function me.TestSoundEnemyAvoidGezielterSchuss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGezielterSchuss",
    "gezielter_schuss"
  )
end

function me.TestSoundEnemyAvoidErschuetternderSchuss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidErschuetternderSchuss",
    "erschuetternder_schuss"
  )
end

function me.TestSoundEnemyAvoidStreuschuss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidStreuschuss",
    "streuschuss"
  )
end

function me.TestSoundEnemyAvoidSchlangenbiss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchlangenbiss",
    "schlangenbiss"
  )
end

function me.TestSoundEnemyAvoidVipernbiss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVipernbiss",
    "vipernbiss"
  )
end

function me.TestSoundEnemyAvoidEiskaeltefalle()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidEiskaeltefalle",
    "eiskaeltefalle"
  )
end

function me.TestSoundEnemyAvoidZurechtstutzen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidZurechtstutzen",
    "zurechtstutzen"
  )
end

function me.TestSoundSelfAvoidGezielterSchuss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGezielterSchuss",
    "gezielter_schuss"
  )
end

function me.TestSoundSelfAvoidErschuetternderSchuss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidErschuetternderSchuss",
    "erschuetternder_schuss"
  )
end

function me.TestSoundSelfAvoidStreuschuss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidStreuschuss",
    "streuschuss"
  )
end

function me.TestSoundSelfAvoidSchlangenbiss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchlangenbiss",
    "schlangenbiss"
  )
end

function me.TestSoundSelfAvoidVipernbiss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVipernbiss",
    "vipernbiss"
  )
end

function me.TestSoundSelfAvoidEiskaeltefalle()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidEiskaeltefalle",
    "eiskaeltefalle"
  )
end

function me.TestSoundSelfAvoidZurechtstutzen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidZurechtstutzen",
    "zurechtstutzen"
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

function me.TestParseEnemyAvoidImmuneGezielterSchuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGezielterSchuss",
    "gezielter_schuss",
    "Gezielter Schuss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissGezielterSchuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissGezielterSchuss",
    "gezielter_schuss",
    "Gezielter Schuss hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneErschuetternderSchuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneErschuetternderSchuss",
    "erschuetternder_schuss",
    "Erschütternder Schuss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissErschuetternderSchuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissErschuetternderSchuss",
    "erschuetternder_schuss",
    "Erschütternder Schuss hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistErschuetternderSchuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistErschuetternderSchuss",
    "erschuetternder_schuss",
    "Ihr habt es mit Erschütternder Schuss versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneStreuschuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneStreuschuss",
    "streuschuss",
    "Streuschuss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissStreuschuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissStreuschuss",
    "streuschuss",
    "Streuschuss hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneSchlangenbiss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchlangenbiss",
    "schlangenbiss",
    "Schlangenbiss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissSchlangenbiss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissSchlangenbiss",
    "schlangenbiss",
    "Schlangenbiss hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneVipernbiss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVipernbiss",
    "vipernbiss",
    "Vipernbiss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissVipernbiss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissVipernbiss",
    "vipernbiss",
    "Vipernbiss hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneEiskaeltefalle()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneEiskaeltefalle",
    "eiskaeltefalle",
    "Eiskältefalle war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidDodgeZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeZurechtstutzen",
    "zurechtstutzen",
    "$player$ ist Zurechtstutzen ausgewichen.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryZurechtstutzen",
    "zurechtstutzen",
    "Zurechtstutzen wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneZurechtstutzen",
    "zurechtstutzen",
    "Zurechtstutzen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissZurechtstutzen",
    "zurechtstutzen",
    "Zurechtstutzen hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockZurechtstutzen",
    "zurechtstutzen",
    "Zurechtstutzen wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidResistZurechtstutzen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistZurechtstutzen",
    "zurechtstutzen",
    "Ihr habt es mit Zurechtstutzen versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneGezielterSchuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGezielterSchuss",
    "gezielter_schuss",
    "$player$ versucht es mit Gezielter Schuss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissGezielterSchuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissGezielterSchuss",
    "gezielter_schuss",
    "$player$ greift an (mit Gezielter Schuss) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneErschuetternderSchuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneErschuetternderSchuss",
    "erschuetternder_schuss",
    "$player$ versucht es mit Erschütternder Schuss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissErschuetternderSchuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissErschuetternderSchuss",
    "erschuetternder_schuss",
    "$player$ greift an (mit Erschütternder Schuss) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistErschuetternderSchuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistErschuetternderSchuss",
    "erschuetternder_schuss",
    "$player$ versucht es mit Erschütternder Schuss... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneStreuschuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneStreuschuss",
    "streuschuss",
    "$player$ versucht es mit Streuschuss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissStreuschuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissStreuschuss",
    "streuschuss",
    "$player$ greift an (mit Streuschuss) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneSchlangenbiss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchlangenbiss",
    "schlangenbiss",
    "$player$ versucht es mit Schlangenbiss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissSchlangenbiss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissSchlangenbiss",
    "schlangenbiss",
    "$player$ greift an (mit Schlangenbiss) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneVipernbiss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVipernbiss",
    "vipernbiss",
    "$player$ versucht es mit Vipernbiss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissVipernbiss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissVipernbiss",
    "vipernbiss",
    "$player$ greift an (mit Vipernbiss) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneEiskaeltefalle()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneEiskaeltefalle",
    "eiskaeltefalle",
    "$player$ versucht es mit Eiskältefalle... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidDodgeZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeZurechtstutzen",
    "zurechtstutzen",
    "$player$s Zurechtstutzen wurde ausgewichen.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryZurechtstutzen",
    "zurechtstutzen",
    "Zurechtstutzen von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneZurechtstutzen",
    "zurechtstutzen",
    "$player$ versucht es mit Zurechtstutzen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissZurechtstutzen",
    "zurechtstutzen",
    "$player$ greift an (mit Zurechtstutzen) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockZurechtstutzen",
    "zurechtstutzen",
    "$player$s Zurechtstutzen wurde geblockt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidResistZurechtstutzen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistZurechtstutzen",
    "zurechtstutzen",
    "$player$ versucht es mit Zurechtstutzen... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
