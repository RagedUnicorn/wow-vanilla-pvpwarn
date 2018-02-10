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
mod.testWarlockDe = me

me.tag = "TestWarlockDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[7]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARLOCK_DE__Test()
  mod.testReporter.StartTestRun("global_warlock_de_all")
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

function _G.__PVPW__TEST_WARLOCK_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_warlock_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warlock_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_warlock_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warlock_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warlock_de_parse_crit")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFurcht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTeufelsbeherschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTeufelsbeherschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenbrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchreckensgeheul)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErheblicherZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownErheblicherZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGrosserZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGrosserZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTodesmantel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchVerstaerken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFluchVerstaerken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchwacherGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGeringerGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGrosserGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErheblicherGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchDerErschoepfung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchDerSprachen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZaubersperre)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeelenverbindung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeelenverbindung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerfuehrung)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseTeufelsbeherschung)
  mod.testReporter.AddToTestQueue(me.TestParseDownTeufelsbeherschung)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchattenzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseErheblicherZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownErheblicherZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseGrosserZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownGrosserZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseFluchVerstaerken)
  mod.testReporter.AddToTestQueue(me.TestParseDownFluchVerstaerken)
  mod.testReporter.AddToTestQueue(me.TestParseSchwacherGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseGeringerGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseGrosserGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseErheblicherGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseFluchDerErschoepfung)
  mod.testReporter.AddToTestQueue(me.TestParseFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueue(me.TestParseZaubersperre)
  mod.testReporter.AddToTestQueue(me.TestParseSeelenverbindung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeelenverbindung)
  mod.testReporter.AddToTestQueue(me.TestParseVerfuehrung)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundFurcht()
  mod.testHelper.TestSound(
    className,
    "TestSoundFurcht",
    "furcht"
  )
end

function me.TestSoundTeufelsbeherschung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTeufelsbeherschung",
    "teufelsbeherschung"
  )
end

function me.TestSoundDownTeufelsbeherschung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTeufelsbeherschung",
    "teufelsbeherschung"
  )
end

function me.TestSoundSchattenbrand()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenbrand",
    "schattenbrand"
  )
end

function me.TestSoundSchattenzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenzauberschutz",
    "schattenzauberschutz"
  )
end

function me.TestSoundDownSchattenzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenzauberschutz",
    "schattenzauberschutz"
  )
end

function me.TestSoundSchreckensgeheul()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchreckensgeheul",
    "schreckensgeheul"
  )
end

function me.TestSoundZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundZauberstein",
    "zauberstein"
  )
end

function me.TestSoundDownZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownZauberstein",
    "zauberstein"
  )
end

function me.TestSoundErheblicherZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundErheblicherZauberstein",
    "erheblicher_zauberstein"
  )
end

function me.TestSoundDownErheblicherZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownErheblicherZauberstein",
    "erheblicher_zauberstein"
  )
end

function me.TestSoundGrosserZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGrosserZauberstein",
    "grosser_zauberstein"
  )
end

function me.TestSoundDownGrosserZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGrosserZauberstein",
    "grosser_zauberstein"
  )
end

function me.TestSoundTodesmantel()
  mod.testHelper.TestSound(
    className,
    "TestSoundTodesmantel",
    "todesmantel"
  )
end

function me.TestSoundFluchVerstaerken()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchVerstaerken",
    "fluch_verstaerken"
  )
end

function me.TestSoundDownFluchVerstaerken()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFluchVerstaerken",
    "fluch_verstaerken"
  )
end

function me.TestSoundSchwacherGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchwacherGesundheitsstein",
    "schwacher_gesundheitsstein"
  )
end

function me.TestSoundGeringerGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGeringerGesundheitsstein",
    "geringer_gesundheitsstein"
  )
end

function me.TestSoundGrosserGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGrosserGesundheitsstein",
    "grosser_gesundheitsstein"
  )
end

function me.TestSoundErheblicherGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundErheblicherGesundheitsstein",
    "erheblicher_gesundheitsstein"
  )
end

function me.TestSoundFluchDerErschoepfung()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchDerErschoepfung",
    "fluch_der_erschoepfung"
  )
end

function me.TestSoundFluchDerSprachen()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchDerSprachen",
    "fluch_der_sprachen"
  )
end

function me.TestSoundSeelensteinAuferstehung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeelensteinAuferstehung",
    "seelenstein_auferstehung"
  )
end

function me.TestSoundDownSeelensteinAuferstehung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeelensteinAuferstehung",
    "seelenstein_auferstehung"
  )
end

function me.TestSoundZaubersperre()
  mod.testHelper.TestSound(
    className,
    "TestSoundZaubersperre",
    "zaubersperre"
  )
end

function me.TestSoundSeelenverbindung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeelenverbindung",
    "seelenverbindung"
  )
end

function me.TestSoundDownSeelenverbindung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeelenverbindung",
    "seelenverbindung"
  )
end

function me.TestSoundVerfuehrung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerfuehrung",
    "verfuehrung"
  )
end

function me.TestParseFurcht()
  mod.testHelper.TestParse(
    className,
    "TestParseFurcht",
    "furcht",
    "Ihr seid von Furcht betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseTeufelsbeherschung()
  mod.testHelper.TestParse(
    className,
    "TestParseTeufelsbeherschung",
    "teufelsbeherschung",
    "$player$ bekommt Teufelsbeherschung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTeufelsbeherschung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTeufelsbeherschung",
    "teufelsbeherschung",
    "Teufelsbeherschung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchattenbrand()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenbrand",
    "schattenbrand",
    "Ihr seid von Schattenbrand betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSchattenzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenzauberschutz",
    "schattenzauberschutz",
    "$player$ bekommt Schattenzauberschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchattenzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchattenzauberschutz",
    "schattenzauberschutz",
    "Schattenzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchreckensgeheul()
  mod.testHelper.TestParse(
    className,
    "TestParseSchreckensgeheul",
    "schreckensgeheul",
    "Ihr seid von Schreckensgeheul betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseZauberstein",
    "zauberstein",
    "$player$ bekommt Zauberstein.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownZauberstein",
    "zauberstein",
    "Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseErheblicherZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseErheblicherZauberstein",
    "erheblicher_zauberstein",
    "$player$ bekommt Erheblicher Zauberstein.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownErheblicherZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownErheblicherZauberstein",
    "erheblicher_zauberstein",
    "Erheblicher Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGrosserZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGrosserZauberstein",
    "grosser_zauberstein",
    "$player$ bekommt Großer Zauberstein.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGrosserZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGrosserZauberstein",
    "grosser_zauberstein",
    "Großer Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTodesmantel()
  mod.testHelper.TestParse(
    className,
    "TestParseTodesmantel",
    "todesmantel",
    "Ihr seid von Todesmantel betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFluchVerstaerken()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchVerstaerken",
    "fluch_verstaerken",
    "$player$ bekommt Fluch verstärken.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFluchVerstaerken()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFluchVerstaerken",
    "fluch_verstaerken",
    "Fluch verstärken schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchwacherGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseSchwacherGesundheitsstein",
    "schwacher_gesundheitsstein",
    "$player$s Schwacher Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGeringerGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGeringerGesundheitsstein",
    "geringer_gesundheitsstein",
    "$player$s Geringer Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGrosserGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGrosserGesundheitsstein",
    "grosser_gesundheitsstein",
    "$player$s Großer Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseErheblicherGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseErheblicherGesundheitsstein",
    "major_healthstone",
    "$player$s Erheblicher Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFluchDerErschoepfung()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchDerErschoepfung",
    "fluch_der_erschoepfung",
    "Ihr seid von Fluch der Erschöpfung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFluchDerSprachen()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchDerSprachen",
    "fluch_der_sprachen",
    "Ihr seid von Fluch der Sprachen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeelensteinAuferstehung()
  mod.testHelper.TestParse(
    className,
    "TestParseSeelensteinAuferstehung",
    "seelenstein_auferstehung",
    "$player$ bekommt Seelenstein-Auferstehung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeelensteinAuferstehung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeelensteinAuferstehung",
    "seelenstein_auferstehung",
    "Seelenstein-Auferstehung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseZaubersperre()
  mod.testHelper.TestParse(
    className,
    "TestParseZaubersperre",
    "zaubersperre",
    "Ihr seid von Zaubersperre betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeelenverbindung()
  mod.testHelper.TestParse(
    className,
    "TestParseSeelenverbindung",
    "seelenverbindung",
    "$player$ bekommt Seelenverbindung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeelenverbindung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeelenverbindung",
    "seelenverbindung",
    "Seelenverbindung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVerfuehrung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerfuehrung",
    "verfuehrung",
    "Ihr seid von Verführung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end
