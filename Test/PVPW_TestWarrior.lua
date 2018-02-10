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
mod.testWarrior = me

me.tag = "TestWarrior"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[1]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARRIOR__Test()
  mod.testReporter.StartTestRun("global_warrior_all")
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

function _G.__PVPW__TEST_WARRIOR__Test_Sound()
  mod.testReporter.StartTestRun("global_warrior_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warrior_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warrior_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_warrior_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Parse()
  mod.testReporter.StartTestRun("global_warrior_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warrior_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warrior_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warrior_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_warrior_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldWall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldWall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBattleStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDefensiveStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInterceptStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLastStand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLastStand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChargeStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidChargeStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHamstring)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidOverpower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBloodthirst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidInterceptStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShieldBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidChargeStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHamstring)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidOverpower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBloodthirst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidInterceptStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidShieldBash)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseDeathWish)
  mod.testReporter.AddToTestQueue(me.TestParseDownDeathWish)
  mod.testReporter.AddToTestQueue(me.TestParseBerserkerRage)
  mod.testReporter.AddToTestQueue(me.TestParseDownBerserkerRage)
  mod.testReporter.AddToTestQueue(me.TestParseRecklessness)
  mod.testReporter.AddToTestQueue(me.TestParseDownRecklessness)
  mod.testReporter.AddToTestQueue(me.TestParseShieldWall)
  mod.testReporter.AddToTestQueue(me.TestParseDownShieldWall)
  mod.testReporter.AddToTestQueue(me.TestParseBattleStance)
  mod.testReporter.AddToTestQueue(me.TestParseBerserkerStance)
  mod.testReporter.AddToTestQueue(me.TestParseDefensiveStance)
  mod.testReporter.AddToTestQueue(me.TestParseLastStand)
  mod.testReporter.AddToTestQueue(me.TestParseDownLastStand)
  mod.testReporter.AddToTestQueue(me.TestParseBloodrage)
  mod.testReporter.AddToTestQueue(me.TestParseDownBloodrage)
  mod.testReporter.AddToTestQueue(me.TestParseInterceptStun)
  mod.testReporter.AddToTestQueue(me.TestParseDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseChargeStun)
  mod.testReporter.AddToTestQueue(me.TestParseIntimidatingShout)
  mod.testReporter.AddToTestQueue(me.TestParsePummel)
  mod.testReporter.AddToTestQueue(me.TestParseCritPummel)
  mod.testReporter.AddToTestQueue(me.TestParseShieldBlock)
  mod.testReporter.AddToTestQueue(me.TestParseDownShieldBlock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneChargeStun)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistChargeStun)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneOverpower)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissOverpower)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneInterceptStun)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistInterceptStun)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneIntimidatingShout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistIntimidatingShout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgePummel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryPummel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePummel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissPummel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockPummel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneChargeStun)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistChargeStun)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockHamstring)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockMortalStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneOverpower)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissOverpower)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockBloodthirst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneInterceptStun)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistInterceptStun)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneIntimidatingShout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistIntimidatingShout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgePummel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryPummel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePummel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissPummel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockPummel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistConcussionBlow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissDisarm)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissShieldBash)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockShieldBash)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundDeathWish()
  mod.testHelper.TestSound(
    className,
    "TestSoundDeathWish",
    "death_wish"
  )
end

function me.TestSoundDownDeathWish()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownDeathWish",
    "death_wish"
  )
end

function me.TestSoundBerserkerRage()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerRage",
    "berserker_rage"
  )
end

function me.TestSoundDownBerserkerRage()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserkerRage",
    "berserker_rage"
  )
end

function me.TestSoundRecklessness()
  mod.testHelper.TestSound(
    className,
    "TestSoundRecklessness",
    "recklessness"
  )
end

function me.TestSoundDownRecklessness()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRecklessness",
    "recklessness"
  )
end

function me.TestSoundShieldWall()
  mod.testHelper.TestSound(
    className,
    "TestSoundShieldWall",
    "shield_wall"
  )
end

function me.TestSoundDownShieldWall()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShieldWall",
    "shield_wall"
  )
end

function me.TestSoundBattleStance()
  mod.testHelper.TestSound(
    className,
    "TestSoundBattleStance",
    "battle_stance"
  )
end

function me.TestSoundBerserkerStance()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerStance",
    "berserker_stance"
  )
end

function me.TestSoundDefensiveStance()
  mod.testHelper.TestSound(
    className,
    "TestSoundDefensiveStance",
    "defensive_stance"
  )
end

function me.TestSoundInterceptStun()
  mod.testHelper.TestSound(
    className,
    "TestSoundInterceptStun",
    "intercept_stun"
  )
end

function me.TestSoundLastStand()
  mod.testHelper.TestSound(
    className,
    "TestSoundLastStand",
    "last_stand"
  )
end

function me.TestSoundDownLastStand()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownLastStand",
    "last_stand"
  )
end

function me.TestSoundDisarm()
  mod.testHelper.TestSound(
    className,
    "TestSoundDisarm",
    "disarm"
  )
end

function me.TestSoundConcussionBlow()
  mod.testHelper.TestSound(
    className,
    "TestSoundConcussionBlow",
    "concussion_blow"
  )
end

function me.TestSoundBloodrage()
  mod.testHelper.TestSound(
    className,
    "TestSoundBloodrage",
    "bloodrage"
  )
end

function me.TestSoundDownBloodrage()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBloodrage",
    "bloodrage"
  )
end

function me.TestSoundPummel()
  mod.testHelper.TestSound(
    className,
    "TestSoundPummel",
    "pummel"
  )
end

function me.TestSoundChargeStun()
  mod.testHelper.TestSound(
    className,
    "TestSoundChargeStun",
    "charge_stun"
  )
end

function me.TestSoundIntimidatingShout()
  mod.testHelper.TestSound(
    className,
    "TestSoundIntimidatingShout",
    "intimidating_shout"
  )
end

function me.TestSoundShieldBlock()
  mod.testHelper.TestSound(
    className,
    "TestSoundShieldBlock",
    "shield_block"
  )
end

function me.TestSoundDownShieldBlock()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShieldBlock",
    "shield_block"
  )
end

function me.TestSoundEnemyAvoidChargeStun()
  mod.testHelper.TestSound(
    className,
    "TestSoundEnemyAvoidChargeStun",
    "charge_stun"
  )
end

function me.TestSoundEnemyAvoidHamstring()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidHamstring",
    "hamstring"
  )
end

function me.TestSoundEnemyAvoidMortalStrike()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidMortalStrike",
    "mortal_strike"
  )
end

function me.TestSoundEnemyAvoidOverpower()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidOverpower",
    "overpower"
  )
end

function me.TestSoundEnemyAvoidBloodthirst()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBloodthirst",
    "bloodthirst"
  )
end

function me.TestSoundEnemyAvoidInterceptStun()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidInterceptStun",
    "intercept_stun"
  )
end

function me.TestSoundEnemyAvoidIntimidatingShout()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidIntimidatingShout",
    "intimidating_shout"
  )
end

function me.TestSoundEnemyAvoidPummel()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPummel",
    "pummel"
  )
end

function me.TestSoundEnemyAvoidConcussionBlow()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidConcussionBlow",
    "concussion_blow"
  )
end

function me.TestSoundEnemyAvoidDisarm()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidDisarm",
    "disarm"
  )
end

function me.TestSoundEnemyAvoidShieldBash()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidShieldBash",
    "shield_bash"
  )
end

function me.TestSoundSelfAvoidChargeStun()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidChargeStun",
    "charge_stun"
  )
end

function me.TestSoundSelfAvoidHamstring()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidHamstring",
    "hamstring"
  )
end

function me.TestSoundSelfAvoidMortalStrike()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidMortalStrike",
    "mortal_strike"
  )
end

function me.TestSoundSelfAvoidOverpower()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidOverpower",
    "overpower"
  )
end

function me.TestSoundSelfAvoidBloodthirst()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBloodthirst",
    "bloodthirst"
  )
end

function me.TestSoundSelfAvoidInterceptStun()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidInterceptStun",
    "intercept_stun"
  )
end

function me.TestSoundSelfAvoidIntimidatingShout()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidIntimidatingShout",
    "intimidating_shout"
  )
end

function me.TestSoundSelfAvoidPummel()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPummel",
    "pummel"
  )
end

function me.TestSoundSelfAvoidConcussionBlow()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidConcussionBlow",
    "concussion_blow"
  )
end

function me.TestSoundSelfAvoidDisarm()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidDisarm",
    "disarm"
  )
end

function me.TestSoundSelfAvoidShieldBash()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidShieldBash",
    "shield_bash"
  )
end

function me.TestParseBerserkerRage()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerRage",
    "berserker_rage",
    "$player$ gains Berserker Rage.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBerserkerRage()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBerserkerRage",
    "berserker_rage",
    "Berserker Rage fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseRecklessness()
  mod.testHelper.TestParse(
    className,
    "TestParseRecklessness",
    "recklessness",
    "$player$ gains Recklessness.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRecklessness()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRecklessness",
    "recklessness",
    "Recklessness fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDeathWish()
  mod.testHelper.TestParse(
    className,
    "TestParseDeathWish",
    "death_wish",
    "$player$ gains Death Wish.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownDeathWish()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownDeathWish",
    "death_wish",
    "Death Wish fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseShieldWall()
  mod.testHelper.TestParse(
    className,
    "TestParseShieldWall",
    "shield_wall",
    "$player$ gains Shield Wall.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShieldWall()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShieldWall",
    "shield_wall",
    "Shield Wall fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBattleStance()
  mod.testHelper.TestParse(
    className,
    "TestParseBattleStance",
    "battle_stance",
    "$player$ gains Battle Stance.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseBerserkerStance()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerStance",
    "berserker_stance",
    "$player$ gains Berserker Stance.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDefensiveStance()
  mod.testHelper.TestParse(
    className,
    "TestParseDefensiveStance",
    "defensive_stance",
    "$player$ gains Defensive Stance.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseInterceptStun()
  mod.testHelper.TestParse(
    className,
    "TestParseInterceptStun",
    "intercept_stun",
    "You are afflicted by Intercept Stun.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseLastStand()
  mod.testHelper.TestParse(
    className,
    "TestParseLastStand",
    "last_stand",
    "$player$ gains Last Stand.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownLastStand()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownLastStand",
    "last_stand",
    "Last Stand fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDisarm()
  mod.testHelper.TestParse(
    className,
    "TestParseDisarm",
    "disarm",
    "You are afflicted by Disarm.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseConcussionBlow()
  mod.testHelper.TestParse(
    className,
    "TestParseConcussionBlow",
    "concussion_blow",
    "You are afflicted by Concussion Blow.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBloodrage()
  mod.testHelper.TestParse(
    className,
    "TestParseBloodrage",
    "bloodrage",
    "$player$ gains Bloodrage.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBloodrage()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBloodrage",
    "bloodrage",
    "Bloodrage fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParsePummel()
  mod.testHelper.TestParse(
    className,
    "TestParsePummel",
    "pummel",
    "$player$'s Pummel hits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritPummel()
  mod.testHelper.TestParse(
    className,
    "TestParseCritPummel",
    "pummel",
    "$player$'s Pummel crits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseChargeStun()
  mod.testHelper.TestParse(
    className,
    "TestParseChargeStun",
    "charge_stun",
    "You are afflicted by Charge Stun.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseIntimidatingShout()
  mod.testHelper.TestParse(
    className,
    "TestParseIntimidatingShout",
    "intimidating_shout",
    "You are afflicted by Intimidating Shout.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseShieldBlock()
  mod.testHelper.TestParse(
    className,
    "TestParseShieldBlock",
    "shield_block",
    "$player$ gains Shield Block.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShieldBlock()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShieldBlock",
    "shield_block",
    "Shield Block fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidImmuneChargeStun()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneChargeStun",
    "charge_stun",
    "Your Charge Stun failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistChargeStun()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistChargeStun",
    "charge_stun",
    "Your Charge Stun was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeHamstring()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeHamstring",
    "hamstring",
    "Your Hamstring was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryHamstring()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryHamstring",
    "hamstring",
    "Your Hamstring is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneHamstring()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneHamstring",
    "hamstring",
    "Your Hamstring failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissHamstring()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissHamstring",
    "hamstring",
    "Your Hamstring missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockHamstring()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockHamstring",
    "hamstring",
    "Your Hamstring was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeMortalStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeMortalStrike",
    "mortal_strike",
    "Your Mortal Strike was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryMortalStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryMortalStrike",
    "mortal_strike",
    "Your Mortal Strike is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneMortalStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneMortalStrike",
    "mortal_strike",
    "Your Mortal Strike failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissMortalStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissMortalStrike",
    "mortal_strike",
    "Your Mortal Strike missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockMortalStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockMortalStrike",
    "mortal_strike",
    "Your Mortal Strike was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneOverpower()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneOverpower",
    "overpower",
    "Your Overpower failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissOverpower()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissOverpower",
    "overpower",
    "Your Overpower missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeBloodthirst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeBloodthirst",
    "bloodthirst",
    "Your Bloodthirst was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryBloodthirst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryBloodthirst",
    "bloodthirst",
    "Your Bloodthirst is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneBloodthirst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBloodthirst",
    "bloodthirst",
    "Your Bloodthirst failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBloodthirst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBloodthirst",
    "bloodthirst",
    "Your Bloodthirst missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockBloodthirst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockBloodthirst",
    "bloodthirst",
    "Your Bloodthirst was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneInterceptStun()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneInterceptStun",
    "intercept_stun",
    "Your Intercept Stun failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistInterceptStun()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistInterceptStun",
    "intercept_stun",
    "Your Intercept Stun was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneIntimidatingShout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneIntimidatingShout",
    "intimidating_shout",
    "Your Intimidating Shout failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistIntimidatingShout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistIntimidatingShout",
    "intimidating_shout",
    "Your Intimidating Shout was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgePummel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgePummel",
    "pummel",
    "Your Pummel was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryPummel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryPummel",
    "pummel",
    "Your Pummel is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmunePummel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePummel",
    "pummel",
    "Your Pummel failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissPummel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissPummel",
    "pummel",
    "Your Pummel missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockPummel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockPummel",
    "pummel",
    "Your Pummel was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeConcussionBlow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeConcussionBlow",
    "concussion_blow",
    "Your Concussion Blow was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryConcussionBlow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryConcussionBlow",
    "concussion_blow",
    "Your Concussion Blow is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneConcussionBlow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneConcussionBlow",
    "concussion_blow",
    "Your Concussion Blow failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissConcussionBlow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissConcussionBlow",
    "concussion_blow",
    "Your Concussion Blow missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistConcussionBlow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistConcussionBlow",
    "concussion_blow",
    "Your Concussion Blow was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeDisarm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeDisarm",
    "disarm",
    "Your Disarm was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryDisarm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryDisarm",
    "disarm",
    "Your Disarm is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneDisarm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneDisarm",
    "disarm",
    "Your Disarm failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissDisarm()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissDisarm",
    "disarm",
    "Your Disarm missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeShieldBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeShieldBash",
    "shield_bash",
    "Your Shield Bash was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryShieldBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryShieldBash",
    "shield_bash",
    "Your Shield Bash is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneShieldBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneShieldBash",
    "shield_bash",
    "Your Shield Bash failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissShieldBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissShieldBash",
    "shield_bash",
    "Your Shield Bash missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockShieldBash()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockShieldBash",
    "shield_bash",
    "Your Shield Bash was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneChargeStun()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneChargeStun",
    "charge_stun",
    "$player$'s Charge Stun failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistChargeStun()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistChargeStun",
    "charge_stun",
    "$player$'s Charge Stun was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeHamstring()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeHamstring",
    "hamstring",
    "$player$'s Hamstring was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryHamstring()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryHamstring",
    "hamstring",
    "$player$'s Hamstring was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneHamstring()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneHamstring",
    "hamstring",
    "$player$'s Hamstring failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissHamstring()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissHamstring",
    "hamstring",
    "$player$'s Hamstring misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockHamstring()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockHamstring",
    "hamstring",
    "$player$'s Hamstring was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeMortalStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeMortalStrike",
    "mortal_strike",
    "$player$'s Mortal Strike was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryMortalStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryMortalStrike",
    "mortal_strike",
    "$player$'s Mortal Strike was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneMortalStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneMortalStrike",
    "mortal_strike",
    "$player$'s Mortal Strike failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissMortalStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissMortalStrike",
    "mortal_strike",
    "$player$'s Mortal Strike misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockMortalStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockMortalStrike",
    "mortal_strike",
    "$player$'s Mortal Strike was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneOverpower()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneOverpower",
    "overpower",
    "$player$'s Overpower failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissOverpower()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissOverpower",
    "overpower",
    "$player$'s Overpower misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeBloodthirst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeBloodthirst",
    "bloodthirst",
    "$player$'s Bloodthirst was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryBloodthirst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryBloodthirst",
    "bloodthirst",
    "$player$'s Bloodthirst was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneBloodthirst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBloodthirst",
    "bloodthirst",
    "$player$'s Bloodthirst failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBloodthirst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBloodthirst",
    "bloodthirst",
    "$player$'s Bloodthirst misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockBloodthirst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockBloodthirst",
    "bloodthirst",
    "$player$'s Bloodthirst was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneInterceptStun()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneInterceptStun",
    "intercept_stun",
    "$player$'s Intercept Stun failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistInterceptStun()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistInterceptStun",
    "intercept_stun",
    "$player$'s Intercept Stun was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneIntimidatingShout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneIntimidatingShout",
    "intimidating_shout",
    "$player$'s Intimidating Shout failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistIntimidatingShout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistIntimidatingShout",
    "intimidating_shout",
    "$player$'s Intimidating Shout was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgePummel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgePummel",
    "pummel",
    "$player$'s Pummel was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryPummel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryPummel",
    "pummel",
    "$player$'s Pummel was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmunePummel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePummel",
    "pummel",
    "$player$'s Pummel failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissPummel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissPummel",
    "pummel",
    "$player$'s Pummel misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockPummel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockPummel",
    "pummel",
    "$player$'s Pummel was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeConcussionBlow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeConcussionBlow",
    "concussion_blow",
    "$player$'s Concussion Blow was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryConcussionBlow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryConcussionBlow",
    "concussion_blow",
    "$player$'s Concussion Blow was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneConcussionBlow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneConcussionBlow",
    "concussion_blow",
    "$player$'s Concussion Blow failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissConcussionBlow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissConcussionBlow",
    "concussion_blow",
    "$player$'s Concussion Blow misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistConcussionBlow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistConcussionBlow",
    "concussion_blow",
    "$player$'s Concussion Blow was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeDisarm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeDisarm",
    "disarm",
    "$player$'s Disarm was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryDisarm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryDisarm",
    "disarm",
    "$player$'s Disarm was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneDisarm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneDisarm",
    "disarm",
    "$player$'s Disarm failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissDisarm()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissDisarm",
    "disarm",
    "$player$'s Disarm misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeShieldBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeShieldBash",
    "shield_bash",
    "$player$'s Shield Bash was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryShieldBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryShieldBash",
    "shield_bash",
    "$player$'s Shield Bash was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneShieldBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneShieldBash",
    "shield_bash",
    "$player$'s Shield Bash failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissShieldBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissShieldBash",
    "shield_bash",
    "$player$'s Shield Bash misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockShieldBash()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockShieldBash",
    "shield_bash",
    "$player$'s Shield Bash was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end
