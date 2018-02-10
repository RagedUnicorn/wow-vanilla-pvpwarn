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
mod.testPriestDe = me

me.tag = "TestPriestDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[4]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PRIEST_DE__Test()
  mod.testReporter.StartTestRun("global_priest_de_all")
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

function _G.__PVPW__TEST_PRIEST_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_priest_de_parse_crit")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychischerSchrei)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStille)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeeleDerMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeeleDerMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInneresFeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInneresFeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampirumarmung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerzweifeltesGebet)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerschlingendeSeuche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFurchtzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFurchtzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElunesAnmut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElunesAnmut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSternensplitter)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerhexungDerSchwaeche)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParsePsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseStille)
  mod.testReporter.AddToTestQueue(me.TestParseSeeleDerMacht)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeeleDerMacht)
  mod.testReporter.AddToTestQueue(me.TestParseInneresFeuer)
  mod.testReporter.AddToTestQueue(me.TestParseDownInneresFeuer)
  mod.testReporter.AddToTestQueue(me.TestParsVampirumarmung)
  mod.testReporter.AddToTestQueue(me.TestParseVerzweifeltesGebet)
  mod.testReporter.AddToTestQueue(me.TestParseCritVerzweifeltesGebet)
  mod.testReporter.AddToTestQueue(me.TestParseVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueue(me.TestParseDownBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueue(me.TestParseFurchtzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownFurchtzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseElunesAnmut)
  mod.testReporter.AddToTestQueue(me.TestParseDownElunesAnmut)
  mod.testReporter.AddToTestQueue(me.TestParseSternensplitter)
  mod.testReporter.AddToTestQueue(me.TestParseHexOfWeakness)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundPsychischerSchrei()
  mod.testHelper.TestSound(
    className,
    "TestSoundPsychischerSchrei",
    "psychischer_schrei"
  )
end

function me.TestSoundStille()
  mod.testHelper.TestSound(
    className,
    "TestSoundStille",
    "stille"
  )
end

function me.TestSoundSeeleDerMacht()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeeleDerMacht",
    "seele_der_macht"
  )
end

function me.TestSoundDownSeeleDerMacht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeeleDerMacht",
    "seele_der_macht"
  )
end

function me.TestSoundInneresFeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundInneresFeuer",
    "inneres_feuer"
  )
end

function me.TestSoundDownInneresFeuer()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInneresFeuer",
    "inneres_feuer"
  )
end

function me.TestSoundVampirumarmung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVampirumarmung",
    "vampirumarmung"
  )
end

function me.TestSoundVerzweifeltesGebet()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerzweifeltesGebet",
    "verzweifeltes_gebet"
  )
end

function me.TestSoundVerschlingendeSeuche()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerschlingendeSeuche",
    "verschlingende_seuche"
  )
end

function me.TestSoundBeruehrungDerSchwaeche()
  mod.testHelper.TestSound(
    className,
    "TestSoundBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche"
  )
end

function me.TestSoundDownBeruehrungDerSchwaeche()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche"
  )
end

function me.TestSoundFurchtzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFurchtzauberschutz",
    "furchtzauberschutz"
  )
end

function me.TestSoundDownFurchtzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFurchtzauberschutz",
    "furchtzauberschutz"
  )
end

function me.TestSoundElunesAnmut()
  mod.testHelper.TestSound(
    className,
    "TestSoundElunesAnmut",
    "elunes_anmut"
  )
end

function me.TestSoundDownElunesAnmut()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownElunesAnmut",
    "elunes_anmut"
  )
end

function me.TestSoundSternensplitter()
  mod.testHelper.TestSound(
    className,
    "TestSoundSternensplitter",
    "sternensplitter"
  )
end

function me.TestSoundVerhexungDerSchwaeche()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerhexungDerSchwaeche",
    "verhexung_der_schwaeche"
  )
end

function me.TestParsePsychischerSchrei()
  mod.testHelper.TestParse(
    className,
    "TestParsePsychischerSchrei",
    "psychischer_schrei",
    "Ihr seid von Psychischer Schrei betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseStille()
  mod.testHelper.TestParse(
    className,
    "TestParseStille",
    "stille",
    "Ihr seid von Stille betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeeleDerMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseSeeleDerMacht",
    "seele_der_macht",
    "$player$ bekommt Seele der Macht.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeeleDerMacht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeeleDerMacht",
    "seele_der_macht",
    "Seele der Macht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseInneresFeuer()
  mod.testHelper.TestParse(
    className,
    "TestParseInneresFeuer",
    "inneres_feuer",
    "$player$ bekommt Inneres Feuer.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInneresFeuer()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInneresFeuer",
    "inneres_feuer",
    "Inneres Feuer schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVampirumarmung()
  mod.testHelper.TestParse(
    className,
    "TestParsVampirumarmung",
    "vampirumarmung",
    "Ihr seid von Vampirumarmung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerzweifeltesGebet()
  mod.testHelper.TestParse(
    className,
    "TestParseVerzweifeltesGebet",
    "verzweifeltes_gebet",
    "$player$s Verzweifeltes Gebet heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCritVerzweifeltesGebet()
  mod.testHelper.TestParse(
    className,
    "TestParseCritVerzweifeltesGebet",
    "verzweifeltes_gebet",
    "Kritische Heilung: $player$s Verzweifeltes Gebet heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseVerschlingendeSeuche()
  mod.testHelper.TestParse(
    className,
    "TestParseVerschlingendeSeuche",
    "verschlingende_seuche",
    "Ihr seid von Verschlingende Seuche betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBeruehrungDerSchwaeche()
  mod.testHelper.TestParse(
    className,
    "TestParseBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche",
    "$player$ bekommt Berührung der Schwäche.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBeruehrungDerSchwaeche()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche",
    "Berührung der Schwäche schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFurchtzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFurchtzauberschutz",
    "furchtzauberschutz",
    "$player$ bekommt Furchtzauberschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFurchtzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFurchtzauberschutz",
    "furchtzauberschutz",
    "Furchtzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseElunesAnmut()
  mod.testHelper.TestParse(
    className,
    "TestParseElunesAnmut",
    "elunes_anmut",
    "$player$ bekommt Elunes Anmut.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownElunesAnmut()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownElunesAnmut",
    "elunes_anmut",
    "Elunes Anmut schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSternensplitter()
  mod.testHelper.TestParse(
    className,
    "TestParseSternensplitter",
    "sternensplitter",
    "Ihr seid von Sternensplitter betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerhexungDerSchwaeche()
  mod.testHelper.TestParse(
    className,
    "TestParseVerhexungDerSchwaeche",
    "verhexung_der_schwaeche",
    "Ihr seid von Verhexung der Schwäche betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end
