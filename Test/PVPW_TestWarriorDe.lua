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
mod.testWarriorDe = me

me.tag = "TestWarriorDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[1]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARRIOR_DE__Test()
  mod.testReporter.StartTestRun("global_warrior_de_all")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKampfhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerteidigungshaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntwaffnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErschuetternderSchlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZuschlagen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBetaeubungabfangen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDrohruf)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildhieb)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBerserkerwut()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundDownBerserkerwut()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundTollkuehnheit()
  mod.testHelper.TestSound(
    className,
    "TestSoundTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundDownTollkuehnheit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundTodeswunsch()
  mod.testHelper.TestSound(
    className,
    "TestSoundTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundDownTodeswunsch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundSchildwall()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildwall",
    "schildwall"
  )
end

function me.TestSoundDownSchildwall()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildwall",
    "schildwall"
  )
end

function me.TestSoundKampfhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundKampfhaltung",
    "kampfhaltung"
  )
end

function me.TestSoundBerserkerhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerhaltung",
    "berserkerhaltung"
  )
end

function me.TestSoundVerteidigungshaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerteidigungshaltung",
    "verteidigungshaltung"
  )
end

function me.TestSoundSturmangriffsbetaeubung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung"
  )
end

function me.TestSoundLetztesGefecht()
  mod.testHelper.TestSound(
    className,
    "TestSoundLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundDownLetztesGefecht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundEntwaffnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntwaffnen",
    "entwaffnen"
  )
end

function me.TestSoundErschuetternderSchlag()
  mod.testHelper.TestSound(
    className,
    "TestSoundErschuetternderSchlag",
    "erschuetternder_schlag"
  )
end

function me.TestSoundBlutrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundDownBlutrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundZuschlagen()
  mod.testHelper.TestSound(
    className,
    "TestSoundZuschlagen",
    "zuschlagen"
  )
end

function me.TestSoundBetaeubungabfangen()
  mod.testHelper.TestSound(
    className,
    "TestSoundBetaeubungabfangen",
    "betaeubung_abfangen"
  )
end

function me.TestSoundDrohruf()
  mod.testHelper.TestSound(
    className,
    "TestSoundDrohruf",
    "drohruf"
  )
end

function me.TestSoundSchildhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildhieb",
    "schildhieb"
  )
end

function me.TestSoundDownSchildhieb()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildhieb",
    "schildhieb"
  )
end
