--[[
  PVPWarn - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2017 Michael Wiesendanger <michael.wiesendanger@gmail.com>

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
mod.testRogue = me

me.tag = "TestRogue"

-- global
local _G = getfenv(0)
local className = "rogue"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ROGUE__Test()
  mod.testReporter.StartTestRun("global_rogue_all")
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

--[[
  tests if a sound testcase can be found for each registered spell in PVPW_SpellMap
]]--
function _G.__PVPW__TEST_ROGUE__Test_Sound()
  mod.testReporter.StartTestRun("global_rogue_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end


function _G.__PVPW__TEST_ROGUE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_rogue_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_rogue_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_rogue_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Parse()
  mod.testReporter.StartTestRun("global_rogue_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_rogue_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_rogue_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_rogue_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_rogue_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRiposte)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGhostlyStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPremeditation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDistract)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGouge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRiposte)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGhostlyStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPremeditation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDistract)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidExposeArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGarrote)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRupture)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseBlind)
  mod.testReporter.AddToTestQueue(me.TestParseKick)
  mod.testReporter.AddToTestQueue(me.TestParseCritKick)
  mod.testReporter.AddToTestQueue(me.TestParseSprint)
  mod.testReporter.AddToTestQueue(me.TestParseDownSprint)
  mod.testReporter.AddToTestQueue(me.TestParseEvasion)
  mod.testReporter.AddToTestQueue(me.TestParseDownEvasion)
  mod.testReporter.AddToTestQueue(me.TestParseKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseAdrenalineRush)
  mod.testReporter.AddToTestQueue(me.TestParseDownAdrenalineRush)
  mod.testReporter.AddToTestQueue(me.TestParseBladeFlurry)
  mod.testReporter.AddToTestQueue(me.TestParseDownBladeFlurry)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeKick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryKick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissKick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockKick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeGouge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryGouge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGouge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissGouge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockGouge)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlind)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBlind)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSap)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePremeditation)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneDistract)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistDistract)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGarrote)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeRupture)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryRupture)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneRupture)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissRupture)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeKick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryKick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissKick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockKick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistCheapShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeGouge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryGouge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGouge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissGouge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockGouge)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistKidneyShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlind)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBlind)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockGhostlyStrike)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSap)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePremeditation)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneDistract)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistDistract)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissExposeArmor)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGarrote)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeRupture)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryRupture)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneRupture)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissRupture)


  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBlind()
  local testName = "TestSoundBlind"
  local spellName = "blind"
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

function me.TestSoundKick()
  local testName = "TestSoundKick"
  local spellName = "kick"
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

function me.TestSoundSprint()
  local testName = "TestSoundSprint"
  local spellName = "sprint"
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

function me.TestSoundDownSprint()
  local testName = "TestSoundDownSprint"
  local spellName = "sprint"
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

function me.TestSoundEvasion()
  local testName = "TestSoundEvasion"
  local spellName = "evasion"
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

function me.TestSoundDownEvasion()
  local testName = "TestSoundDownEvasion"
  local spellName = "evasion"
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

function me.TestSoundKidneyShot()
  local testName = "TestSoundKidneyShot"
  local spellName = "kidney_shot"
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

function me.TestSoundCheapShot()
  local testName = "TestSoundCheapShot"
  local spellName = "cheap_shot"
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

function me.TestSoundAdrenalineRush()
  local testName = "TestSoundAdrenalineRush"
  local spellName = "adrenaline_rush"
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

function me.TestSoundDownAdrenalineRush()
  local testName = "TestSoundDownAdrenalineRush"
  local spellName = "adrenaline_rush"
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

function me.TestSoundDownBladeFlurry()
  local testName = "TestSoundDownBladeFlurry"
  local spellName = "blade_flurry"
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

function me.TestSoundBladeFlurry()
  local testName = "TestSoundBladeFlurry"
  local spellName = "blade_flurry"
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

function me.TestSoundEnemyAvoidKick()
  local testName = "TestSoundEnemyAvoidKick"
  local spellName = "kick"
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

function me.TestSoundEnemyAvoidCheapShot()
  local testName = "TestSoundEnemyAvoidCheapShot"
  local spellName = "cheap_shot"
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

function me.TestSoundEnemyAvoidGouge()
  local testName = "TestSoundEnemyAvoidGouge"
  local spellName = "gouge"
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

function me.TestSoundEnemyAvoidRiposte()
  local testName = "TestSoundEnemyAvoidRiposte"
  local spellName = "riposte"
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

function me.TestSoundEnemyAvoidKidneyShot()
  local testName = "TestSoundEnemyAvoidKidneyShot"
  local spellName = "kidney_shot"
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

function me.TestSoundEnemyAvoidBlind()
  local testName = "TestSoundEnemyAvoidBlind"
  local spellName = "blind"
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

function me.TestSoundEnemyAvoidGhostlyStrike()
  local testName = "TestSoundEnemyAvoidGhostlyStrike"
  local spellName = "ghostly_strike"
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

function me.TestSoundEnemyAvoidSap()
  local testName = "TestSoundEnemyAvoidSap"
  local spellName = "sap"
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

function me.TestSoundEnemyAvoidPremeditation()
  local testName = "TestSoundEnemyAvoidPremeditation"
  local spellName = "premeditation"
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

function me.TestSoundEnemyAvoidDistract()
  local testName = "TestSoundEnemyAvoidDistract"
  local spellName = "distract"
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

function me.TestSoundEnemyAvoidExposeArmor()
  local testName = "TestSoundEnemyAvoidExposeArmor"
  local spellName = "expose_armor"
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

function me.TestSoundEnemyAvoidGarrote()
  local testName = "TestSoundEnemyAvoidGarrote"
  local spellName = "garrote"
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

function me.TestSoundEnemyAvoidRupture()
  local testName = "TestSoundEnemyAvoidRupture"
  local spellName = "rupture"
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

function me.TestSoundSelfAvoidKick()
  local testName = "TestSoundSelfAvoidKick"
  local spellName = "kick"
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

function me.TestSoundSelfAvoidCheapShot()
  local testName = "TestSoundSelfAvoidCheapShot"
  local spellName = "cheap_shot"
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

function me.TestSoundSelfAvoidGouge()
  local testName = "TestSoundSelfAvoidGouge"
  local spellName = "gouge"
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

function me.TestSoundSelfAvoidRiposte()
  local testName = "TestSoundSelfAvoidRiposte"
  local spellName = "riposte"
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

function me.TestSoundSelfAvoidKidneyShot()
  local testName = "TestSoundSelfAvoidKidneyShot"
  local spellName = "kidney_shot"
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

function me.TestSoundSelfAvoidBlind()
  local testName = "TestSoundSelfAvoidBlind"
  local spellName = "blind"
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

function me.TestSoundSelfAvoidGhostlyStrike()
  local testName = "TestSoundSelfAvoidGhostlyStrike"
  local spellName = "ghostly_strike"
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

function me.TestSoundSelfAvoidSap()
  local testName = "TestSoundSelfAvoidSap"
  local spellName = "sap"
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

function me.TestSoundSelfAvoidPremeditation()
  local testName = "TestSoundSelfAvoidPremeditation"
  local spellName = "premeditation"
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

function me.TestSoundSelfAvoidDistract()
  local testName = "TestSoundSelfAvoidDistract"
  local spellName = "distract"
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

function me.TestSoundSelfAvoidExposeArmor()
  local testName = "TestSoundSelfAvoidExposeArmor"
  local spellName = "expose_armor"
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

function me.TestSoundSelfAvoidGarrote()
  local testName = "TestSoundSelfAvoidGarrote"
  local spellName = "garrote"
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

function me.TestSoundSelfAvoidRupture()
  local testName = "TestSoundSelfAvoidRupture"
  local spellName = "rupture"
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

function me.TestParseBlind()
  local testName = "TestParseBlind"
  local spellName = "blind"
  local combatMessage = "You are afflicted by Blind."
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

function me.TestParseKick()
  local testName = "TestParseKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick hits you for $amount$."
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

function me.TestParseCritKick()
  local testName = "TestParseCritKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick crits you for $amount$."
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

function me.TestParseSprint()
  local testName = "TestParseSprint"
  local spellName = "sprint"
  local combatMessage = "$player$ gains Sprint."
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

function me.TestParseDownSprint()
  local testName = "TestParseDownSprint"
  local spellName = "sprint"
  local combatMessage = "Sprint fades from $player$."
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

function me.TestParseEvasion()
  local testName = "TestParseEvasion"
  local spellName = "evasion"
  local combatMessage = "$player$ gains Evasion."
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

function me.TestParseDownEvasion()
  local testName = "TestParseDownEvasion"
  local spellName = "evasion"
  local combatMessage = "Evasion fades from $player$."
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

function me.TestParseKidneyShot()
  local testName = "TestParseKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "You are afflicted by Kidney Shot."
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

function me.TestParseCheapShot()
  local testName = "TestParseCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "You are afflicted by Cheap Shot."
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

function me.TestParseAdrenalineRush()
  local testName = "TestParseAdrenalineRush"
  local spellName = "adrenaline_rush"
  local combatMessage = "$player$ gains Adrenaline Rush."
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

function me.TestParseDownAdrenalineRush()
  local testName = "TestParseDownAdrenalineRush"
  local spellName = "adrenaline_rush"
  local combatMessage = "Adrenaline Rush fades from $player$."
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

function me.TestParseBladeFlurry()
  local testName = "TestParseBladeFlurry"
  local spellName = "blade_flurry"
  local combatMessage = "$player$ gains Blade Flurry."
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

function me.TestParseDownBladeFlurry()
  local testName = "TestParseDownBladeFlurry"
  local spellName = "blade_flurry"
  local combatMessage = "Blade Flurry fades from $player$."
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

function me.TestParseEnemyAvoidDodgeKick()
  local testName = "TestParseEnemyAvoidDodgeKick"
  local spellName = "kick"
  local combatMessage = "Your Kick was dodged by $player$."
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

function me.TestParseEnemyAvoidParryKick()
  local testName = "TestParseEnemyAvoidParryKick"
  local spellName = "kick"
  local combatMessage = "Your Kick is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneKick()
  local testName = "TestParseEnemyAvoidImmuneKick"
  local spellName = "kick"
  local combatMessage = "Your Kick failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissKick()
  local testName = "TestParseEnemyAvoidMissKick"
  local spellName = "kick"
  local combatMessage = "Your Kick missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid missed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid missed combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidBlockKick()
  local testName = "TestParseEnemyAvoidBlockKick"
  local spellName = "kick"
  local combatMessage = "Your Kick was blocked by $player$."
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

function me.TestParseEnemyAvoidImmuneCheapShot()
  local testName = "TestParseEnemyAvoidImmuneCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "Your Cheap Shot failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissCheapShot()
  local testName = "TestParseEnemyAvoidMissCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "Your Cheap Shot missed $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid missed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid missed combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistCheapShot()
  local testName = "TestParseEnemyAvoidResistCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "Your Cheap Shot was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid resisted combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid resisted combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidDodgeGouge()
  local testName = "TestParseEnemyAvoidDodgeGouge"
  local spellName = "gouge"
  local combatMessage = "Your Gouge was dodged by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid dodged combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid dodged combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidParryGouge()
  local testName = "TestParseEnemyAvoidParryGouge"
  local spellName = "gouge"
  local combatMessage = "Your Gouge is parried by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed avoid parried combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse avoid parried combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneGouge()
  local testName = "TestParseEnemyAvoidImmuneGouge"
  local spellName = "gouge"
  local combatMessage = "Your Gouge failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissGouge()
  local testName = "TestParseEnemyAvoidMissGouge"
  local spellName = "gouge"
  local combatMessage = "Your Gouge missed $player$."
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

function me.TestParseEnemyAvoidBlockGouge()
  local testName = "TestParseEnemyAvoidBlockGouge"
  local spellName = "gouge"
  local combatMessage = "Your Gouge was blocked by $player$."
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

function me.TestParseEnemyAvoidDodgeRiposte()
  local testName = "TestParseEnemyAvoidDodgeRiposte"
  local spellName = "riposte"
  local combatMessage = "Your Riposte was dodged by $player$."
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

function me.TestParseEnemyAvoidParryRiposte()
  local testName = "TestParseEnemyAvoidParryRiposte"
  local spellName = "riposte"
  local combatMessage = "Your Riposte is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneRiposte()
  local testName = "TestParseEnemyAvoidImmuneRiposte"
  local spellName = "riposte"
  local combatMessage = "Your Riposte failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissRiposte()
  local testName = "TestParseEnemyAvoidMissRiposte"
  local spellName = "riposte"
  local combatMessage = "Your Riposte missed $player$."
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

function me.TestParseEnemyAvoidBlockRiposte()
  local testName = "TestParseEnemyAvoidBlockRiposte"
  local spellName = "riposte"
  local combatMessage = "Your Riposte was blocked by $player$."
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

function me.TestParseEnemyAvoidDodgeKidneyShot()
  local testName = "TestParseEnemyAvoidDodgeKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "Your Kidney Shot was dodged by $player$."
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

function me.TestParseEnemyAvoidParryKidneyShot()
  local testName = "TestParseEnemyAvoidParryKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "Your Kidney Shot is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneKidneyShot()
  local testName = "TestParseEnemyAvoidImmuneKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "Your Kidney Shot failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissKidneyShot()
  local testName = "TestParseEnemyAvoidMissKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "Your Kidney Shot missed $player$."
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

function me.TestParseEnemyAvoidResistKidneyShot()
  local testName = "TestParseEnemyAvoidResistKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "Your Kidney Shot was resisted by $player$."
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

function me.TestParseEnemyAvoidImmuneBlind()
  local testName = "TestParseEnemyAvoidImmuneBlind"
  local spellName = "blind"
  local combatMessage = "Your Blind failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissBlind()
  local testName = "TestParseEnemyAvoidMissBlind"
  local spellName = "blind"
  local combatMessage = "Your Blind missed $player$."
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

function me.TestParseEnemyAvoidDodgeGhostlyStrike()
  local testName = "TestParseEnemyAvoidDodgeGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "Your Ghostly Strike was dodged by $player$."
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

function me.TestParseEnemyAvoidParryGhostlyStrike()
  local testName = "TestParseEnemyAvoidParryGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "Your Ghostly Strike is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneGhostlyStrike()
  local testName = "TestParseEnemyAvoidImmuneGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "Your Ghostly Strike failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissGhostlyStrike()
  local testName = "TestParseEnemyAvoidMissGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "Your Ghostly Strike missed $player$."
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

function me.TestParseEnemyAvoidBlockGhostlyStrike()
  local testName = "TestParseEnemyAvoidBlockGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "Your Ghostly Strike was blocked by $player$."
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

function me.TestParseEnemyAvoidImmuneSap()
  local testName = "TestParseEnemyAvoidImmuneSap"
  local spellName = "sap"
  local combatMessage = "Your Sap failed. $player$ is immune."
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

function me.TestParseEnemyAvoidImmunePremeditation()
  local testName = "TestParseEnemyAvoidImmunePremeditation"
  local spellName = "premeditation"
  local combatMessage = "Your Premeditation failed. $player$ is immune."
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

function me.TestParseEnemyAvoidImmuneDistract()
  local testName = "TestParseEnemyAvoidImmuneDistract"
  local spellName = "distract"
  local combatMessage = "Your Distract failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistDistract()
  local testName = "TestParseEnemyAvoidResistDistract"
  local spellName = "distract"
  local combatMessage = "Your Distract was resisted by $player$."
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

function me.TestParseEnemyAvoidDodgeExposeArmor()
  local testName = "TestParseEnemyAvoidDodgeExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "Your Expose Armor was dodged by $player$."
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

function me.TestParseEnemyAvoidParryExposeArmor()
  local testName = "TestParseEnemyAvoidParryExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "Your Expose Armor is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneExposeArmor()
  local testName = "TestParseEnemyAvoidImmuneExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "Your Expose Armor failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissExposeArmor()
  local testName = "TestParseEnemyAvoidMissExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "Your Expose Armor missed $player$."
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

function me.TestParseEnemyAvoidImmuneGarrote()
  local testName = "TestParseEnemyAvoidImmuneGarrote"
  local spellName = "garrote"
  local combatMessage = "Your Garrote failed. $player$ is immune."
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

function me.TestParseEnemyAvoidDodgeRupture()
  local testName = "TestParseEnemyAvoidDodgeRupture"
  local spellName = "rupture"
  local combatMessage = "Your Rupture was dodged by $player$."
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

function me.TestParseEnemyAvoidParryRupture()
  local testName = "TestParseEnemyAvoidParryRupture"
  local spellName = "rupture"
  local combatMessage = "Your Rupture is parried by $player$."
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

function me.TestParseEnemyAvoidImmuneRupture()
  local testName = "TestParseEnemyAvoidImmuneRupture"
  local spellName = "rupture"
  local combatMessage = "Your Rupture failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissRupture()
  local testName = "TestParseEnemyAvoidMissRupture"
  local spellName = "rupture"
  local combatMessage = "Your Rupture missed $player$."
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

function me.TestParseSelfAvoidDodgeKick()
  local testName = "TestParseSelfAvoidDodgeKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick was dodged."
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

function me.TestParseSelfAvoidParryKick()
  local testName = "TestParseSelfAvoidParryKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick was parried."
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

function me.TestParseSelfAvoidImmuneKick()
  local testName = "TestParseSelfAvoidImmuneKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick failed. You are immune."
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

function me.TestParseSelfAvoidMissKick()
  local testName = "TestParseSelfAvoidMissKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid missed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid missed combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidBlockKick()
  local testName = "TestParseSelfAvoidBlockKick"
  local spellName = "kick"
  local combatMessage = "$player$'s Kick was blocked."
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

function me.TestParseSelfAvoidImmuneCheapShot()
  local testName = "TestParseSelfAvoidImmuneCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "$player$'s Cheap Shot failed. You are immune."
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

function me.TestParseSelfAvoidMissCheapShot()
  local testName = "TestParseSelfAvoidMissCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "$player$'s Cheap Shot misses you."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid missed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid missed combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistCheapShot()
  local testName = "TestParseSelfAvoidResistCheapShot"
  local spellName = "cheap_shot"
  local combatMessage = "$player$'s Cheap Shot was resisted."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid resisted combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid resisted combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidDodgeGouge()
  local testName = "TestParseSelfAvoidDodgeGouge"
  local spellName = "gouge"
  local combatMessage = "$player$'s Gouge was dodged."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid dodged combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid dodged combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidParryGouge()
  local testName = "TestParseSelfAvoidParryGouge"
  local spellName = "gouge"
  local combatMessage = "$player$'s Gouge was parried."
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnOthers)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed self avoid parried combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse self avoid parried combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidImmuneGouge()
  local testName = "TestParseSelfAvoidImmuneGouge"
  local spellName = "gouge"
  local combatMessage = "$player$'s Gouge failed. You are immune."
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

function me.TestParseSelfAvoidMissGouge()
  local testName = "TestParseSelfAvoidMissGouge"
  local spellName = "gouge"
  local combatMessage = "$player$'s Gouge misses you."
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

function me.TestParseSelfAvoidBlockGouge()
  local testName = "TestParseSelfAvoidBlockGouge"
  local spellName = "gouge"
  local combatMessage = "$player$'s Gouge was blocked."
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

function me.TestParseSelfAvoidDodgeRiposte()
  local testName = "TestParseSelfAvoidDodgeRiposte"
  local spellName = "riposte"
  local combatMessage = "$player$'s Riposte was dodged."
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

function me.TestParseSelfAvoidParryRiposte()
  local testName = "TestParseSelfAvoidParryRiposte"
  local spellName = "riposte"
  local combatMessage = "$player$'s Riposte was parried."
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

function me.TestParseSelfAvoidImmuneRiposte()
  local testName = "TestParseSelfAvoidImmuneRiposte"
  local spellName = "riposte"
  local combatMessage = "$player$'s Riposte failed. You are immune."
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

function me.TestParseSelfAvoidMissRiposte()
  local testName = "TestParseSelfAvoidMissRiposte"
  local spellName = "riposte"
  local combatMessage = "$player$'s Riposte misses you."
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

function me.TestParseSelfAvoidBlockRiposte()
  local testName = "TestParseSelfAvoidBlockRiposte"
  local spellName = "riposte"
  local combatMessage = "$player$'s Riposte was blocked."
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

function me.TestParseSelfAvoidDodgeKidneyShot()
  local testName = "TestParseSelfAvoidDodgeKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "$player$'s Kidney Shot was dodged."
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

function me.TestParseSelfAvoidParryKidneyShot()
  local testName = "TestParseSelfAvoidParryKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "$player$'s Kidney Shot was parried."
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

function me.TestParseSelfAvoidImmuneKidneyShot()
  local testName = "TestParseSelfAvoidImmuneKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "$player$'s Kidney Shot failed. You are immune."
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

function me.TestParseSelfAvoidMissKidneyShot()
  local testName = "TestParseSelfAvoidMissKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "$player$'s Kidney Shot misses you."
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

function me.TestParseSelfAvoidResistKidneyShot()
  local testName = "TestParseSelfAvoidResistKidneyShot"
  local spellName = "kidney_shot"
  local combatMessage = "$player$'s Kidney Shot was resisted."
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

function me.TestParseSelfAvoidImmuneBlind()
  local testName = "TestParseSelfAvoidImmuneBlind"
  local spellName = "blind"
  local combatMessage = "$player$'s Blind failed. You are immune."
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

function me.TestParseSelfAvoidMissBlind()
  local testName = "TestParseSelfAvoidMissBlind"
  local spellName = "blind"
  local combatMessage = "$player$'s Blind misses you."
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

function me.TestParseSelfAvoidDodgeGhostlyStrike()
  local testName = "TestParseSelfAvoidDodgeGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "$player$'s Ghostly Strike was dodged."
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

function me.TestParseSelfAvoidParryGhostlyStrike()
  local testName = "TestParseSelfAvoidParryGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "$player$'s Ghostly Strike was parried."
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

function me.TestParseSelfAvoidImmuneGhostlyStrike()
  local testName = "TestParseSelfAvoidImmuneGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "$player$'s Ghostly Strike failed. You are immune."
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

function me.TestParseSelfAvoidMissGhostlyStrike()
  local testName = "TestParseSelfAvoidMissGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "$player$'s Ghostly Strike misses you."
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

function me.TestParseSelfAvoidBlockGhostlyStrike()
  local testName = "TestParseSelfAvoidBlockGhostlyStrike"
  local spellName = "ghostly_strike"
  local combatMessage = "$player$'s Ghostly Strike was blocked."
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

function me.TestParseSelfAvoidImmuneSap()
  local testName = "TestParseSelfAvoidImmuneSap"
  local spellName = "sap"
  local combatMessage = "$player$'s Sap failed. You are immune."
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

function me.TestParseSelfAvoidImmunePremeditation()
  local testName = "TestParseSelfAvoidImmunePremeditation"
  local spellName = "premeditation"
  local combatMessage = "$player$'s Premeditation failed. You are immune."
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

function me.TestParseSelfAvoidImmuneDistract()
  local testName = "TestParseSelfAvoidImmuneDistract"
  local spellName = "distract"
  local combatMessage = "$player$'s Distract failed. You are immune."
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

function me.TestParseSelfAvoidResistDistract()
  local testName = "TestParseSelfAvoidResistDistract"
  local spellName = "distract"
  local combatMessage = "$player$'s Distract was resisted."
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

function me.TestParseSelfAvoidDodgeExposeArmor()
  local testName = "TestParseSelfAvoidDodgeExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "$player$'s Expose Armor was dodged."
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

function me.TestParseSelfAvoidParryExposeArmor()
  local testName = "TestParseSelfAvoidParryExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "$player$'s Expose Armor was parried."
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

function me.TestParseSelfAvoidImmuneExposeArmor()
  local testName = "TestParseSelfAvoidImmuneExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "$player$'s Expose Armor failed. You are immune."
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

function me.TestParseSelfAvoidMissExposeArmor()
  local testName = "TestParseSelfAvoidMissExposeArmor"
  local spellName = "expose_armor"
  local combatMessage = "$player$'s Expose Armor misses you."
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

function me.TestParseSelfAvoidImmuneGarrote()
  local testName = "TestParseSelfAvoidImmuneGarrote"
  local spellName = "garrote"
  local combatMessage = "$player$'s Garrote failed. You are immune."
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

function me.TestParseSelfAvoidDodgeRupture()
  local testName = "TestParseSelfAvoidDodgeRupture"
  local spellName = "rupture"
  local combatMessage = "$player$'s Rupture was dodged."
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

function me.TestParseSelfAvoidParryRupture()
  local testName = "TestParseSelfAvoidParryRupture"
  local spellName = "rupture"
  local combatMessage = "$player$'s Rupture was parried."
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

function me.TestParseSelfAvoidImmuneRupture()
  local testName = "TestParseSelfAvoidImmuneRupture"
  local spellName = "rupture"
  local combatMessage = "$player$'s Rupture failed. You are immune."
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

function me.TestParseSelfAvoidMissRupture()
  local testName = "TestParseSelfAvoidMissRupture"
  local spellName = "rupture"
  local combatMessage = "$player$'s Rupture misses you."
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
