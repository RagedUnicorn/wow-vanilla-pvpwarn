--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
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
  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidParseTestForEachSpell(me, className)

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

function _G.__PVPW__TEST_MAGE_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_mage_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_MAGE_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_mage_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_mage_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostnova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArkaneMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArkaneMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHervorrufung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGeistesgegenwart)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGeistesgegenwart)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerbrennung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVerbrennung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDruckwelle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGegenzauber)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVerwandlung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVerwandlungKuh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVerwandlungSchwein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVerwandlungKroete)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKaeltekegel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostnova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGegenzauber)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerwandlung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerwandlungKuh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerwandlungSchwein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerwandlungKroete)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKaeltekegel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostnova)

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
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGegenzauber)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVerwandlung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVerwandlung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVerwandlungKuh)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVerwandlungKuh)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVerwandlungSchwein)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVerwandlungSchwein)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVerwandlungKroete)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVerwandlungKroete)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKaeltekegel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistKaeltekegel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFrostnova)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFrostnova)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistGegenzauberZumSchweigenGebracht)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGegenzauber)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerwandlung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerwandlung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerwandlungKuh)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerwandlungKuh)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerwandlungSchwein)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerwandlungSchwein)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerwandlungKroete)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerwandlungKroete)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKaeltekegel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistKaeltekegel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFrostnova)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFrostnova)

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

function me.TestSoundFrostnova()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostnova",
    "frostnova"
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

function me.TestSoundEnemyAvoidGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht"
  )
end

function me.TestSoundEnemyAvoidGegenzauber()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGegenzauber",
    "gegenzauber"
  )
end

function me.TestSoundEnemyAvoidVerwandlung()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVerwandlung",
    "verwandlung"
  )
end

function me.TestSoundEnemyAvoidVerwandlungKuh()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVerwandlungKuh",
    "verwandlung_kuh"
  )
end

function me.TestSoundEnemyAvoidVerwandlungSchwein()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVerwandlungSchwein",
    "verwandlung_schwein"
  )
end

function me.TestSoundEnemyAvoidVerwandlungKroete()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVerwandlungKroete",
    "verwandlung_kroete"
  )
end

function me.TestSoundEnemyAvoidKaeltekegel()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKaeltekegel",
    "kaeltekegel"
  )
end

function me.TestSoundEnemyAvoidFrostnova()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFrostnova",
    "frostnova"
  )
end

function me.TestSoundSelfAvoidGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht"
  )
end

function me.TestSoundSelfAvoidGegenzauber()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGegenzauber",
    "gegenzauber"
  )
end

function me.TestSoundSelfAvoidVerwandlung()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerwandlung",
    "verwandlung"
  )
end

function me.TestSoundSelfAvoidVerwandlungKuh()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerwandlungKuh",
    "verwandlung_kuh"
  )
end

function me.TestSoundSelfAvoidVerwandlungSchwein()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerwandlungSchwein",
    "verwandlung_schwein"
  )
end

function me.TestSoundSelfAvoidVerwandlungKroete()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerwandlungKroete",
    "verwandlung_kroete"
  )
end

function me.TestSoundSelfAvoidKaeltekegel()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKaeltekegel",
    "kaeltekegel"
  )
end

function me.TestSoundSelfAvoidFrostnova()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFrostnova",
    "frostnova"
  )
end

function me.TestParseEisblock()
  mod.testHelper.TestParse(
    className,
    "TestParseEisblock",
    "eisblock",
    "$player$ bekommt 'Eisblock'.",
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
    "$player$ bekommt 'Blinzeln'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseFeuerzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFeuerzauberschutz",
    "feuerzauberschutz",
    "$player$ bekommt 'Feuerzauberschutz'.",
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
    "$player$ bekommt 'Frostzauberschutz'.",
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
    "$player$ bekommt 'Manaschild'.",
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
    "$player$ bekommt 'Eisbarriere'.",
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
    "frostnova",
    "Ihr seid von Frostnova betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseArkaneMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseArkaneMacht",
    "arkane_macht",
    "$player$ bekommt 'Arkane Macht'.",
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
    "$player$ bekommt 'Hervorrufung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseGeistesgegenwart()
  mod.testHelper.TestParse(
    className,
    "TestParseGeistesgegenwart",
    "geistesgegenwart",
    "$player$ bekommt 'Geistesgegenwart'.",
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
    "$player$ bekommt 'Verbrennung'.",
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

function me.TestParseEnemyAvoidResistGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht",
    "Ihr habt es mit Gegenzauber - zum Schweigen gebracht versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneGegenzauber()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGegenzauber",
    "gegenzauber",
    "Gegenzauber war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneVerwandlung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVerwandlung",
    "verwandlung",
    "Gegenzauber war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVerwandlung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVerwandlung",
    "verwandlung",
    "Ihr habt es mit Verwandlung versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneVerwandlungKuh()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVerwandlungKuh",
    "verwandlung_kuh",
    "Verwandlung: Kuh war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVerwandlungKuh()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVerwandlungKuh",
    "verwandlung_kuh",
    "Ihr habt es mit Verwandlung: Kuh versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneVerwandlungSchwein()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVerwandlungSchwein",
    "verwandlung_schwein",
    "Verwandlung: Schwein war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVerwandlungSchwein()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVerwandlungSchwein",
    "verwandlung_schwein",
    "Ihr habt es mit Verwandlung: Schwein versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneVerwandlungKroete()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVerwandlungKroete",
    "verwandlung_kroete",
    "Verwandlung: Kröte war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVerwandlungKroete()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVerwandlungKroete",
    "verwandlung_kroete",
    "Ihr habt es mit Verwandlung: Kröte versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneKaeltekegel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKaeltekegel",
    "kaeltekegel",
    "Kältekegel war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistKaeltekegel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistKaeltekegel",
    "kaeltekegel",
    "Ihr habt es mit Kältekegel versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFrostnova()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFrostnova",
    "frostnova",
    "Frostnova war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFrostnova()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFrostnova",
    "frostnova",
    "Ihr habt es mit Frostnova versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidResistGegenzauberZumSchweigenGebracht()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistGegenzauberZumSchweigenGebracht",
    "gegenzauber_zum_schweigen_gebracht",
    "$player$ versucht es mit Gegenzauber - zum Schweigen gebracht... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneGegenzauber()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGegenzauber",
    "gegenzauber",
    "$player$ versucht es mit Gegenzauber... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneVerwandlung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerwandlung",
    "polymorph",
    "$player$ versucht es mit Gegenzauber... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerwandlung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerwandlung",
    "polymorph",
    "$player$ versucht es mit Verwandlung... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVerwandlungKuh()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerwandlungKuh",
    "verwandlung_kuh",
    "$player$ versucht es mit Verwandlung: Kuh... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerwandlungKuh()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerwandlungKuh",
    "verwandlung_kuh",
    "$player$ versucht es mit Verwandlung: Kuh... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVerwandlungSchwein()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerwandlungSchwein",
    "verwandlung_schwein",
    "$player$ versucht es mit Verwandlung: Schwein... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerwandlungSchwein()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerwandlungSchwein",
    "verwandlung_schwein",
    "$player$ versucht es mit Verwandlung: Schwein... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVerwandlungKroete()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerwandlungKroete",
    "verwandlung_kroete",
    "$player$ versucht es mit Verwandlung: Kröte... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerwandlungKroete()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerwandlungKroete",
    "verwandlung_kroete",
    "$player$ versucht es mit Verwandlung: Kröte... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneKaeltekegel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKaeltekegel",
    "kaeltekegel",
    "$player$ versucht es mit Kältekegel... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistKaeltekegel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistKaeltekegel",
    "kaeltekegel",
    "$player$ versucht es mit Kältekegel... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFrostnova()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFrostnova",
    "frostnova",
    "$player$ versucht es mit Frostnova... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFrostnova()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFrostnova",
    "frostnova",
    "$player$ versucht es mit Frostnova... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
