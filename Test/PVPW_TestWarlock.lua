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
mod.testWarlock = me

me.tag = "TestWarlock"

-- global
local _G = getfenv(0)
local className = "warlock"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARLOCK__Test()
  mod.testReporter.StartTestRun("global_warlock_all")
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

function _G.__PVPW__TEST_WARLOCK__Test_Sound()
  mod.testReporter.StartTestRun("global_warlock_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warlock_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warlock_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_warlock_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Parse()
  mod.testReporter.StartTestRun("global_warlock_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warlock_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warlock_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warlock_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_warlock_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFelDomination)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFelDomination)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHowlOfTerror)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMajorSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMajorSpellstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAmplifyCurse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAmplifyCurse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMinorHealthstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLesserHealthstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterHealthstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMajorHealthstone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCurseOfExhaustion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCurseOfTongues)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSoulstoneResurrection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSoulstoneResurrection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellLock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSoulLink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSoulLink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeduction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCurseOfTongues)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHowlOfTerror)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowburn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCurseOfTongues)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHowlOfTerror)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidShadowburn)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseFear)
  mod.testReporter.AddToTestQueue(me.TestParseFelDomination)
  mod.testReporter.AddToTestQueue(me.TestParseDownFelDomination)
  mod.testReporter.AddToTestQueue(me.TestParseShadowburn)
  mod.testReporter.AddToTestQueue(me.TestParseShadowWard)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowWard)
  mod.testReporter.AddToTestQueue(me.TestParseHowlOfTerror)
  mod.testReporter.AddToTestQueue(me.TestParseSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseDownSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseGreaterSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseDownGreaterSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseMajorSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseDownMajorSpellstone)
  mod.testReporter.AddToTestQueue(me.TestParseDeathCoil)
  mod.testReporter.AddToTestQueue(me.TestParseAmplifyCurse)
  mod.testReporter.AddToTestQueue(me.TestParseDownAmplifyCurse)
  mod.testReporter.AddToTestQueue(me.TestParseMinorHealthstone)
  mod.testReporter.AddToTestQueue(me.TestParseLesserHealthstone)
  mod.testReporter.AddToTestQueue(me.TestParseGreaterHealthstone)
  mod.testReporter.AddToTestQueue(me.TestParseMajorHealthstone)
  mod.testReporter.AddToTestQueue(me.TestParseCurseOfExhaustion)
  mod.testReporter.AddToTestQueue(me.TestParseCurseOfTongues)
  mod.testReporter.AddToTestQueue(me.TestParseSoulstoneResurrection)
  mod.testReporter.AddToTestQueue(me.TestParseDownSoulstoneResurrection)
  mod.testReporter.AddToTestQueue(me.TestParseSpellLock)
  mod.testReporter.AddToTestQueue(me.TestParseSoulLink)
  mod.testReporter.AddToTestQueue(me.TestParseDownSoulLink)
  mod.testReporter.AddToTestQueue(me.TestParseSeduction)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneCurseOfTongues)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistCurseOfTongues)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneDeathCoil)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistDeathCoil)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFear)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFear)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHowlOfTerror)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistHowlOfTerror)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneShadowburn)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistShadowburn)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneCurseOfTongues)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistCurseOfTongues)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneDeathCoil)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistDeathCoil)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFear)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFear)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneHowlOfTerror)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistHowlOfTerror)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneShadowburn)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistShadowburn)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundFear()
  local testName = "TestSoundFear"
  local spellName = "fear"
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

function me.TestSoundFelDomination()
  local testName = "TestSoundFelDomination"
  local spellName = "fel_domination"
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

function me.TestSoundDownFelDomination()
  local testName = "TestSoundDownFelDomination"
  local spellName = "fel_domination"
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

function me.TestSoundShadowburn()
  local testName = "TestSoundShadowburn"
  local spellName = "shadowburn"
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

function me.TestSoundShadowWard()
  local testName = "TestSoundShadowWard"
  local spellName = "shadow_ward"
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

function me.TestSoundDownShadowWard()
  local testName = "TestSoundDownShadowWard"
  local spellName = "shadow_ward"
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

function me.TestSoundHowlOfTerror()
  local testName = "TestSoundHowlOfTerror"
  local spellName = "howl_of_terror"
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

function me.TestSoundSpellstone()
  local testName = "TestSoundSpellstone"
  local spellName = "spellstone"
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

function me.TestSoundDownSpellstone()
  local testName = "TestSoundDownSpellstone"
  local spellName = "spellstone"
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

function me.TestSoundGreaterSpellstone()
  local testName = "TestSoundGreaterSpellstone"
  local spellName = "greater_spellstone"
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

function me.TestSoundDownGreaterSpellstone()
  local testName = "TestSoundDownGreaterSpellstone"
  local spellName = "greater_spellstone"
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

function me.TestSoundMajorSpellstone()
  local testName = "TestSoundMajorSpellstone"
  local spellName = "major_spellstone"
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

function me.TestSoundDownMajorSpellstone()
  local testName = "TestSoundDownMajorSpellstone"
  local spellName = "major_spellstone"
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

function me.TestSoundDeathCoil()
  local testName = "TestSoundDeathCoil"
  local spellName = "death_coil"
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

function me.TestSoundAmplifyCurse()
  local testName = "TestSoundAmplifyCurse"
  local spellName = "amplify_curse"
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

function me.TestSoundDownAmplifyCurse()
  local testName = "TestSoundDownAmplifyCurse"
  local spellName = "amplify_curse"
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

function me.TestSoundMinorHealthstone()
  local testName = "TestSoundMinorHealthstone"
  local spellName = "minor_healthstone"
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

function me.TestSoundLesserHealthstone()
  local testName = "TestSoundLesserHealthstone"
  local spellName = "lesser_healthstone"
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

function me.TestSoundGreaterHealthstone()
  local testName = "TestSoundGreaterHealthstone"
  local spellName = "greater_healthstone"
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

function me.TestSoundMajorHealthstone()
  local testName = "TestSoundMajorHealthstone"
  local spellName = "major_healthstone"
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

function me.TestSoundCurseOfExhaustion()
  local testName = "TestSoundCurseOfExhaustion"
  local spellName = "curse_of_exhaustion"
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

function me.TestSoundCurseOfTongues()
  local testName = "TestSoundCurseOfTongues"
  local spellName = "curse_of_tongues"
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

function me.TestSoundSoulstoneResurrection()
  local testName = "TestSoundSoulstoneResurrection"
  local spellName = "soulstone_resurrection"
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

function me.TestSoundDownSoulstoneResurrection()
  local testName = "TestSoundDownSoulstoneResurrection"
  local spellName = "soulstone_resurrection"
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

function me.TestSoundSpellLock()
  local testName = "TestSoundSpellLock"
  local spellName = "spell_lock"
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

function me.TestSoundSoulLink()
  local testName = "TestSoundSoulLink"
  local spellName = "soul_link"
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

function me.TestSoundDownSoulLink()
  local testName = "TestSoundDownSoulLink"
  local spellName = "soul_link"
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

function me.TestSoundSeduction()
  local testName = "TestSoundSeduction"
  local spellName = "seduction"
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

function me.TestSoundEnemyAvoidCurseOfTongues()
  local testName = "TestSoundEnemyAvoidCurseOfTongues"
  local spellName = "curse_of_tongues"
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

function me.TestSoundEnemyAvoidDeathCoil()
  local testName = "TestSoundEnemyAvoidDeathCoil"
  local spellName = "death_coil"
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

function me.TestSoundEnemyAvoidFear()
  local testName = "TestSoundEnemyAvoidFear"
  local spellName = "fear"
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

function me.TestSoundEnemyAvoidHowlOfTerror()
  local testName = "TestSoundEnemyAvoidHowlOfTerror"
  local spellName = "howl_of_terror"
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

function me.TestSoundEnemyAvoidShadowburn()
  local testName = "TestSoundEnemyAvoidShadowburn"
  local spellName = "shadowburn"
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

function me.TestSoundSelfAvoidCurseOfTongues()
  local testName = "TestSoundSelfAvoidCurseOfTongues"
  local spellName = "curse_of_tongues"
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

function me.TestSoundSelfAvoidDeathCoil()
  local testName = "TestSoundSelfAvoidDeathCoil"
  local spellName = "death_coil"
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

function me.TestSoundSelfAvoidFear()
  local testName = "TestSoundSelfAvoidFear"
  local spellName = "fear"
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

function me.TestSoundSelfAvoidHowlOfTerror()
  local testName = "TestSoundSelfAvoidHowlOfTerror"
  local spellName = "howl_of_terror"
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

function me.TestSoundSelfAvoidShadowburn()
  local testName = "TestSoundSelfAvoidShadowburn"
  local spellName = "shadowburn"
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

function me.TestSoundSelfAvoidSpellLock()
  local testName = "TestSoundSelfAvoidSpellLock"
  local spellName = "spell_lock"
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

function me.TestSoundSelfAvoidSeduction()
  local testName = "TestSoundSelfAvoidSeduction"
  local spellName = "seduction"
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

function me.TestParseFear()
  local testName = "TestParseFear"
  local spellName = "fear"
  local combatMessage = "You are afflicted by Fear."
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

function me.TestParseFelDomination()
  local testName = "TestParseFelDomination"
  local spellName = "fel_domination"
  local combatMessage = "$player$ gains Fel Domination."
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

function me.TestParseDownFelDomination()
  local testName = "TestParseDownFelDomination"
  local spellName = "fel_domination"
  local combatMessage = "Fel Domination fades from $player$."
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

function me.TestParseShadowburn()
  local testName = "TestParseShadowburn"
  local spellName = "shadowburn"
  local combatMessage = "You are afflicted by Shadowburn."
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

function me.TestParseShadowWard()
  local testName = "TestParseShadowWard"
  local spellName = "shadow_ward"
  local combatMessage = "$player$ gains Shadow Ward."
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

function me.TestParseDownShadowWard()
  local testName = "TestParseDownShadowWard"
  local spellName = "shadow_ward"
  local combatMessage = "Shadow Ward fades from $player$."
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

function me.TestParseHowlOfTerror()
  local testName = "TestParseHowlOfTerror"
  local spellName = "howl_of_terror"
  local combatMessage = "You are afflicted by Howl of Terror."
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

function me.TestParseSpellstone()
  local testName = "TestParseSpellstone"
  local spellName = "spellstone"
  local combatMessage = "$player$ gains Spellstone."
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

function me.TestParseDownSpellstone()
  local testName = "TestParseDownSpellstone"
  local spellName = "spellstone"
  local combatMessage = "Spellstone fades from $player$."
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

function me.TestParseGreaterSpellstone()
  local testName = "TestParseGreaterSpellstone"
  local spellName = "greater_spellstone"
  local combatMessage = "$player$ gains Greater Spellstone."
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

function me.TestParseDownGreaterSpellstone()
  local testName = "TestParseDownGreaterSpellstone"
  local spellName = "greater_spellstone"
  local combatMessage = "Greater Spellstone fades from $player$."
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

function me.TestParseMajorSpellstone()
  local testName = "TestParseMajorSpellstone"
  local spellName = "major_spellstone"
  local combatMessage = "$player$ gains Major Spellstone."
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

function me.TestParseDownMajorSpellstone()
  local testName = "TestParseDownMajorSpellstone"
  local spellName = "major_spellstone"
  local combatMessage = "Major Spellstone fades from $player$."
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

function me.TestParseDeathCoil()
  local testName = "TestParseDeathCoil"
  local spellName = "death_coil"
  local combatMessage = "You are afflicted by Death Coil."
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

function me.TestParseAmplifyCurse()
  local testName = "TestParseAmplifyCurse"
  local spellName = "amplify_curse"
  local combatMessage = "$player$ gains Amplify Curse."
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

function me.TestParseDownAmplifyCurse()
  local testName = "TestParseDownAmplifyCurse"
  local spellName = "amplify_curse"
  local combatMessage = "Amplify Curse fades from $player$."
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

function me.TestParseMinorHealthstone()
  local testName = "TestParseMinorHealthstone"
  local spellName = "minor_healthstone"
  local combatMessage = "$player$'s Minor Healthstone heals $player$ for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerBuff)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseLesserHealthstone()
  local testName = "TestParseLesserHealthstone"
  local spellName = "lesser_healthstone"
  local combatMessage = "$player$'s Lesser Healthstone heals $player$ for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerBuff)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseGreaterHealthstone()
  local testName = "TestParseGreaterHealthstone"
  local spellName = "greater_healthstone"
  local combatMessage = "$player$'s Greater Healthstone heals $player$ for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerBuff)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseMajorHealthstone()
  local testName = "TestParseMajorHealthstone"
  local spellName = "major_healthstone"
  local combatMessage = "$player$'s Major Healthstone heals $player$ for $amount$."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellHostilePlayerBuff)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseCurseOfExhaustion()
  local testName = "TestParseCurseOfExhaustion"
  local spellName = "curse_of_exhaustion"
  local combatMessage = "You are afflicted by Curse of Exhaustion."
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

function me.TestParseCurseOfTongues()
  local testName = "TestParseCurseOfTongues"
  local spellName = "curse_of_tongues"
  local combatMessage = "You are afflicted by Curse of Tongues."
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

function me.TestParseSoulstoneResurrection()
  local testName = "TestParseSoulstoneResurrection"
  local spellName = "soulstone_resurrection"
  local combatMessage = "$player$ gains Soulstone Resurrection."
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

function me.TestParseDownSoulstoneResurrection()
  local testName = "TestParseDownSoulstoneResurrection"
  local spellName = "soulstone_resurrection"
  local combatMessage = "Soulstone Resurrection fades from $player$."
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

function me.TestParseSpellLock()
  local testName = "TestParseSpellLock"
  local spellName = "spell_lock"
  local combatMessage = "You are afflicted by Spell Lock."
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

function me.TestParseSoulLink()
  local testName = "TestParseSoulLink"
  local spellName = "soul_link"
  local combatMessage = "$player$ gains Soul Link."
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

function me.TestParseDownSoulLink()
  local testName = "TestParseDownSoulLink"
  local spellName = "soul_link"
  local combatMessage = "Soul Link fades from $player$."
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

function me.TestParseSeduction()
  local testName = "TestParseSeduction"
  local spellName = "seduction"
  local combatMessage = "You are afflicted by Seduction."
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

function me.TestParseEnemyAvoidImmuneCurseOfTongues()
  local testName = "TestParseEnemyAvoidImmuneCurseOfTongues"
  local spellName = "curse_of_tongues"
  local combatMessage = "Your Curse of Tongues failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistCurseOfTongues()
  local testName = "TestParseEnemyAvoidResistCurseOfTongues"
  local spellName = "curse_of_tongues"
  local combatMessage = "Your Curse of Tongues was resisted by $player$."
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

function me.TestParseEnemyAvoidImmuneDeathCoil()
  local testName = "TestParseEnemyAvoidImmuneDeathCoil"
  local spellName = "death_coil"
  local combatMessage = "Your Death Coil failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistDeathCoil()
  local testName = "TestParseEnemyAvoidResistDeathCoil"
  local spellName = "death_coil"
  local combatMessage = "Your Death Coil was resisted by $player$."
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

function me.TestParseEnemyAvoidImmuneFear()
  local testName = "TestParseEnemyAvoidImmuneFear"
  local spellName = "fear"
  local combatMessage = "Your Fear failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistFear()
  local testName = "TestParseEnemyAvoidResistFear"
  local spellName = "fear"
  local combatMessage = "Your Fear was resisted by $player$."
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

function me.TestParseEnemyAvoidImmuneHowlOfTerror()
  local testName = "TestParseEnemyAvoidImmuneHowlOfTerror"
  local spellName = "howl_of_terror"
  local combatMessage = "Your Howl of Terror failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistHowlOfTerror()
  local testName = "TestParseEnemyAvoidResistHowlOfTerror"
  local spellName = "howl_of_terror"
  local combatMessage = "Your Howl of Terror was resisted by $player$."
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

function me.TestParseEnemyAvoidImmuneShadowburn()
  local testName = "TestParseEnemyAvoidImmuneShadowburn"
  local spellName = "shadowburn"
  local combatMessage = "Your Shadowburn failed. $player$ is immune."
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

function me.TestParseEnemyAvoidResistShadowburn()
  local testName = "TestParseEnemyAvoidResistShadowburn"
  local spellName = "shadowburn"
  local combatMessage = "Your Shadowburn was resisted by $player$."
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

function me.TestParseSelfAvoidImmuneCurseOfTongues()
  local testName = "TestParseSelfAvoidImmuneCurseOfTongues"
  local spellName = "curse_of_tongues"
  local combatMessage = "$player$'s Curse of Tongues failed. You are immune."
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

function me.TestParseSelfAvoidResistCurseOfTongues()
  local testName = "TestParseSelfAvoidResistCurseOfTongues"
  local spellName = "curse_of_tongues"
  local combatMessage = "$player$'s Curse of Tongues was resisted."
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

function me.TestParseSelfAvoidImmuneDeathCoil()
  local testName = "TestParseSelfAvoidImmuneDeathCoil"
  local spellName = "death_coil"
  local combatMessage = "$player$'s Death Coil failed. You are immune."
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

function me.TestParseSelfAvoidResistDeathCoil()
  local testName = "TestParseSelfAvoidResistDeathCoil"
  local spellName = "death_coil"
  local combatMessage = "$player$'s Death Coil was resisted."
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

function me.TestParseSelfAvoidImmuneFear()
  local testName = "TestParseSelfAvoidImmuneFear"
  local spellName = "fear"
  local combatMessage = "$player$'s Fear failed. You are immune."
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

function me.TestParseSelfAvoidResistFear()
  local testName = "TestParseSelfAvoidResistFear"
  local spellName = "fear"
  local combatMessage = "$player$'s Fear was resisted."
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

function me.TestParseSelfAvoidImmuneHowlOfTerror()
  local testName = "TestParseSelfAvoidImmuneHowlOfTerror"
  local spellName = "howl_of_terror"
  local combatMessage = "$player$'s Howl of Terror failed. You are immune."
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

function me.TestParseSelfAvoidResistHowlOfTerror()
  local testName = "TestParseSelfAvoidResistHowlOfTerror"
  local spellName = "howl_of_terror"
  local combatMessage = "$player$'s Howl of Terror was resisted."
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

function me.TestParseSelfAvoidImmuneShadowburn()
  local testName = "TestParseSelfAvoidImmuneShadowburn"
  local spellName = "shadowburn"
  local combatMessage = "$player$'s Shadowburn failed. You are immune."
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

function me.TestParseSelfAvoidResistShadowburn()
  local testName = "TestParseSelfAvoidResistShadowburn"
  local spellName = "shadowburn"
  local combatMessage = "$player$'s Shadowburn was resisted."
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

function me.TestParseSelfAvoidImmuneSpellLock()
  local testName = "TestParseSelfAvoidImmuneSpellLock"
  local spellName = "spell_lock"
  local combatMessage = "$player$'s Spell Lock failed. You are immune."
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

function me.TestParseSelfAvoidResistSpellLock()
  local testName = "TestParseSelfAvoidResistSpellLock"
  local spellName = "spell_lock"
  local combatMessage = "$player$'s Spell Lock was resisted."
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

function me.TestParseSelfAvoidImmuneSeduction()
  local testName = "TestParseSelfAvoidImmuneSeduction"
  local spellName = "seduction"
  local combatMessage = "$player$'s Seduction failed. You are immune."
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

function me.TestParseSelfAvoidResistSeduction()
  local testName = "TestParseSelfAvoidResistSeduction"
  local spellName = "seduction"
  local combatMessage = "$player$'s Seduction was resisted."
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
