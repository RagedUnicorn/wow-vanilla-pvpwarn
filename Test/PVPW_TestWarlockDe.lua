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

  me.RunAll()
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMajorGrosserZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMajorGrosserZauberstein)
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

function me.TestSoundMajorGrosserZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundMajorGrosserZauberstein",
    "grosser_zauberstein"
  )
end

function me.TestSoundDownMajorGrosserZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownMajorGrosserZauberstein",
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
