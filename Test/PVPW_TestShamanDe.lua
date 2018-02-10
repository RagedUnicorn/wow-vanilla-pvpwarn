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
mod.testShamanDe = me

me.tag = "TestShamanDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[5]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SHAMAN_DE__Test()
  mod.testReporter.StartTestRun("global_shaman_de_all")
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

function _G.__PVPW__TEST_SHAMAN_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_shaman_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_shaman_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_SHAMAN_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_shaman_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_shaman_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_SHAMAN_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_shaman_de_parse_crit")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElementarbeherrschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElementarbeherrschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesErdstosses)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerGiftreinigung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerErdung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesFeuerwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerFlammenzunge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerLuftgleichenAnmut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesNaturwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerSteinhaut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerErdstaerke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesWindzorns)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerWindmauer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerErdbindung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerFeuernova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerGluehendenMagma)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerVerbrennung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerSteinklaue)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesFrostwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDesHeilendenFlusses)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerKrankheitsreinigung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerManaquelle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerManaflut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemDerBeruhigendenWinde)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseElementarbeherrschung)
  mod.testReporter.AddToTestQueue(me.TestParseDownElementarbeherrschung)
  mod.testReporter.AddToTestQueue(me.TestParseSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesErdstosses)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerGiftreinigung)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerErdung)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesFeuerwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerFlammenzunge)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerLuftgleichenAnmut)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesNaturwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerSteinhaut)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerErdstaerke)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesWindzorns)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerWindmauer)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerErdbindung)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerFeuernova)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerGluehendenMagma)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerVerbrennung)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerSteinklaue)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesFrostwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDesHeilendenFlusses)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerKrankheitsreinigung)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerManaquelle)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerManaflut)
  mod.testReporter.AddToTestQueue(me.TestParseTotemDerBeruhigendenWinde)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundElementarbeherrschung()
  mod.testHelper.TestSound(
    className,
    "TestSoundElementarbeherrschung",
    "elementarbeherrschung"
  )
end

function me.TestSoundDownElementarbeherrschung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownElementarbeherrschung",
    "elementarbeherrschung"
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

function me.TestSoundTotemDesErdstosses()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesErdstosses",
    "totem_des_erdstosses"
  )
end

function me.TestSoundTotemDerGiftreinigung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerGiftreinigung",
    "totem_der_giftreinigung"
  )
end

function me.TestSoundTotemDerErdung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerErdung",
    "totem_der_erdung"
  )
end

function me.TestSoundTotemDesFeuerwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesFeuerwiderstands",
    "totem_des_feuerwiderstands"
  )
end

function me.TestSoundTotemDerFlammenzunge()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerFlammenzunge",
    "totem_der_flammenzunge"
  )
end

function me.TestSoundTotemDerLuftgleichenAnmut()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerLuftgleichenAnmut",
    "totem_der_luftgleichen_anmut"
  )
end

function me.TestSoundTotemDesNaturwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesNaturwiderstands",
    "totem_des_naturwiderstands"
  )
end

function me.TestSoundTotemDerSteinhaut()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerSteinhaut",
    "totem_der_steinhaut"
  )
end

function me.TestSoundTotemDerErdstaerke()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerErdstaerke",
    "totem_der_erdstaerke"
  )
end

function me.TestSoundTotemDesWindzorns()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesWindzorns",
    "totem_des_windzorns"
  )
end

function me.TestSoundTotemDerWindmauer()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerWindmauer",
    "totem_der_windmauer"
  )
end

function me.TestSoundTotemDerErdbindung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerErdbindung",
    "totem_der_erdbindung"
  )
end

function me.TestSoundTotemDerFeuernova()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerFeuernova",
    "totem_der_feuernova"
  )
end

function me.TestSoundTotemDerGluehendenMagma()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerGluehendenMagma",
    "totem_der_gluehenden_magma"
  )
end

function me.TestSoundTotemDerVerbrennung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerVerbrennung",
    "totem_der_verbrennung"
  )
end

function me.TestSoundTotemDerSteinklaue()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerSteinklaue",
    "totem_der_steinklaue"
  )
end

function me.TestSoundTotemDesFrostwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesFrostwiderstands",
    "totem_des_frostwiderstands"
  )
end

function me.TestSoundTotemDesHeilendenFlusses()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDesHeilendenFlusses",
    "totem_des_heilenden_flusses"
  )
end

function me.TestSoundTotemDerKrankheitsreinigung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerKrankheitsreinigung",
    "totem_der_krankheitsreinigung"
  )
end

function me.TestSoundTotemDerManaquelle()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerManaquelle",
    "totem_der_manaquelle"
  )
end

function me.TestSoundTotemDerManaflut()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerManaflut",
    "totem_der_manaflut"
  )
end

function me.TestSoundTotemDerBeruhigendenWinde()
  mod.testHelper.TestSound(
    className,
    "TestSoundTotemDerBeruhigendenWinde",
    "totem_der_beruhigenden_winde"
  )
end

function me.TestParseElementarbeherrschung()
  mod.testHelper.TestParse(
    className,
    "TestParseElementarbeherrschung",
    "elementarbeherrschung",
    "$player$ bekommt Elementarbeherrschung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownElementarbeherrschung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownElementarbeherrschung",
    "elementarbeherrschung",
    "Elementarbeherrschung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchnelligkeitDerNatur()
  mod.testHelper.TestParse(
    className,
    "TestParseSchnelligkeitDerNatur",
    "schnelligkeit_der_natur",
    "$player$ bekommt Schnelligkeit der Natur.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchnelligkeitDerNatur()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchnelligkeitDerNatur",
    "schnelligkeit_der_natur",
    "Schnelligkeit der Natur schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTotemDesErdstosses()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesErdstosses",
    "totem_des_erdstosses",
    "$player$ wirkt Totem des Erdstoßes.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerGiftreinigung()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerGiftreinigung",
    "totem_der_giftreinigung",
    "$player$ wirkt Totem der Giftreinigung.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerErdung()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerErdung",
    "totem_der_erdung",
    "$player$ wirkt Totem der Erdung.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDesFeuerwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesFeuerwiderstands",
    "totem_des_feuerwiderstands",
    "$player$ wirkt Totem des Feuerwiderstands.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerFlammenzunge()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerFlammenzunge",
    "totem_der_flammenzunge",
    "$player$ wirkt Totem der Flammenzunge.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerLuftgleichenAnmut()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerLuftgleichenAnmut",
    "totem_der_luftgleichen_anmut",
    "$player$ wirkt Totem der luftgleichen Anmut.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDesNaturwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesNaturwiderstands",
    "totem_des_naturwiderstands",
    "$player$ wirkt Totem des Naturwiderstands.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerSteinhaut()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerSteinhaut",
    "totem_der_steinhaut",
    "$player$ wirkt Totem der Steinhaut.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerErdstaerke()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerErdstaerke",
    "totem_der_erdstaerke",
    "$player$ wirkt Totem der Erdstärke.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDesWindzorns()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesWindzorns",
    "totem_des_windzorns",
    "$player$ wirkt Totem des Windzorns.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerWindmauer()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerWindmauer",
    "totem_der_windmauer",
    "$player$ wirkt Totem der Windmauer.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerErdbindung()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerErdbindung",
    "totem_der_erdbindung",
    "$player$ wirkt Totem der Erdbindung.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerFeuernova()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerFeuernova",
    "totem_der_feuernova",
    "$player$ wirkt Totem der Feuernova.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerGluehendenMagma()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerGluehendenMagma",
    "totem_der_gluehenden_magma",
    "$player$ wirkt Totem der glühenden Magma.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerVerbrennung()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerVerbrennung",
    "totem_der_verbrennung",
    "$player$ wirkt Totem der Verbrennung.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerSteinklaue()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerSteinklaue",
    "totem_der_steinklaue",
    "$player$ wirkt Totem der Steinklaue.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDesFrostwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesFrostwiderstands",
    "totem_des_frostwiderstands",
    "$player$ wirkt Totem des Frostwiderstands.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDesHeilendenFlusses()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDesHeilendenFlusses",
    "totem_des_heilenden_flusses",
    "$player$ wirkt Totem des heilenden Flusses.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerKrankheitsreinigung()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerKrankheitsreinigung",
    "totem_der_krankheitsreinigung",
    "$player$ wirkt Totem der Krankheitsreinigung.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerManaquelle()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerManaquelle",
    "totem_der_manaquelle",
    "$player$ wirkt Totem der Manaquelle.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerManaflut()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerManaflut",
    "totem_der_manaflut",
    "$player$ wirkt Totem der Manaflut.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTotemDerBeruhigendenWinde()
  mod.testHelper.TestParse(
    className,
    "TestParseTotemDerBeruhigendenWinde",
    "totem_der_beruhigenden_winde",
    "$player$ wirkt Totem der beruhigenden Winde.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end
