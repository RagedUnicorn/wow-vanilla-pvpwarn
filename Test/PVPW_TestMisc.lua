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
mod.testMisc = me

me.tag = "TestMisc"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[12]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_MISC__Test()
  mod.testReporter.StartTestRun("global_misc_all")
  mod.testReporter.StartTestClass(className)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
  mod.testHelper.TestShouldHaveASelfAvoidParseTestForEachSpell(me, className)

  me.RunAll()
end

function _G.__PVPW__TEST_MISC__Test_Sound()
  mod.testReporter.StartTestRun("global_misc_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_misc_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_misc_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_misc_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Parse()
  mod.testReporter.StartTestRun("global_misc_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_misc_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_misc_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_misc_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MISC__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_misc_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundThistleTea)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestoration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRestoration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInvulnerability)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInvulnerability)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundThoriumGrenade)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIronGrenade)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcaneProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidThoriumGrenade)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidIronGrenade)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidThoriumGrenade)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidIronGrenade)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseThistleTea)
  mod.testReporter.AddToTestQueue(me.TestParseRestoration)
  mod.testReporter.AddToTestQueue(me.TestParseDownRestoration)
  mod.testReporter.AddToTestQueue(me.TestParseFirstAid)
  mod.testReporter.AddToTestQueue(me.TestParseInvulnerability)
  mod.testReporter.AddToTestQueue(me.TestParseDownInvulnerability)
  mod.testReporter.AddToTestQueue(me.TestParseFreeAction)
  mod.testReporter.AddToTestQueue(me.TestParseDownFreeAction)
  mod.testReporter.AddToTestQueue(me.TestParseThoriumGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseIronGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseShadowProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowProtection)
  mod.testReporter.AddToTestQueue(me.TestParseFrostProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostProtection)
  mod.testReporter.AddToTestQueue(me.TestParseFireProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownFireProtection)
  mod.testReporter.AddToTestQueue(me.TestParseNatureProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownNatureProtection)
  mod.testReporter.AddToTestQueue(me.TestParseArcaneProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownArcaneProtection)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneThoriumGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistThoriumGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneIronGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistIronGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistThoriumGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneThoriumGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistIronGrenade)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneIronGrenade)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundThistleTea()
  mod.testHelper.TestSound(
    className,
    "TestSoundThistleTea",
    "thistle_tea"
  )
end

function me.TestSoundRestoration()
  mod.testHelper.TestSound(
    className,
    "TestSoundRestoration",
    "restoration"
  )
end

function me.TestSoundDownRestoration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRestoration",
    "restoration"
  )
end

function me.TestSoundFirstAid()
  mod.testHelper.TestSound(
    className,
    "TestSoundFirstAid",
    "first_aid"
  )
end

function me.TestSoundInvulnerability()
  mod.testHelper.TestSound(
    className,
    "TestSoundInvulnerability",
    "invulnerability"
  )
end

function me.TestSoundDownInvulnerability()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInvulnerability",
    "invulnerability"
  )
end

function me.TestSoundFreeAction()
  mod.testHelper.TestSound(
    className,
    "TestSoundFreeAction",
    "free_action"
  )
end

function me.TestSoundDownFreeAction()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFreeAction",
    "free_action"
  )
end

function me.TestSoundThoriumGrenade()
  mod.testHelper.TestSound(
    className,
    "TestSoundThoriumGrenade",
    "thorium_grenade"
  )
end

function me.TestSoundIronGrenade()
  mod.testHelper.TestSound(
    className,
    "TestSoundIronGrenade",
    "iron_grenade"
  )
end

function me.TestSoundShadowProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowProtection",
    "shadow_protection"
  )
end

function me.TestSoundFrostProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostProtection",
    "frost_protection"
  )
end

function me.TestSoundFireProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireProtection",
    "fire_protection"
  )
end

function me.TestSoundNatureProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundNatureProtection",
    "nature_protection"
  )
end

function me.TestSoundArcaneProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundArcaneProtection",
    "arcane_protection"
  )
end

function me.TestSoundEnemyAvoidThoriumGrenade()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidThoriumGrenade",
    "thorium_grenade"
  )
end

function me.TestSoundEnemyAvoidIronGrenade()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidIronGrenade",
    "iron_grenade"
  )
end

function me.TestSoundSelfAvoidThoriumGrenade()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidThoriumGrenade",
    "thorium_grenade"
  )
end

function me.TestSoundSelfAvoidIronGrenade()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidIronGrenade",
    "iron_grenade"
  )
end

function me.TestParseThistleTea()
  mod.testHelper.TestParse(
    className,
    "TestParseThistleTea",
    "thistle_tea",
    "$player$ gains $amount$ Energy from $player$'s Restore Energy.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseRestoration()
  mod.testHelper.TestParse(
    className,
    "TestParseRestoration",
    "restoration",
    "$player$ gains Restoration.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRestoration()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRestoration",
    "restoration",
    "Restoration fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFirstAid()
  mod.testHelper.TestParse(
    className,
    "TestParseFirstAid",
    "first_aid",
    "$player$ gains First Aid.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseInvulnerability()
  mod.testHelper.TestParse(
    className,
    "TestParseInvulnerability",
    "invulnerability",
    "$player$ gains Invulnerability.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInvulnerability()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInvulnerability",
    "invulnerability",
    "Invulnerability fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFreeAction()
  mod.testHelper.TestParse(
    className,
    "TestParseFreeAction",
    "free_action",
    "$player$ gains Free Action.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFreeAction()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFreeAction",
    "free_action",
    "Free Action fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseThoriumGrenade()
  mod.testHelper.TestParse(
    className,
    "TestParseThoriumGrenade",
    "thorium_grenade",
    "You are afflicted by Thorium Grenade.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseIronGrenade()
  mod.testHelper.TestParse(
    className,
    "TestParseIronGrenade",
    "iron_grenade",
    "You are afflicted by Iron Grenade.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseShadowProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowProtection",
    "shadow_protection",
    "$player$ gains Shadow Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShadowProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShadowProtection",
    "shadow_protection",
    "Shadow Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostProtection",
    "frost_protection",
    "$player$ gains Frost Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostProtection",
    "frost_protection",
    "Frost Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFireProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseFireProtection",
    "fire_protection",
    "$player$ gains Fire Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFireProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFireProtection",
    "fire_protection",
    "Fire Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNatureProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseNatureProtection",
    "nature_protection",
    "$player$ gains Nature Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownNatureProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownNatureProtection",
    "nature_protection",
    "Nature Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseArcaneProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseArcaneProtection",
    "arcane_protection",
    "$player$ gains Arcane Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownArcaneProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownArcaneProtection",
    "arcane_protection",
    "Arcane Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidResistThoriumGrenade()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistThoriumGrenade",
    "thorium_grenade",
    "Your Thorium Grenade was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneThoriumGrenade()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneThoriumGrenade",
    "thorium_grenade",
    "Your Thorium Grenade failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistIronGrenade()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistIronGrenade",
    "iron_grenade",
    "Your Iron Grenade was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneIronGrenade()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneIronGrenade",
    "iron_grenade",
    "Your Iron Grenade failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistThoriumGrenade()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistThoriumGrenade",
    "thorium_grenade",
    "$player$'s Thorium Grenade was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneThoriumGrenade()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneThoriumGrenade",
    "thorium_grenade",
    "$player$'s Thorium Grenade failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistIronGrenade()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistIronGrenade",
    "iron_grenade",
    "$player$'s Iron Grenade was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneIronGrenade()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneIronGrenade",
    "iron_grenade",
    "$player$'s Iron Grenade failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end
