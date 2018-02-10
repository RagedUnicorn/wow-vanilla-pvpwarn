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
mod.testMageDe = me

me.tag = "TestMageDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[6]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_MAGE_DE__Test()
  mod.testReporter.StartTestRun("global_mage_de_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_MAGE_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_mage_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_mage_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MAGE_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_mage_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_mage_de_parse_down")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEisblock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEisblock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerwandlung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerwandlungKuh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerwandlungSchwein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerwandlungKroete)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlinzeln)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeuerzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFeuerzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaschild)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaschild)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEisbarriere)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEisbarriere)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArkaneMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArkaneMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHervorrufung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGeistesgegenwart)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGeistesgegenwart)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerbrennung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVerbrennung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDruckwelle)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseEisblock)
  mod.testReporter.AddToTestQueue(me.TestParseDownEisblock)
  mod.testReporter.AddToTestQueue(me.TestParseVerwandlung)
  mod.testReporter.AddToTestQueue(me.TestParseVerwandlungSchwein)
  mod.testReporter.AddToTestQueue(me.TestParseVerwandlungKuh)
  mod.testReporter.AddToTestQueue(me.TestParseVerwandlungKroete)
  mod.testReporter.AddToTestQueue(me.TestParseBlinzeln)
  mod.testReporter.AddToTestQueue(me.TestParseFeuerzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownFeuerzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseFrostzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueue(me.TestParseManaschild)
  mod.testReporter.AddToTestQueue(me.TestParseDownManaschild)
  mod.testReporter.AddToTestQueue(me.TestParseEisbarriere)
  mod.testReporter.AddToTestQueue(me.TestParseDownEisbarriere)
  mod.testReporter.AddToTestQueue(me.TestParseFrostnova)
  mod.testReporter.AddToTestQueue(me.TestParseArkaneMacht)
  mod.testReporter.AddToTestQueue(me.TestParseDownArkaneMacht)
  mod.testReporter.AddToTestQueue(me.TestParseHervorrufung)
  mod.testReporter.AddToTestQueue(me.TestParseGeistesgegenwart)
  mod.testReporter.AddToTestQueue(me.TestParseDownGeistesgegenwart)
  mod.testReporter.AddToTestQueue(me.TestParseVerbrennung)
  mod.testReporter.AddToTestQueue(me.TestParseDownVerbrennung)
  mod.testReporter.AddToTestQueue(me.TestParseDruckwelle)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundEisblock()
  mod.testHelper.TestSound(
    className,
    "TestSoundEisblock",
    "eisblock"
  )
end

function me.TestSoundDownEisblock()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEisblock",
    "eisblock"
  )
end

function me.TestSoundVerwandlung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerwandlung",
    "verwandlung"
  )
end

function me.TestSoundVerwandlungKuh()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerwandlungKuh",
    "verwandlung_kuh"
  )
end

function me.TestSoundVerwandlungSchwein()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerwandlungSchwein",
    "verwandlung_schwein"
  )
end

function me.TestSoundVerwandlungKroete()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerwandlungKroete",
    "verwandlung_kroete"
  )
end

function me.TestSoundBlinzeln()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlinzeln",
    "blinzeln"
  )
end

function me.TestSoundFeuerzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeuerzauberschutz",
    "feuerzauberschutz"
  )
end

function me.TestSoundDownFeuerzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFeuerzauberschutz",
    "feuerzauberschutz"
  )
end

function me.TestSoundFrostzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostzauberschutz",
    "frostzauberschutz"
  )
end

function me.TestSoundDownFrostzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostzauberschutz",
    "frostzauberschutz"
  )
end

function me.TestSoundGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestSound(
    className,
    "TestSoundGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht"
  )
end

function me.TestSoundManaschild()
  mod.testHelper.TestSound(
    className,
    "TestSoundManaschild",
    "manaschild"
  )
end

function me.TestSoundDownManaschild()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownManaschild",
    "manaschild"
  )
end

function me.TestSoundEisbarriere()
  mod.testHelper.TestSound(
    className,
    "TestSoundEisbarriere",
    "eisbarriere"
  )
end

function me.TestSoundDownEisbarriere()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEisbarriere",
    "eisbarriere"
  )
end

function me.TestSoundFrostNova()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostNova",
    "frost_nova"
  )
end

function me.TestSoundArkaneMacht()
  mod.testHelper.TestSound(
    className,
    "TestSoundArkaneMacht",
    "arkane_macht"
  )
end

function me.TestSoundDownArkaneMacht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownArkaneMacht",
    "arkane_macht"
  )
end

function me.TestSoundHervorrufung()
  mod.testHelper.TestSound(
    className,
    "TestSoundHervorrufung",
    "hervorrufung"
  )
end

function me.TestSoundGeistesgegenwart()
  mod.testHelper.TestSound(
    className,
    "TestSoundGeistesgegenwart",
    "geistesgegenwart"
  )
end

function me.TestSoundDownGeistesgegenwart()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGeistesgegenwart",
    "geistesgegenwart"
  )
end

function me.TestSoundVerbrennung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerbrennung",
    "verbrennung"
  )
end

function me.TestSoundDownVerbrennung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownVerbrennung",
    "verbrennung"
  )
end

function me.TestSoundDruckwelle()
  mod.testHelper.TestSound(
    className,
    "TestSoundDruckwelle",
    "druckwelle"
  )
end

function me.TestParseEisblock()
  mod.testHelper.TestParse(
    className,
    "TestParseEisblock",
    "eisblock",
    "$player$ bekommt Eisblock.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEisblock()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEisblock",
    "eisblock",
    "Eisblock schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVerwandlung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerwandlung",
    "verwandlung",
    "Ihr seid von Verwandlung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerwandlungSchwein()
  mod.testHelper.TestParse(
    className,
    "TestParseVerwandlungSchwein",
    "verwandlung_schwein",
    "Ihr seid von Verwandlung: Schwein betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerwandlungKuh()
  mod.testHelper.TestParse(
    className,
    "TestParseVerwandlungKuh",
    "verwandlung_kuh",
    "Ihr seid von Verwandlung: Kuh betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerwandlungKroete()
  mod.testHelper.TestParse(
    className,
    "TestParseVerwandlungKroete",
    "verwandlung_kroete",
    "Ihr seid von Verwandlung: Kröte betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBlinzeln()
  mod.testHelper.TestParse(
    className,
    "TestParseBlinzeln",
    "blinzeln",
    "$player$ bekommt Blinzeln.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseFeuerzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFeuerzauberschutz",
    "feuerzauberschutz",
    "$player$ bekommt Feuerzauberschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFeuerzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFeuerzauberschutz",
    "feuerzauberschutz",
    "Feuerzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostzauberschutz",
    "frostzauberschutz",
    "$player$ bekommt Frostzauberschutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostzauberschutz",
    "frostzauberschutz",
    "Frostzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestParse(
    className,
    "TestParseGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht",
    "Ihr seid von Gegenzauber - zum Schweigen gebracht betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseManaschild()
  mod.testHelper.TestParse(
    className,
    "TestParseManaschild",
    "manaschild",
    "$player$ bekommt Manaschild.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownManaschild()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownManaschild",
    "manaschild",
    "Manaschild schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEisbarriere()
  mod.testHelper.TestParse(
    className,
    "TestParseEisbarriere",
    "eisbarriere",
    "$player$ bekommt Eisbarriere.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEisbarriere()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEisbarriere",
    "eisbarriere",
    "Eisbarriere schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostnova()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostnova",
    "frost_nova",
    "Ihr seid von Frostnova betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseArkaneMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseArkaneMacht",
    "arkane_macht",
    "$player$ bekommt Arkane Macht.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownArkaneMacht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownArkaneMacht",
    "arkane_macht",
    "Arkane Macht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHervorrufung()
  mod.testHelper.TestParse(
    className,
    "TestParseHervorrufung",
    "hervorrufung",
    "$player$ bekommt Hervorrufung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseGeistesgegenwart()
  mod.testHelper.TestParse(
    className,
    "TestParseGeistesgegenwart",
    "geistesgegenwart",
    "$player$ bekommt Geistesgegenwart.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGeistesgegenwart()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGeistesgegenwart",
    "geistesgegenwart",
    "Geistesgegenwart schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVerbrennung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerbrennung",
    "verbrennung",
    "$player$ bekommt Verbrennung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownVerbrennung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownVerbrennung",
    "verbrennung",
    "Verbrennung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDruckwelle()
  mod.testHelper.TestParse(
    className,
    "TestParseDruckwelle",
    "druckwelle",
    "Ihr seid von Druckwelle betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end
