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
mod.testItems = me

me.tag = "TestItems"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[10]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ITEMS__Test()
  mod.testReporter.StartTestRun("global_items_all")
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

function _G.__PVPW__TEST_ITEMS__Test_Sound()
  mod.testReporter.StartTestRun("global_items_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_items_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_items_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_items_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Parse()
  mod.testReporter.StartTestRun("global_items_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_items_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_items_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_items_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_items_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBrittleArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBrittleArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTheBurrowersShell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTheBurrowersShell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEphemeralPower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEphemeralPower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEssenceOfSapphiron)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEssenceOfSapphiron)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlee)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFlee)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGiftOfLife)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGiftOfLife)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneRoot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmuneRoot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMindQuickening)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMindQuickening)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestlessStrength)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRestlessStrength)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomishRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSlayersCrest)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSlayersCrest)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnstablePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownUnstablePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVenomousTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVenomousTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalCharm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthstrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEarthstrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNetOMatic)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishMindControlCap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidTidalCharm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRecklessCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidNetOMatic)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidTidalCharm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRecklessCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidNetOMatic)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseAuraOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownAuraOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseBrittleArmor)
  mod.testReporter.AddToTestQueue(me.TestParseDownBrittleArmor)
  mod.testReporter.AddToTestQueue(me.TestParseTheBurrowersShell)
  mod.testReporter.AddToTestQueue(me.TestParseDownTheBurrowersShell)
  mod.testReporter.AddToTestQueue(me.TestParseEphemeralPower)
  mod.testReporter.AddToTestQueue(me.TestParseDownEphemeralPower)
  mod.testReporter.AddToTestQueue(me.TestParseEssenceOfSapphiron)
  mod.testReporter.AddToTestQueue(me.TestParseDownEssenceOfSapphiron)
  mod.testReporter.AddToTestQueue(me.TestParseFireReflector)
  mod.testReporter.AddToTestQueue(me.TestParseDownFireReflector)
  mod.testReporter.AddToTestQueue(me.TestParseFlee)
  mod.testReporter.AddToTestQueue(me.TestParseDownFlee)
  mod.testReporter.AddToTestQueue(me.TestParseFrostReflector)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostReflector)
  mod.testReporter.AddToTestQueue(me.TestParseGiftOfLife)
  mod.testReporter.AddToTestQueue(me.TestParseDownGiftOfLife)
  mod.testReporter.AddToTestQueue(me.TestParseImmuneRoot)
  mod.testReporter.AddToTestQueue(me.TestParseDownImmuneRoot)
  mod.testReporter.AddToTestQueue(me.TestParseMindQuickening)
  mod.testReporter.AddToTestQueue(me.TestParseDownMindQuickening)
  mod.testReporter.AddToTestQueue(me.TestParseRecklessCharge)
  mod.testReporter.AddToTestQueue(me.TestParseDownRecklessCharge)
  mod.testReporter.AddToTestQueue(me.TestParseRestlessStrength)
  mod.testReporter.AddToTestQueue(me.TestParseDownRestlessStrength)
  mod.testReporter.AddToTestQueue(me.TestParseGnomishRocketBoots)
  mod.testReporter.AddToTestQueue(me.TestParseDownGnomishRocketBoots)
  mod.testReporter.AddToTestQueue(me.TestParseGoblinRocketBoots)
  mod.testReporter.AddToTestQueue(me.TestParseDownGoblinRocketBoots)
  mod.testReporter.AddToTestQueue(me.TestParseShadowReflector)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowReflector)
  mod.testReporter.AddToTestQueue(me.TestParseSlayersCrest)
  mod.testReporter.AddToTestQueue(me.TestParseDownSlayersCrest)
  mod.testReporter.AddToTestQueue(me.TestParseUnstablePower)
  mod.testReporter.AddToTestQueue(me.TestParseDownUnstablePower)
  mod.testReporter.AddToTestQueue(me.TestParseVenomousTotem)
  mod.testReporter.AddToTestQueue(me.TestParseDownVenomousTotem)
  mod.testReporter.AddToTestQueue(me.TestParseTidalCharm)
  mod.testReporter.AddToTestQueue(me.TestParseEarthstrike)
  mod.testReporter.AddToTestQueue(me.TestParseDownEarthstrike)
  mod.testReporter.AddToTestQueue(me.TestParseNetOMatic)
  mod.testReporter.AddToTestQueue(me.TestParseGnomishMindControlCap)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneTidalCharm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistTidalCharm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneRecklessCharge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneNetOMatic)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistNetOMatic)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneTidalCharm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistTidalCharm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneRecklessCharge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneNetOMatic)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistNetOMatic)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundAuraOfProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundAuraOfProtection",
    "aura_of_protection"
  )
end

function me.TestSoundDownAuraOfProtection()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAuraOfProtection",
    "aura_of_protection"
  )
end

function me.TestSoundBrittleArmor()
  mod.testHelper.TestSound(
    className,
    "TestSoundBrittleArmor",
    "brittle_armor"
  )
end

function me.TestSoundDownBrittleArmor()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBrittleArmor",
    "brittle_armor"
  )
end

function me.TestSoundTheBurrowersShell()
  mod.testHelper.TestSound(
    className,
    "TestSoundTheBurrowersShell",
    "the_burrowers_shell"
  )
end

function me.TestSoundDownTheBurrowersShell()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTheBurrowersShell",
    "the_burrowers_shell"
  )
end

function me.TestSoundEphemeralPower()
  mod.testHelper.TestSound(
    className,
    "TestSoundEphemeralPower",
    "ephemeral_power"
  )
end

function me.TestSoundDownEphemeralPower()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEphemeralPower",
    "ephemeral_power"
  )
end

function me.TestSoundEssenceOfSapphiron()
  mod.testHelper.TestSound(
    className,
    "TestSoundEssenceOfSapphiron",
    "essence_of_sapphiron"
  )
end

function me.TestSoundDownEssenceOfSapphiron()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEssenceOfSapphiron",
    "essence_of_sapphiron"
  )
end

function me.TestSoundFireReflector()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireReflector",
    "fire_reflector"
  )
end

function me.TestSoundDownFireReflector()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFireReflector",
    "fire_reflector"
  )
end

function me.TestSoundFlee()
  mod.testHelper.TestSound(
    className,
    "TestSoundFlee",
    "flee"
  )
end

function me.TestSoundDownFlee()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFlee",
    "flee"
  )
end

function me.TestSoundFrostReflector()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostReflector",
    "frost_reflector"
  )
end

function me.TestSoundDownFrostReflector()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostReflector",
    "frost_reflector"
  )
end

function me.TestSoundGiftOfLife()
  mod.testHelper.TestSound(
    className,
    "TestSoundGiftOfLife",
    "gift_of_life"
  )
end

function me.TestSoundDownGiftOfLife()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGiftOfLife",
    "gift_of_life"
  )
end

function me.TestSoundImmuneRoot()
  mod.testHelper.TestSound(
    className,
    "TestSoundImmuneRoot",
    "immune_root"
  )
end

function me.TestSoundDownImmuneRoot()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownImmuneRoot",
    "immune_root"
  )
end

function me.TestSoundMindQuickening()
  mod.testHelper.TestSound(
    className,
    "TestSoundMindQuickening",
    "mind_quickening"
  )
end

function me.TestSoundDownMindQuickening()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownMindQuickening",
    "mind_quickening"
  )
end

function me.TestSoundRecklessCharge()
  mod.testHelper.TestSound(
    className,
    "TestSoundRecklessCharge",
    "reckless_charge"
  )
end

function me.TestSoundDownRecklessCharge()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRecklessCharge",
    "reckless_charge"
  )
end

function me.TestSoundRestlessStrength()
  mod.testHelper.TestSound(
    className,
    "TestSoundRestlessStrength",
    "restless_strength"
  )
end

function me.TestSoundDownRestlessStrength()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRestlessStrength",
    "restless_strength"
  )
end

function me.TestSoundGnomishRocketBoots()
  mod.testHelper.TestSound(
    className,
    "TestSoundGnomishRocketBoots",
    "gnomish_rocket_boots"
  )
end

function me.TestSoundDownGnomishRocketBoots()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGnomishRocketBoots",
    "gnomish_rocket_boots"
  )
end

function me.TestSoundGoblinRocketBoots()
  mod.testHelper.TestSound(
    className,
    "TestSoundGoblinRocketBoots",
    "goblin_rocket_boots"
  )
end

function me.TestSoundDownGoblinRocketBoots()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGoblinRocketBoots",
    "goblin_rocket_boots"
  )
end

function me.TestSoundShadowReflector()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowReflector",
    "shadow_reflector"
  )
end

function me.TestSoundDownShadowReflector()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShadowReflector",
    "shadow_reflector"
  )
end

function me.TestSoundSlayersCrest()
  mod.testHelper.TestSound(
    className,
    "TestSoundSlayersCrest",
    "slayers_crest"
  )
end

function me.TestSoundDownSlayersCrest()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSlayersCrest",
    "slayers_crest"
  )
end

function me.TestSoundUnstablePower()
  mod.testHelper.TestSound(
    className,
    "TestSoundUnstablePower",
    "unstable_power"
  )
end

function me.TestSoundDownUnstablePower()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownUnstablePower",
    "unstable_power"
  )
end

function me.TestSoundVenomousTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundVenomousTotem",
    "venomous_totem"
  )
end

function me.TestSoundDownVenomousTotem()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownVenomousTotem",
    "venomous_totem"
  )
end

function me.TestSoundTidalCharm()
  mod.testHelper.TestSound(
    className,
    "TestSoundTidalCharm",
    "tidal_charm"
  )
end

function me.TestSoundEarthstrike()
  mod.testHelper.TestSound(
    className,
    "TestSoundEarthstrike",
    "earthstrike"
  )
end

function me.TestSoundDownEarthstrike()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEarthstrike",
    "earthstrike"
  )
end

function me.TestSoundNetOMatic()
  mod.testHelper.TestSound(
    className,
    "TestSoundNetOMatic",
    "net_o_matic"
  )
end

function me.TestSoundGnomishMindControlCap()
  mod.testHelper.TestSound(
    className,
    "TestSoundGnomishMindControlCap",
    "gnomish_mind_control_cap"
  )
end

function me.TestSoundEnemyAvoidTidalCharm()
  mod.testHelper.TestSound(
    className,
    "TestSoundEnemyAvoidTidalCharm",
    "tidal_charm"
  )
end

function me.TestSoundEnemyAvoidRecklessCharge()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidRecklessCharge",
    "reckless_charge"
  )
end

function me.TestSoundEnemyAvoidNetOMatic()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidNetOMatic",
    "net_o_matic"
  )
end

function me.TestSoundSelfAvoidTidalCharm()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidTidalCharm",
    "tidal_charm"
  )
end

function me.TestSoundSelfAvoidRecklessCharge()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidRecklessCharge",
    "reckless_charge"
  )
end

function me.TestSoundSelfAvoidNetOMatic()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidNetOMatic",
    "net_o_matic"
  )
end

function me.TestParseAuraOfProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseAuraOfProtection",
    "aura_of_protection",
    "$player$ gains Aura of Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAuraOfProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAuraOfProtection",
    "aura_of_protection",
    "Aura of Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBrittleArmor()
  mod.testHelper.TestParse(
    className,
    "TestParseBrittleArmor",
    "brittle_armor",
    "$player$ gains Brittle Armor.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBrittleArmor()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBrittleArmor",
    "brittle_armor",
    "Brittle Armor fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTheBurrowersShell()
  mod.testHelper.TestParse(
    className,
    "TestParseTheBurrowersShell",
    "the_burrowers_shell",
    "$player$ gains The Burrower's Shell.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTheBurrowersShell()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTheBurrowersShell",
    "the_burrowers_shell",
    "The Burrower's Shell fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEphemeralPower()
  mod.testHelper.TestParse(
    className,
    "TestParseEphemeralPower",
    "ephemeral_power",
    "$player$ gains Ephemeral Power.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEphemeralPower()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEphemeralPower",
    "ephemeral_power",
    "Ephemeral Power fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEssenceOfSapphiron()
  mod.testHelper.TestParse(
    className,
    "TestParseEssenceOfSapphiron",
    "essence_of_sapphiron",
    "$player$ gains Essence of Sapphiron.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEssenceOfSapphiron()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEssenceOfSapphiron",
    "essence_of_sapphiron",
    "Essence of Sapphiron fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFireReflector()
  mod.testHelper.TestParse(
    className,
    "TestParseFireReflector",
    "fire_reflector",
    "$player$ gains Fire Reflector.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFireReflector()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFireReflector",
    "fire_reflector",
    "Fire Reflector fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFlee()
  mod.testHelper.TestParse(
    className,
    "TestParseFlee",
    "flee",
    "$player$ gains Flee.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFlee()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFlee",
    "flee",
    "Flee fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostReflector()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostReflector",
    "frost_reflector",
    "$player$ gains Frost Reflector.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostReflector()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostReflector",
    "frost_reflector",
    "Frost Reflector fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGiftOfLife()
  mod.testHelper.TestParse(
    className,
    "TestParseGiftOfLife",
    "gift_of_life",
    "$player$ gains Gift of Life.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGiftOfLife()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGiftOfLife",
    "gift_of_life",
    "Gift of Life fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseImmuneRoot()
  mod.testHelper.TestParse(
    className,
    "TestParseImmuneRoot",
    "immune_root",
    "$player$ gains Immune Root.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownImmuneRoot()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownImmuneRoot",
    "immune_root",
    "Immune Root fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseMindQuickening()
  mod.testHelper.TestParse(
    className,
    "TestParseMindQuickening",
    "mind_quickening",
    "$player$ gains Mind Quickening.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownMindQuickening()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownMindQuickening",
    "mind_quickening",
    "Mind Quickening fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseRecklessCharge()
  mod.testHelper.TestParse(
    className,
    "TestParseRecklessCharge",
    "reckless_charge",
    "$player$ gains Reckless Charge.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRecklessCharge()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRecklessCharge",
    "reckless_charge",
    "Reckless Charge fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseRestlessStrength()
  mod.testHelper.TestParse(
    className,
    "TestParseRestlessStrength",
    "restless_strength",
    "$player$ gains Restless Strength.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRestlessStrength()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRestlessStrength",
    "restless_strength",
    "Restless Strength fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGnomishRocketBoots()
  mod.testHelper.TestParse(
    className,
    "TestParseGnomishRocketBoots",
    "gnomish_rocket_boots",
    "$player$ gains Gnomish Rocket Boots.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGnomishRocketBoots()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGnomishRocketBoots",
    "gnomish_rocket_boots",
    "Gnomish Rocket Boots fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGoblinRocketBoots()
  mod.testHelper.TestParse(
    className,
    "TestParseGoblinRocketBoots",
    "goblin_rocket_boots",
    "$player$ gains Goblin Rocket Boots.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGoblinRocketBoots()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGoblinRocketBoots",
    "goblin_rocket_boots",
    "Gnomish Rocket Boots fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseShadowReflector()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowReflector",
    "shadow_reflector",
    "$player$ gains Shadow Reflector.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShadowReflector()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShadowReflector",
    "shadow_reflector",
    "Shadow Reflector fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSlayersCrest()
  mod.testHelper.TestParse(
    className,
    "TestParseSlayersCrest",
    "slayers_crest",
    "$player$ gains Slayer's Crest.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSlayersCrest()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSlayersCrest",
    "slayers_crest",
    "Slayer's Crest fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseUnstablePower()
  mod.testHelper.TestParse(
    className,
    "TestParseUnstablePower",
    "unstable_power",
    "$player$ gains Unstable Power.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownUnstablePower()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownUnstablePower",
    "unstable_power",
    "Unstable Power fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVenomousTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseVenomousTotem",
    "venomous_totem",
    "$player$ gains Venomous Totem.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownVenomousTotem()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownVenomousTotem",
    "venomous_totem",
    "Venomous Totem fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTidalCharm()
  mod.testHelper.TestParse(
    className,
    "TestParseTidalCharm",
    "tidal_charm",
    "You are afflicted by Tidal Charm.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEarthstrike()
  mod.testHelper.TestParse(
    className,
    "TestParseEarthstrike",
    "earthstrike",
    "$player$ gains Earthstrike.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEarthstrike()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEarthstrike",
    "earthstrike",
    "Earthstrike fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNetOMatic()
  mod.testHelper.TestParse(
    className,
    "TestParseNetOMatic",
    "net_o_matic",
    "You are afflicted by Net-o-Matic.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseGnomishMindControlCap()
  mod.testHelper.TestParse(
    className,
    "TestParseGnomishMindControlCap",
    "gnomish_mind_control_cap",
    "You are afflicted by Gnomish Mind Control Cap.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneTidalCharm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneTidalCharm",
    "tidal_charm",
    "Your Tidal Charm failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistTidalCharm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistTidalCharm",
    "tidal_charm",
    "Your Tidal Charm was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneRecklessCharge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneRecklessCharge",
    "reckless_charge",
    "Your Reckless Charge failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneNetOMatic()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneNetOMatic",
    "net_o_matic",
    "Your Net-o-Matic failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistNetOMatic()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistNetOMatic",
    "net_o_matic",
    "Your Net-o-Matic was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneTidalCharm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneTidalCharm",
    "tidal_charm",
    "$player$'s Tidal Charm failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistTidalCharm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistTidalCharm",
    "tidal_charm",
    "$player$'s Tidal Charm was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneRecklessCharge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneRecklessCharge",
    "reckless_charge",
    "$player$'s Reckless Charge failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneNetOMatic()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneNetOMatic",
    "net_o_matic",
    "$player$'s Net-o-Matic failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistNetOMatic()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistNetOMatic",
    "net_o_matic",
    "$player$'s Net-o-Matic was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
