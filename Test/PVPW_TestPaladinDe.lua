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

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_PALADIN_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_paladin_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_paladin_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_paladin_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_paladin_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_paladin_de_parse_crit")
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

  mod.testReporter.AddToTestQueue(me.TestParseAuraDerHingabe)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDerHingabe)
  mod.testReporter.AddToTestQueue(me.TestParseAuraDerVergeltung)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDerVergeltung)
  mod.testReporter.AddToTestQueue(me.TestParseAuraDerKonzentration)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDerKonzentration)
  mod.testReporter.AddToTestQueue(me.TestParseAuraDesSchattenwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDesSchattenwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseAuraDesFrostwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDesFrostwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseAuraDesFeuerwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraDesFeuerwiderstands)
  mod.testReporter.AddToTestQueue(me.TestParseHammerDesZorns)
  mod.testReporter.AddToTestQueue(me.TestParseSegenDesSchutzes)
  mod.testReporter.AddToTestQueue(me.TestParseDownSegenDesSchutzes)
  mod.testReporter.AddToTestQueue(me.TestParseSegenDerFreiheit)
  mod.testReporter.AddToTestQueue(me.TestParseDownSegenDerFreiheit)
  mod.testReporter.AddToTestQueue(me.TestParseSegenDerOpferung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSegenDerOpferung)
  mod.testReporter.AddToTestQueue(me.TestParseHammerDerGerechtigkeit)
  mod.testReporter.AddToTestQueue(me.TestParseBusse)
  mod.testReporter.AddToTestQueue(me.TestParseHandauflegung)
  mod.testReporter.AddToTestQueue(me.TestParseCritHandauflegung)
  mod.testReporter.AddToTestQueue(me.TestParseDownHandauflegung)
  mod.testReporter.AddToTestQueue(me.TestParseGottesschild)
  mod.testReporter.AddToTestQueue(me.TestParseDownGottesschild)
  mod.testReporter.AddToTestQueue(me.TestParseGoettlicheGunst)
  mod.testReporter.AddToTestQueue(me.TestParseDownGoettlicheGunst)
  mod.testReporter.AddToTestQueue(me.TestParseVorahnung)
  mod.testReporter.AddToTestQueue(me.TestParseDownVorahnung)

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

function me.TestParseAuraDerHingabe()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDerHingabe",
    "aura_der_hingabe",
    "$player$ bekommt Aura der Hingabe.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDerHingabe()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDerHingabe",
    "aura_der_hingabe",
    "Aura der Hingabe schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAuraDerVergeltung()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDerVergeltung",
    "aura_der_vergeltung",
    "$player$ bekommt Aura der Vergeltung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDerVergeltung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDerVergeltung",
    "aura_der_vergeltung",
    "Aura der Vergeltung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAuraDerKonzentration()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDerKonzentration",
    "aura_der_konzentration",
    "$player$ bekommt Aura der Konzentration.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDerKonzentration()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDerKonzentration",
    "aura_der_konzentration",
    "Aura der Konzentration schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAuraDesSchattenwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDesSchattenwiderstands",
    "aura_des_schattenwiderstands",
    "$player$ bekommt Aura des Schattenwiderstands.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDesSchattenwiderstands()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDesSchattenwiderstands",
    "aura_des_schattenwiderstands",
    "Aura des Schattenwiderstands schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAuraDesFrostwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDesFrostwiderstands",
    "aura_des_frostwiderstands",
    "$player$ bekommt Aura des Frostwiderstands.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDesFrostwiderstands()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDesFrostwiderstands",
    "aura_des_frostwiderstands",
    "Aura des Frostwiderstands schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAuraDesFeuerwiderstands()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraDesFeuerwiderstands",
    "aura_des_feuerwiderstands",
    "$player$ bekommt Aura des Feuerwiderstands.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraDesFeuerwiderstands()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraDesFeuerwiderstands",
    "aura_des_feuerwiderstands",
    "Aura des Feuerwiderstands schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHammerDesZorns()
  mod.testHelper.TestParse(
    className,
    "TestParseHammerDesZorns",
    "hammer_des_zorns",
    "$player$ beginnt Hammer des Zorns zu wirken.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSegenDesSchutzes()
  mod.testHelper.TestParse(
    className,
    "TestParseSegenDesSchutzes",
    "segen_des_schutzes",
    "$player$ bekommt Segen des Schutzes.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSegenDesSchutzes()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSegenDesSchutzes",
    "segen_des_schutzes",
    "Segen des Schutzes schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSegenDerFreiheit()
  mod.testHelper.TestParse(
    className,
    "TestParseSegenDerFreiheit",
    "segen_der_freiheit",
    "$player$ bekommt Segen der Freiheit.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSegenDerFreiheit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSegenDerFreiheit",
    "segen_der_freiheit",
    "Segen der Freiheit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSegenDerOpferung()
  mod.testHelper.TestParse(
    className,
    "TestParseSegenDerOpferung",
    "segen_der_opferung",
    "$player$ bekommt Segen der Opferung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSegenDerOpferung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSegenDerOpferung",
    "segen_der_opferung",
    "Segen der Opferung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHammerDerGerechtigkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseHammerDerGerechtigkeit",
    "hammer_der_gerechtigkeit",
    "Ihr seid von Hammer der Gerechtigkeit betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBusse()
  mod.testHelper.TestParse(
    className,
    "TestParseBusse",
    "busse",
    "Ihr seid von Busse betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseHandauflegung()
  mod.testHelper.TestParse(
    className,
    "TestParseHandauflegung",
    "handauflegung",
    "$player$s Handauflegung heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCritHandauflegung()
  mod.testHelper.TestParse(
    className,
    "TestParseCritHandauflegung",
    "handauflegung",
    "Kritische Heilung: $player$s Handauflegung heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseDownHandauflegung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownHandauflegung",
    "handauflegung",
    "Handauflegung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGottesschild()
  mod.testHelper.TestParse(
    className,
    "TestParseGottesschild",
    "gottesschild",
    "$player$ bekommt Gottesschild.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGottesschild()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGottesschild",
    "gottesschild",
    "Gottesschild schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGoettlicheGunst()
  mod.testHelper.TestParse(
    className,
    "TestParseGoettlicheGunst",
    "goettliche_gunst",
    "$player$ bekommt Göttliche Gunst.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGoettlicheGunst()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGoettlicheGunst",
    "goettliche_gunst",
    "Göttliche Gunst schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVorahnung()
  mod.testHelper.TestParse(
    className,
    "TestParseVorahnung",
    "vorahnung",
    "$player$ ist von Vorahnung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSpellHostilePlayerDamage
  )
end

function me.TestParseDownVorahnung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownVorahnung",
    "vorahnung",
    "Vorahnung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end
