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
