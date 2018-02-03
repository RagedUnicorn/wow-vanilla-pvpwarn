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
mod.testPaladinDe = me

me.tag = "TestPaladinDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[2]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PALADIN_DE__Test()
  mod.testReporter.StartTestRun("global_paladin_de_all")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDerHingabe)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDerHingabe)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDerVergeltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDerVergeltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDerKonzentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDerKonzentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDesSchattenwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDesSchattenwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDesFrostwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDesFrostwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraDesFeuerwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraDesFeuerwiderstands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerDesZorns)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSegenDesSchutzes)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSegenDesSchutzes)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSegenDerFreiheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSegenDerFreiheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSegenDerOpferung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSegenDerOpferung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerDerGerechtigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBusse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHandauflegung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHandauflegung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGottesschild)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGottesschild)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoettlicheGunst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoettlicheGunst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVorahnung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVorahnung)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundAuraDerHingabe()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDerHingabe",
    "aura_der_hingabe"
  )
end

function me.TestSoundDownAuraDerHingabe()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDerHingabe",
    "aura_der_hingabe"
  )
end

function me.TestSoundAuraDerVergeltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDerVergeltung",
    "aura_der_vergeltung"
  )
end

function me.TestSoundDownAuraDerVergeltung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDerVergeltung",
    "aura_der_vergeltung"
  )
end

function me.TestSoundAuraDerKonzentration()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDerKonzentration",
    "aura_der_konzentration"
  )
end

function me.TestSoundDownAuraDerKonzentration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDerKonzentration",
    "aura_der_konzentration"
  )
end

function me.TestSoundAuraDesSchattenwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDesSchattenwiderstands",
    "aura_des_schattenwiderstands"
  )
end

function me.TestSoundDownAuraDesSchattenwiderstands()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDesSchattenwiderstands",
    "aura_des_schattenwiderstands"
  )
end

function me.TestSoundAuraDesFrostwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDesFrostwiderstands",
    "aura_des_frostwiderstands"
  )
end

function me.TestSoundDownAuraDesFrostwiderstands()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDesFrostwiderstands",
    "aura_des_frostwiderstands"
  )
end

function me.TestSoundAuraDesFeuerwiderstands()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraDesFeuerwiderstands",
    "aura_des_feuerwiderstands"
  )
end

function me.TestSoundDownAuraDesFeuerwiderstands()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraDesFeuerwiderstands",
    "aura_des_feuerwiderstands"
  )
end

function me.TestSoundHammerDesZorns()
  mod.testHelper.TestSound(
    className,
    "TestSoundHammerDesZorns",
    "hammer_des_zorns"
  )
end

function me.TestSoundSegenDesSchutzes()
  mod.testHelper.TestSound(
    className,
    "TestSoundSegenDesSchutzes",
    "segen_des_schutzes"
  )
end

function me.TestSoundDownSegenDesSchutzes()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSegenDesSchutzes",
    "segen_des_schutzes"
  )
end

function me.TestSoundSegenDerFreiheit()
  mod.testHelper.TestSound(
    className,
    "TestSoundSegenDerFreiheit",
    "segen_der_freiheit"
  )
end

function me.TestSoundDownSegenDerFreiheit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSegenDerFreiheit",
    "segen_der_freiheit"
  )
end

function me.TestSoundSegenDerOpferung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSegenDerOpferung",
    "segen_der_opferung"
  )
end

function me.TestSoundDownSegenDerOpferung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSegenDerOpferung",
    "segen_der_opferung"
  )
end

function me.TestSoundHammerDerGerechtigkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundHammerDerGerechtigkeit",
    "hammer_der_gerechtigkeit"
  )
end

function me.TestSoundBusse()
  mod.testHelper.TestSound(
    className,
    "TestSoundBusse",
    "busse"
  )
end

function me.TestSoundHandauflegung()
  mod.testHelper.TestSound(
    className,
    "TestSoundHandauflegung",
    "handauflegung"
  )
end

function me.TestSoundDownHandauflegung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownHandauflegung",
    "handauflegung"
  )
end

function me.TestSoundGottesschild()
  mod.testHelper.TestSound(
    className,
    "TestSoundGottesschild",
    "gottesschild"
  )
end

function me.TestSoundDownGottesschild()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGottesschild",
    "gottesschild"
  )
end

function me.TestSoundGoettlicheGunst()
  mod.testHelper.TestSound(
    className,
    "TestSoundGoettlicheGunst",
    "goettliche_gunst"
  )
end

function me.TestSoundDownGoettlicheGunst()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGoettlicheGunst",
    "goettliche_gunst"
  )
end

function me.TestSoundVorahnung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVorahnung",
    "vorahnung"
  )
end

function me.TestSoundDownVorahnung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownVorahnung",
    "vorahnung"
  )
end
