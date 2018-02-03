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
mod.testMiscDe = me

me.tag = "TestMiscDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[12]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_MISC_DE__Test()
  mod.testReporter.StartTestRun("global_misc_de_all")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisteltee)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWiderherstellungstrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWiderherstellungstrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErsteHilfe)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnverwundbarkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownUnverwundbarkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreieAktion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFreieAktion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundThoriumgranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownThoriumgranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEisengranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEisengranate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeuerschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFeuerschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArkanschutztrank)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArkanschutztrank)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundDisteltee()
  mod.testHelper.TestSound(
    className,
    "TestSoundDisteltee",
    "energie_wiederherstellen"
  )
end

function me.TestSoundWiderherstellungstrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundWiderherstellungstrank",
    "widerherstellung"
  )
end

function me.TestSoundDownWiderherstellungstrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWiderherstellungstrank",
    "widerherstellung"
  )
end

function me.TestSoundErsteHilfe()
  mod.testHelper.TestSound(
    className,
    "TestSoundErsteHilfe",
    "erste_hilfe"
  )
end

function me.TestSoundUnverwundbarkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundUnverwundbarkeit",
    "unverwundbarkeit"
  )
end

function me.TestSoundDownUnverwundbarkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownUnverwundbarkeit",
    "unverwundbarkeit"
  )
end

function me.TestSoundFreieAktion()
  mod.testHelper.TestSound(
    className,
    "TestSoundFreieAktion",
    "freie_aktion"
  )
end

function me.TestSoundDownFreieAktion()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFreieAktion",
    "freie_aktion"
  )
end

function me.TestSoundThoriumgranate()
  mod.testHelper.TestSound(
    className,
    "TestSoundThoriumgranate",
    "thoriumgranate"
  )
end

function me.TestSoundDownThoriumgranate()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownThoriumgranate",
    "thoriumgranate"
  )
end

function me.TestSoundEisengranate()
  mod.testHelper.TestSound(
    className,
    "TestSoundEisengranate",
    "eisengranate"
  )
end

function me.TestSoundDownEisengranate()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEisengranate",
    "eisengranate"
  )
end

function me.TestSoundSchattenschutztrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenschutztrank",
    "schattenschutz"
  )
end

function me.TestSoundDownSchattenschutztrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenschutztrank",
    "schattenschutz"
  )
end

function me.TestSoundFrostschutztrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostschutztrank",
    "frostschutz"
  )
end

function me.TestSoundDownFrostschutztrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostschutztrank",
    "frostschutz"
  )
end

function me.TestSoundFeuerschutztrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeuerschutztrank",
    "feuerschutz"
  )
end

function me.TestSoundDownFeuerschutztrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFeuerschutztrank",
    "feuerschutz"
  )
end

function me.TestSoundNaturschutztrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundNaturschutztrank",
    "naturschutz"
  )
end

function me.TestSoundDownNaturschutztrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownNaturschutztrank",
    "naturschutz"
  )
end

function me.TestSoundArkanschutztrank()
  mod.testHelper.TestSound(
    className,
    "TestSoundArkanschutztrank",
    "arkanschutz"
  )
end

function me.TestSoundDownArkanschutztrank()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownArkanschutztrank",
    "arkanschutz"
  )
end
