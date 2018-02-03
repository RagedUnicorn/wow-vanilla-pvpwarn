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
mod.testRogueDe = me

me.tag = "TestRogueDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[3]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ROGUE_DE__Test()
  mod.testReporter.StartTestRun("global_rogue_de_all")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlenden)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTritt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNierenhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFieserTrick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKlingenwirbel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownKlingenwirbel)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBlenden()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlenden",
    "blenden"
  )
end

function me.TestSoundTritt()
  mod.testHelper.TestSound(
    className,
    "TestSoundTritt",
    "tritt"
  )
end

function me.TestSoundSprinten()
  mod.testHelper.TestSound(
    className,
    "TestSoundSprinten",
    "sprinten"
  )
end

function me.TestSoundDownSprinten()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSprinten",
    "sprinten"
  )
end

function me.TestSoundEntrinnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundDownEntrinnen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundNierenhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundNierenhieb",
    "nierenhieb"
  )
end

function me.TestSoundFieserTrick()
  mod.testHelper.TestSound(
    className,
    "TestSoundFieserTrick",
    "fieser_trick"
  )
end

function me.TestSoundAdrenalinrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundDownAdrenalinrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundKlingenwirbel()
  mod.testHelper.TestSound(
    className,
    "TestSoundKlingenwirbel",
    "klingenwirbel"
  )
end

function me.TestSoundDownKlingenwirbel()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownKlingenwirbel",
    "klingenwirbel"
  )
end
