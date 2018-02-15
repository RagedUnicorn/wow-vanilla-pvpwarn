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
mod.testDruid = me

me.tag = "TestDruid"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[8]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_DRUID__Test()
  mod.testReporter.StartTestRun("global_druid_all")
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

function _G.__PVPW__TEST_DRUID__Test_Sound()
  mod.testReporter.StartTestRun("global_druid_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_druid_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_druid_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_druid_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Parse()
  mod.testReporter.StartTestRun("global_druid_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_druid_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_druid_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_druid_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_druid_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBarkskin)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBarkskin)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAbolishPoison)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAbolishPoison)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnervate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnervate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFeralChargeEffect)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFeralChargeEffect)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseBarkskin)
  mod.testReporter.AddToTestQueue(me.TestParseDownBarkskin)
  mod.testReporter.AddToTestQueue(me.TestParseNaturesGrasp)
  mod.testReporter.AddToTestQueue(me.TestParseDownNaturesGrasp)
  mod.testReporter.AddToTestQueue(me.TestParseBash)
  mod.testReporter.AddToTestQueue(me.TestParseFeralCharge)
  mod.testReporter.AddToTestQueue(me.TestParseFrenziedRegeneration)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrenziedRegeneration)
  mod.testReporter.AddToTestQueue(me.TestParseAbolishPoison)
  mod.testReporter.AddToTestQueue(me.TestParseDownAbolishPoison)
  mod.testReporter.AddToTestQueue(me.TestParseInnervate)
  mod.testReporter.AddToTestQueue(me.TestParseDownInnervate)
  mod.testReporter.AddToTestQueue(me.TestParseNaturesSwiftness)
  mod.testReporter.AddToTestQueue(me.TestParseDownNaturesSwiftness)
  mod.testReporter.AddToTestQueue(me.TestParseFaerieFire)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneEntanglingRoots)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistEntanglingRoots)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFaerieFire)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFaerieFire)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFeralChargeEffect)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFeralChargeEffect)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneEntanglingRoots)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistEntanglingRoots)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFaerieFire)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFaerieFire)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFeralChargeEffect)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFeralChargeEffect)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBarkskin()
  mod.testHelper.TestSound(
    className,
    "TestSoundBarkskin",
    "barkskin"
  )
end

function me.TestSoundDownBarkskin()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBarkskin",
    "barkskin"
  )
end

function me.TestSoundNaturesGrasp()
  mod.testHelper.TestSound(
    className,
    "TestSoundNaturesGrasp",
    "natures_grasp"
  )
end

function me.TestSoundDownNaturesGrasp()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownNaturesGrasp",
    "natures_grasp"
  )
end

function me.TestSoundBash()
  mod.testHelper.TestSound(
    className,
    "TestSoundBash",
    "bash"
  )
end

function me.TestSoundFeralCharge()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeralCharge",
    "feral_charge"
  )
end

function me.TestSoundFrenziedRegeneration()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrenziedRegeneration",
    "frenzied_regeneration"
  )
end

function me.TestSoundDownFrenziedRegeneration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrenziedRegeneration",
    "frenzied_regeneration"
  )
end

function me.TestSoundAbolishPoison()
  mod.testHelper.TestSound(
    className,
    "TestSoundAbolishPoison",
    "abolish_poison"
  )
end

function me.TestSoundDownAbolishPoison()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAbolishPoison",
    "abolish_poison"
  )
end

function me.TestSoundInnervate()
  mod.testHelper.TestSound(
    className,
    "TestSoundInnervate",
    "innervate"
  )
end

function me.TestSoundDownInnervate()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInnervate",
    "innervate"
  )
end

function me.TestSoundNaturesSwiftness()
  mod.testHelper.TestSound(
    className,
    "TestSoundNaturesSwiftness",
    "natures_swiftness"
  )
end

function me.TestSoundDownNaturesSwiftness()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownNaturesSwiftness",
    "natures_swiftness"
  )
end

function me.TestSoundFaerieFire()
  mod.testHelper.TestSound(
    className,
    "TestSoundFaerieFire",
    "faerie_fire"
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidEntanglingRoots",
    "entangling_roots"
  )
end

function me.TestSoundEnemyAvoidFaerieFire()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFaerieFire",
    "faerie_fire"
  )
end

function me.TestSoundEnemyAvoidBash()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBash",
    "bash"
  )
end

function me.TestSoundEnemyAvoidFeralChargeEffect()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFeralChargeEffect",
    "feral_charge_effect"
  )
end

function me.TestSoundSelfAvoidEntanglingRoots()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidEntanglingRoots",
    "entangling_roots"
  )
end

function me.TestSoundSelfAvoidFaerieFire()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFaerieFire",
    "faerie_fire"
  )
end

function me.TestSoundSelfAvoidBash()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBash",
    "bash"
  )
end

function me.TestSoundSelfAvoidFeralChargeEffect()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFeralChargeEffect",
    "feral_charge_effect"
  )
end

function me.TestParseBarkskin()
  mod.testHelper.TestParse(
    className,
    "TestParseBarkskin",
    "barkskin",
    "$player$ gains Barkskin.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBarkskin()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBarkskin",
    "barkskin",
    "Barkskin fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNaturesGrasp()
  mod.testHelper.TestParse(
    className,
    "TestParseNaturesGrasp",
    "natures_grasp",
    "$player$ gains Nature's Grasp.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownNaturesGrasp()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownNaturesGrasp",
    "natures_grasp",
    "Nature's Grasp fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBash()
  mod.testHelper.TestParse(
    className,
    "TestParseBash",
    "bash",
    "You are afflicted by Bash.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFeralCharge()
  mod.testHelper.TestParse(
    className,
    "TestParseFeralCharge",
    "feral_charge",
    "You are afflicted by Feral Charge Effect.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFrenziedRegeneration()
  mod.testHelper.TestParse(
    className,
    "TestParseFrenziedRegeneration",
    "frenzied_regeneration",
    "$player$ gains Frenzied Regeneration.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrenziedRegeneration()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrenziedRegeneration",
    "frenzied_regeneration",
    "Frenzied Regeneration fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAbolishPoison()
  mod.testHelper.TestParse(
    className,
    "TestParseAbolishPoison",
    "abolish_poison",
    "$player$ gains Abolish Poison.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAbolishPoison()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAbolishPoison",
    "abolish_poison",
    "Abolish Poison fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseInnervate()
  mod.testHelper.TestParse(
    className,
    "TestParseInnervate",
    "innervate",
    "$player$ gains Innervate.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInnervate()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInnervate",
    "innervate",
    "Innervate fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNaturesSwiftness()
  mod.testHelper.TestParse(
    className,
    "TestParseNaturesSwiftness",
    "natures_swiftness",
    "$player$ gains Nature's Swiftness.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownNaturesSwiftness()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownNaturesSwiftness",
    "natures_swiftness",
    "Nature's Swiftness fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFaerieFire()
  mod.testHelper.TestParse(
    className,
    "TestParseFaerieFire",
    "faerie_fire",
    "You are afflicted by Faerie Fire.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneEntanglingRoots()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneEntanglingRoots",
    "entangling_roots",
    "Your Entangling Roots failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistEntanglingRoots()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneEntanglingRoots",
    "entangling_roots",
    "Your Entangling Roots failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneFaerieFire()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFaerieFire",
    "faerie_fire",
    "Your Faerie Fire failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFaerieFire()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFaerieFire",
    "faerie_fire",
    "Your Faerie Fire was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeBash",
    "bash",
    "Your Bash was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryBash",
    "bash",
    "Your Bash is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBash",
    "bash",
    "Your Bash failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBash",
    "bash",
    "Your Bash missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistBash",
    "bash",
    "Your Bash was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFeralChargeEffect()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFeralChargeEffect",
    "feral_charge",
    "Your Feral Charge Effect failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFeralChargeEffect()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFeralChargeEffect",
    "feral_charge",
    "Your Feral Charge Effect was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneEntanglingRoots()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneEntanglingRoots",
    "entangling_roots",
    "$player$'s Entangling Roots failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistEntanglingRoots()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistEntanglingRoots",
    "entangling_roots",
    "$player$'s Entangling Roots was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFaerieFire()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFaerieFire",
    "faerie_fire",
    "$player$'s Faerie Fire failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFaerieFire()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFaerieFire",
    "faerie_fire",
    "$player$'s Faerie Fire was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeBash",
    "bash",
    "$player$'s Bash was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryBash",
    "bash",
    "$player$'s Bash was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBash",
    "bash",
    "$player$'s Bash failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBash",
    "bash",
    "$player$'s Bash misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistBash",
    "bash",
    "$player$'s Bash was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFeralChargeEffect()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFeralChargeEffect",
    "feral_charge",
    "$player$'s Feral Charge Effect failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFeralChargeEffect()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFeralChargeEffect",
    "feral_charge",
    "$player$'s Feral Charge Effect was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
