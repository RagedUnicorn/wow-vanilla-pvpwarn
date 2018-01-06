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
local className = "warrior"

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
  local testName = "TestSoundDeathWish"
  local spellName = "death_wish"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownDeathWish()
  local testName = "TestSoundDownDeathWish"
  local spellName = "death_wish"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundBerserkerRage()
  local testName = "TestSoundBerserkerRage"
  local spellName = "berserker_rage"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownBerserkerRage()
  local testName = "TestSoundDownBerserkerRage"
  local spellName = "berserker_rage"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundRecklessness()
  local testName = "TestSoundRecklessness"
  local spellName = "recklessness"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownRecklessness()
  local testName = "TestSoundDownRecklessness"
  local spellName = "recklessness"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundShieldWall()
  local testName = "TestSoundShieldWall"
  local spellName = "shield_wall"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownShieldWall()
  local testName = "TestSoundDownShieldWall"
  local spellName = "shield_wall"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundBattleStance()
  local testName = "TestSoundBattleStance"
  local spellName = "battle_stance"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundBerserkerStance()
  local testName = "TestSoundBerserkerStance"
  local spellName = "berserker_stance"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDefensiveStance()
  local testName = "TestSoundDefensiveStance"
  local spellName = "defensive_stance"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundInterceptStun()
  local testName = "TestSoundInterceptStun"
  local spellName = "intercept_stun"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundLastStand()
  local testName = "TestSoundLastStand"
  local spellName = "last_stand"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownLastStand()
  local testName = "TestSoundDownLastStand"
  local spellName = "last_stand"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDisarm()
  local testName = "TestSoundDisarm"
  local spellName = "disarm"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundConcussionBlow()
  local testName = "TestSoundConcussionBlow"
  local spellName = "concussion_blow"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundBloodrage()
  local testName = "TestSoundBloodrage"
  local spellName = "bloodrage"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownBloodrage()
  local testName = "TestSoundDownBloodrage"
  local spellName = "bloodrage"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundPummel()
  local testName = "TestSoundPummel"
  local spellName = "pummel"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundChargeStun()
  local testName = "TestSoundChargeStun"
  local spellName = "charge_stun"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundIntimidatingShout()
  local testName = "TestSoundIntimidatingShout"
  local spellName = "intimidating_shout"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundShieldBlock()
  local testName = "TestSoundShieldBlock"
  local spellName = "shield_block"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundDownShieldBlock()
  local testName = "TestSoundDownShieldBlock"
  local spellName = "shield_block"
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidChargeStun()
  local testName = "TestSoundEnemyAvoidChargeStun"
  local spellName = "charge_stun"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidHamstring()
  local testName = "TestSoundEnemyAvoidHamstring"
  local spellName = "hamstring"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidMortalStrike()
  local testName = "TestSoundEnemyAvoidMortalStrike"
  local spellName = "mortal_strike"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidOverpower()
  local testName = "TestSoundEnemyAvoidOverpower"
  local spellName = "overpower"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidBloodthirst()
  local testName = "TestSoundEnemyAvoidBloodthirst"
  local spellName = "bloodthirst"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidInterceptStun()
  local testName = "TestSoundEnemyAvoidInterceptStun"
  local spellName = "intercept_stun"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidIntimidatingShout()
  local testName = "TestSoundEnemyAvoidIntimidatingShout"
  local spellName = "intimidating_shout"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidPummel()
  local testName = "TestSoundEnemyAvoidPummel"
  local spellName = "pummel"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidConcussionBlow()
  local testName = "TestSoundEnemyAvoidConcussionBlow"
  local spellName = "concussion_blow"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidDisarm()
  local testName = "TestSoundEnemyAvoidDisarm"
  local spellName = "disarm"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundEnemyAvoidShieldBash()
  local testName = "TestSoundEnemyAvoidShieldBash"
  local spellName = "shield_bash"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played enemy avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play enemy avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidChargeStun()
  local testName = "TestSoundSelfAvoidChargeStun"
  local spellName = "charge_stun"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidHamstring()
  local testName = "TestSoundSelfAvoidHamstring"
  local spellName = "hamstring"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidMortalStrike()
  local testName = "TestSoundSelfAvoidMortalStrike"
  local spellName = "mortal_strike"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidOverpower()
  local testName = "TestSoundSelfAvoidOverpower"
  local spellName = "overpower"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidBloodthirst()
  local testName = "TestSoundSelfAvoidBloodthirst"
  local spellName = "bloodthirst"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidInterceptStun()
  local testName = "TestSoundSelfAvoidInterceptStun"
  local spellName = "intercept_stun"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidIntimidatingShout()
  local testName = "TestSoundSelfAvoidIntimidatingShout"
  local spellName = "intimidating_shout"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidPummel()
  local testName = "TestSoundSelfAvoidPummel"
  local spellName = "pummel"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidConcussionBlow()
  local testName = "TestSoundSelfAvoidConcussionBlow"
  local spellName = "concussion_blow"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidDisarm()
  local testName = "TestSoundSelfAvoidDisarm"
  local spellName = "disarm"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestSoundSelfAvoidShieldBash()
  local testName = "TestSoundSelfAvoidShieldBash"
  local spellName = "shield_bash"
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played self avoid sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play self avoid sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDeathWish()
  local spellName = "death_wish"
  local testName = "TestParseDeathWish"
  local combatMessage = "$player$ gains Death Wish."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownDeathWish()
  local testName = "TestParseDownDeathWish"
  local spellName = "death_wish"
  local combatMessage = "Death Wish fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseBerserkerRage()
  local testName = "TestParseBerserkerRage"
  local spellName = "berserker_rage"
  local combatMessage = "$player$ gains Berserker Rage."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownBerserkerRage()
  local testName = "TestParseDownBerserkerRage"
  local spellName = "barkskin"
  local combatMessage = "Berserker Rage fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseRecklessness()
  local testName = "TestParseRecklessness"
  local spellName = "recklessness"
  local combatMessage = "$player$ gains Recklessness."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownRecklessness()
  local testName = "TestParseDownRecklessness"
  local spellName = "recklessness"
  local combatMessage = "Recklessness fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseShieldWall()
  local testName = "TestParseShieldWall"
  local spellName = "shield_wall"
  local combatMessage = "$player$ gains Shield Wall."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownShieldWall()
  local testName = "TestParseDownShieldWall"
  local spellName = "shield_wall"
  local combatMessage = "Shield Wall fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseBattleStance()
  local testName = "TestParseBattleStance"
  local spellName = "battle_stance"
  local combatMessage = "$player$ gains Battle Stance."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseBerserkerStance()
  local testName = "TestParseBerserkerStance"
  local spellName = "berserker_stance"
  local combatMessage = "$player$ gains Berserker Stance."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDefensiveStance()
  local testName = "TestParseDefensiveStance"
  local spellName = "defensive_stance"
  local combatMessage = "$player$ gains Defensive Stance."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseLastStand()
  local testName = "TestParseLastStand"
  local spellName = "last_stand"
  local combatMessage = "$player$ gains Last Stand."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownLastStand()
  local testName = "TestParseDownLastStand"
  local spellName = "last_stand"
  local combatMessage = "Last Stand fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseBloodrage()
  local testName = "TestParseBloodrage"
  local spellName = "bloodrage"
  local combatMessage = "$player$ gains Bloodrage."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownBloodrage()
  local testName = "TestParseDownBloodrage"
  local spellName = "bloodrage"
  local combatMessage = "Bloodrage fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseInterceptStun()
  local testName = "TestParseInterceptStun"
  local spellName = "intercept_stun"
  local combatMessage = "You are afflicted by Intercept Stun."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDisarm()
  local testName = "TestParseDisarm"
  local spellName = "disarm"
  local combatMessage = "You are afflicted by Disarm."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseConcussionBlow()
  local testName = "TestParseConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "You are afflicted by Concussion Blow."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseChargeStun()
  local testName = "TestParseChargeStun"
  local spellName = "charge_stun"
  local combatMessage = "You are afflicted by Charge Stun."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseIntimidatingShout()
  local testName = "TestParseIntimidatingShout"
  local spellName = "intimidating_shout"
  local combatMessage = "You are afflicted by Intimidating Shout."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParsePummel()
  local testName = "TestParsePummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel hits you for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseCritPummel()
  local testName = "TestParseCritPummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel crits you for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseShieldBlock()
  local testName = "TestParseShieldBlock"
  local spellName = "shield_block"
  local combatMessage = "$player$ gains Shield Block."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownShieldBlock()
  local testName = "TestParseDownShieldBlock"
  local spellName = "shield_block"
  local combatMessage = "Shield Block fades from $player$."
  local testType = mod.testHelper.testType.parseDown
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellAuraGoneOther)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneChargeStun()
  local testName = "TestParseEnemyAvoidImmuneChargeStun"
  local spellName = "charge_stun"
  local combatMessage = "Your Charge Stun failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistChargeStun()
  local testName = "TestParseEnemyAvoidResistChargeStun"
  local spellName = "charge_stun"
  local combatMessage = "Your Charge Stun was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeHamstring()
  local testName = "TestParseEnemyAvoidDodgeHamstring"
  local spellName = "hamstring"
  local combatMessage = "Your Hamstring was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryHamstring()
  local testName = "TestParseEnemyAvoidParryHamstring"
  local spellName = "hamstring"
  local combatMessage = "Your Hamstring is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneHamstring()
  local testName = "TestParseEnemyAvoidImmuneHamstring"
  local spellName = "hamstring"
  local combatMessage = "Your Hamstring failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissHamstring()
  local testName = "TestParseEnemyAvoidMissHamstring"
  local spellName = "hamstring"
  local combatMessage = "Your Hamstring missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockHamstring()
  local testName = "TestParseEnemyAvoidBlockHamstring"
  local spellName = "hamstring"
  local combatMessage = "Your Hamstring was blocked by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeMortalStrike()
  local testName = "TestParseEnemyAvoidDodgeMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "Your Mortal Strike was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryMortalStrike()
  local testName = "TestParseEnemyAvoidParryMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "Your Mortal Strike is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneMortalStrike()
  local testName = "TestParseEnemyAvoidImmuneMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "Your Mortal Strike failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissMortalStrike()
  local testName = "TestParseEnemyAvoidMissMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "Your Mortal Strike missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockMortalStrike()
  local testName = "TestParseEnemyAvoidBlockMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "Your Mortal Strike was blocked by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneOverpower()
  local testName = "TestParseEnemyAvoidImmuneOverpower"
  local spellName = "overpower"
  local combatMessage = "Your Overpower failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissOverpower()
  local testName = "TestParseEnemyAvoidMissOverpower"
  local spellName = "overpower"
  local combatMessage = "Your Overpower missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeBloodthirst()
  local testName = "TestParseEnemyAvoidDodgeBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "Your Bloodthirst was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryBloodthirst()
  local testName = "TestParseEnemyAvoidParryBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "Your Bloodthirst is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneBloodthirst()
  local testName = "TestParseEnemyAvoidImmuneBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "Your Bloodthirst failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissBloodthirst()
  local testName = "TestParseEnemyAvoidMissBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "Your Bloodthirst missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockBloodthirst()
  local testName = "TestParseEnemyAvoidBlockBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "Your Bloodthirst was blocked by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneInterceptStun()
  local testName = "TestParseEnemyAvoidImmuneInterceptStun"
  local spellName = "intercept_stun"
  local combatMessage = "Your Intercept Stun failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistInterceptStun()
  local testName = "TestParseEnemyAvoidResistInterceptStun"
  local spellName = "intercept_stun"
  local combatMessage = "Your Intercept Stun was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneIntimidatingShout()
  local testName = "TestParseEnemyAvoidImmuneIntimidatingShout"
  local spellName = "intimidating_shout"
  local combatMessage = "Your Intimidating Shout failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistIntimidatingShout()
  local testName = "TestParseEnemyAvoidResistIntimidatingShout"
  local spellName = "intimidating_shout"
  local combatMessage = "Your Intimidating Shout was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgePummel()
  local testName = "TestParseEnemyAvoidDodgePummel"
  local spellName = "pummel"
  local combatMessage = "Your Pummel was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryPummel()
  local testName = "TestParseEnemyAvoidParryPummel"
  local spellName = "pummel"
  local combatMessage = "Your Pummel is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmunePummel()
  local testName = "TestParseEnemyAvoidImmunePummel"
  local spellName = "pummel"
  local combatMessage = "Your Pummel failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissPummel()
  local testName = "TestParseEnemyAvoidMissPummel"
  local spellName = "pummel"
  local combatMessage = "Your Pummel missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockPummel()
  local testName = "TestParseEnemyAvoidBlockPummel"
  local spellName = "pummel"
  local combatMessage = "Your Pummel was blocked by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeConcussionBlow()
  local testName = "TestParseEnemyAvoidDodgeConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "Your Concussion Blow was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryConcussionBlow()
  local testName = "TestParseEnemyAvoidParryConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "Your Concussion Blow is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneConcussionBlow()
  local testName = "TestParseEnemyAvoidImmuneConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "Your Concussion Blow failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissConcussionBlow()
  local testName = "TestParseEnemyAvoidMissConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "Your Concussion Blow missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistConcussionBlow()
  local testName = "TestParseEnemyAvoidResistConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "Your Concussion Blow was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeDisarm()
  local testName = "TestParseEnemyAvoidDodgeDisarm"
  local spellName = "disarm"
  local combatMessage = "Your Disarm was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryDisarm()
  local testName = "TestParseEnemyAvoidParryDisarm"
  local spellName = "disarm"
  local combatMessage = "Your Disarm is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneDisarm()
  local testName = "TestParseEnemyAvoidImmuneDisarm"
  local spellName = "disarm"
  local combatMessage = "Your Disarm failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissDisarm()
  local testName = "TestParseEnemyAvoidMissDisarm"
  local spellName = "disarm"
  local combatMessage = "Your Disarm missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeShieldBash()
  local testName = "TestParseEnemyAvoidDodgeShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "Your Shield Bash was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryShieldBash()
  local testName = "TestParseEnemyAvoidParryShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "Your Shield Bash is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneShieldBash()
  local testName = "TestParseEnemyAvoidImmuneShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "Your Shield Bash failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidMissShieldBash()
  local testName = "TestParseEnemyAvoidMissShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "Your Shield Bash missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockShieldBash()
  local testName = "TestParseEnemyAvoidBlockShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "Your Shield Bash was blocked by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellSelfDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneChargeStun()
  local testName = "TestParseSelfAvoidImmuneChargeStun"
  local spellName = "charge_stun"
  local combatMessage = "$player$'s Charge Stun failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistChargeStun()
  local testName = "TestParseSelfAvoidResistChargeStun"
  local spellName = "charge_stun"
  local combatMessage = "$player$'s Charge Stun was resisted."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeHamstring()
  local testName = "TestParseSelfAvoidDodgeHamstring"
  local spellName = "hamstring"
  local combatMessage = "$player$'s Hamstring was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryHamstring()
  local testName = "TestParseSelfAvoidParryHamstring"
  local spellName = "hamstring"
  local combatMessage = "$player$'s Hamstring was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneHamstring()
  local testName = "TestParseSelfAvoidImmuneHamstring"
  local spellName = "hamstring"
  local combatMessage = "$player$'s Hamstring failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissHamstring()
  local testName = "TestParseSelfAvoidMissHamstring"
  local spellName = "hamstring"
  local combatMessage = "$player$'s Hamstring misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockHamstring()
  local testName = "TestParseSelfAvoidBlockHamstring"
  local spellName = "hamstring"
  local combatMessage = "$player$'s Hamstring was blocked."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeMortalStrike()
  local testName = "TestParseSelfAvoidDodgeMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "$player$'s Mortal Strike was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryMortalStrike()
  local testName = "TestParseSelfAvoidParryMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "$player$'s Mortal Strike was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneMortalStrike()
  local testName = "TestParseSelfAvoidImmuneMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "$player$'s Mortal Strike failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissMortalStrike()
  local testName = "TestParseSelfAvoidMissMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "$player$'s Mortal Strike misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockMortalStrike()
  local testName = "TestParseSelfAvoidBlockMortalStrike"
  local spellName = "mortal_strike"
  local combatMessage = "$player$'s Mortal Strike was blocked."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneOverpower()
  local testName = "TestParseSelfAvoidImmuneOverpower"
  local spellName = "overpower"
  local combatMessage = "$player$'s Overpower failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissOverpower()
  local testName = "TestParseSelfAvoidMissOverpower"
  local spellName = "overpower"
  local combatMessage = "$player$'s Overpower misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeBloodthirst()
  local testName = "TestParseSelfAvoidDodgeBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "$player$'s Bloodthirst was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryBloodthirst()
  local testName = "TestParseSelfAvoidParryBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "$player$'s Bloodthirst was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneBloodthirst()
  local testName = "TestParseSelfAvoidImmuneBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "$player$'s Bloodthirst failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissBloodthirst()
  local testName = "TestParseSelfAvoidMissBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "$player$'s Bloodthirst misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockBloodthirst()
  local testName = "TestParseSelfAvoidBlockBloodthirst"
  local spellName = "bloodthirst"
  local combatMessage = "$player$'s Bloodthirst was blocked."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneInterceptStun()
  local testName = "TestParseSelfAvoidImmuneInterceptStun"
  local spellName = "intercept_stun"
  local combatMessage = "$player$'s Intercept Stun failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistInterceptStun()
  local testName = "TestParseSelfAvoidResistInterceptStun"
  local spellName = "intercept_stun"
  local combatMessage = "$player$'s Intercept Stun was resisted."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneIntimidatingShout()
  local testName = "TestParseSelfAvoidImmuneIntimidatingShout"
  local spellName = "intimidating_shout"
  local combatMessage = "$player$'s Intimidating Shout failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistIntimidatingShout()
  local testName = "TestParseSelfAvoidResistIntimidatingShout"
  local spellName = "intimidating_shout"
  local combatMessage = "$player$'s Intimidating Shout was resisted."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgePummel()
  local testName = "TestParseSelfAvoidDodgePummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryPummel()
  local testName = "TestParseSelfAvoidParryPummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmunePummel()
  local testName = "TestParseSelfAvoidImmunePummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissPummel()
  local testName = "TestParseSelfAvoidMissPummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockPummel()
  local testName = "TestParseSelfAvoidBlockPummel"
  local spellName = "pummel"
  local combatMessage = "$player$'s Pummel was blocked."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeConcussionBlow()
  local testName = "TestParseSelfAvoidDodgeConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "$player$'s Concussion Blow was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryConcussionBlow()
  local testName = "TestParseSelfAvoidParryConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "$player$'s Concussion Blow was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneConcussionBlow()
  local testName = "TestParseSelfAvoidImmuneConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "$player$'s Concussion Blow failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissConcussionBlow()
  local testName = "TestParseSelfAvoidMissConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "$player$'s Concussion Blow misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistConcussionBlow()
  local testName = "TestParseSelfAvoidResistConcussionBlow"
  local spellName = "concussion_blow"
  local combatMessage = "$player$'s Concussion Blow was resisted."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeDisarm()
  local testName = "TestParseSelfAvoidDodgeDisarm"
  local spellName = "disarm"
  local combatMessage = "$player$'s Disarm was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryDisarm()
  local testName = "TestParseSelfAvoidParryDisarm"
  local spellName = "disarm"
  local combatMessage = "$player$'s Disarm was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneDisarm()
  local testName = "TestParseSelfAvoidImmuneDisarm"
  local spellName = "disarm"
  local combatMessage = "$player$'s Disarm failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissDisarm()
  local testName = "TestParseSelfAvoidMissDisarm"
  local spellName = "disarm"
  local combatMessage = "$player$'s Disarm misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeShieldBash()
  local testName = "TestParseSelfAvoidDodgeShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "$player$'s Shield Bash was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodge combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodge combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryShieldBash()
  local testName = "TestParseSelfAvoidParryShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "$player$'s Shield Bash was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parry combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parry combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneShieldBash()
  local testName = "TestParseSelfAvoidImmuneShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "$player$'s Shield Bash failed. You are immune."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidMissShieldBash()
  local testName = "TestParseSelfAvoidMissShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "$player$'s Shield Bash misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid miss combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid miss combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockShieldBash()
  local testName = "TestParseSelfAvoidBlockShieldBash"
  local spellName = "shield_bash"
  local combatMessage = "$player$'s Shield Bash was blocked."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid block combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid block combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end
