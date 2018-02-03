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
