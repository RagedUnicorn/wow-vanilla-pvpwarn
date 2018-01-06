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
mod.testPaladin = me

me.tag = "TestPaladin"

-- global
local _G = getfenv(0)
local className = "paladin"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PALADIN__Test()
  mod.testReporter.StartTestRun("global_paladin_all")
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

function _G.__PVPW__TEST_PALADIN__Test_Sound()
  mod.testReporter.StartTestRun("global_paladin_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_paladin_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_paladin_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_paladin_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Parse()
  mod.testReporter.StartTestRun("global_paladin_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_paladin_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_paladin_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_paladin_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_paladin_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDevotionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRetributionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcentrationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownConcentrationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRepentance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLayOnHands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineFavor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineFavor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHammerOfJustice)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseDevotionAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownDevotionAura)
  mod.testReporter.AddToTestQueue(me.TestParseRetributionAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownRetributionAura)
  mod.testReporter.AddToTestQueue(me.TestParseConcentrationAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownConcentrationAura)
  mod.testReporter.AddToTestQueue(me.TestParseShadowResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseFrostResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseFireResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownFireResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfFreedom)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfFreedom)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfSacrifice)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfSacrifice)
  mod.testReporter.AddToTestQueue(me.TestParseHammerOfJustice)
  mod.testReporter.AddToTestQueue(me.TestParseRepentance)
  mod.testReporter.AddToTestQueue(me.TestParseLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseCritLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseDownLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseDivineShield)
  mod.testReporter.AddToTestQueue(me.TestParseDownDivineShield)
  mod.testReporter.AddToTestQueue(me.TestParseDivineFavor)
  mod.testReporter.AddToTestQueue(me.TestParseDownDivineFavor)
  mod.testReporter.AddToTestQueue(me.TestParseForbearance)
  mod.testReporter.AddToTestQueue(me.TestParseDownForbearance)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHammerOfJustice)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneHammerOfJustice)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundDevotionAura()
  local testName = "TestSoundDevotionAura"
  local spellName = "devotion_aura"
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

function me.TestSoundDownDevotionAura()
  local testName = "TestSoundDownDevotionAura"
  local spellName = "devotion_aura"
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

function me.TestSoundRetributionAura()
  local testName = "TestSoundRetributionAura"
  local spellName = "retribution_aura"
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

function me.TestSoundDownRetributionAura()
  local testName = "TestSoundDownRetributionAura"
  local spellName = "retribution_aura"
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

function me.TestSoundConcentrationAura()
  local testName = "TestSoundConcentrationAura"
  local spellName = "concentration_aura"
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

function me.TestSoundDownConcentrationAura()
  local testName = "TestSoundDownConcentrationAura"
  local spellName = "concentration_aura"
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

function me.TestSoundShadowResistanceAura()
  local testName = "TestSoundShadowResistanceAura"
  local spellName = "shadow_resistance_aura"
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

function me.TestSoundDownShadowResistanceAura()
  local testName = "TestSoundDownShadowResistanceAura"
  local spellName = "shadow_resistance_aura"
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

function me.TestSoundFrostResistanceAura()
  local testName = "TestSoundFrostResistanceAura"
  local spellName = "frost_resistance_aura"
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

function me.TestSoundDownFrostResistanceAura()
  local testName = "TestSoundDownFrostResistanceAura"
  local spellName = "frost_resistance_aura"
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

function me.TestSoundFireResistanceAura()
  local testName = "TestSoundFireResistanceAura"
  local spellName = "fire_resistance_aura"
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

function me.TestSoundDownFireResistanceAura()
  local testName = "TestSoundDownFireResistanceAura"
  local spellName = "fire_resistance_aura"
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

function me.TestSoundHammerOfWrath()
  local testName = "TestSoundHammerOfWrath"
  local spellName = "hammer_of_wrath"
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

function me.TestSoundBlessingOfProtection()
  local testName = "TestSoundBlessingOfProtection"
  local spellName = "blessing_of_protection"
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

function me.TestSoundDownBlessingOfProtection()
  local testName = "TestSoundDownBlessingOfProtection"
  local spellName = "blessing_of_protection"
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

function me.TestSoundBlessingOfFreedom()
  local testName = "TestSoundBlessingOfFreedom"
  local spellName = "blessing_of_freedom"
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

function me.TestSoundDownBlessingOfFreedom()
  local testName = "TestSoundDownBlessingOfFreedom"
  local spellName = "blessing_of_freedom"
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

function me.TestSoundBlessingOfSacrifice()
  local testName = "TestSoundBlessingOfSacrifice"
  local spellName = "blessing_of_sacrifice"
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

function me.TestSoundDownBlessingOfSacrifice()
  local testName = "TestSoundDownBlessingOfSacrifice"
  local spellName = "blessing_of_sacrifice"
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

function me.TestSoundHammerOfJustice()
  local testName = "TestSoundHammerOfJustice"
  local spellName = "hammer_of_justice"
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

function me.TestSoundRepentance()
  local testName = "TestSoundRepentance"
  local spellName = "repentance"
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

function me.TestSoundLayOnHands()
  local testName = "TestSoundLayOnHands"
  local spellName = "lay_on_hands"
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

function me.TestSoundDownLayOnHands()
  local testName = "TestSoundDownLayOnHands"
  local spellName = "lay_on_hands"
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

function me.TestSoundDivineShield()
  local testName = "TestSoundDivineShield"
  local spellName = "divine_shield"
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

function me.TestSoundDownDivineShield()
  local testName = "TestSoundDownDivineShield"
  local spellName = "divine_shield"
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

function me.TestSoundDivineFavor()
  local testName = "TestSoundDivineFavor"
  local spellName = "divine_favor"
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

function me.TestSoundDownDivineFavor()
  local testName = "TestSoundDownDivineFavor"
  local spellName = "divine_favor"
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

function me.TestSoundForbearance()
  local testName = "TestSoundForbearance"
  local spellName = "forbearance"
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

function me.TestSoundDownForbearance()
  local testName = "TestSoundDownForbearance"
  local spellName = "forbearance"
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

function me.TestSoundEnemyAvoidHammerOfWrath()
  local testName = "TestSoundEnemyAvoidHammerOfWrath"
  local spellName = "hammer_of_wrath"
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

function me.TestSoundEnemyAvoidHammerOfJustice()
  local testName = "TestSoundEnemyAvoidHammerOfJustice"
  local spellName = "hammer_of_justice"
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

function me.TestSoundSelfAvoidHammerOfWrath()
  local testName = "TestSoundSelfAvoidHammerOfWrath"
  local spellName = "hammer_of_wrath"
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

function me.TestSoundSelfAvoidHammerOfJustice()
  local testName = "TestSoundSelfAvoidHammerOfJustice"
  local spellName = "hammer_of_justice"
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

function me.TestParseDevotionAura()
  local testName = "TestParseDevotionAura"
  local spellName = "devotion_aura"
  local combatMessage = "$player$ gains Devotion Aura."
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

function me.TestParseDownDevotionAura()
  local testName = "TestParseDownDevotionAura"
  local spellName = "devotion_aura"
  local combatMessage = "Devotion Aura fades from $player$."
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

function me.TestParseRetributionAura()
  local testName = "TestParseRetributionAura"
  local spellName = "retribution_aura"
  local combatMessage = "$player$ gains Retribution Aura."
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

function me.TestParseDownRetributionAura()
  local testName = "TestParseDownRetributionAura"
  local spellName = "retribution_aura"
  local combatMessage = "Retribution Aura fades from $player$."
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

function me.TestParseConcentrationAura()
  local testName = "TestParseConcentrationAura"
  local spellName = "concentration_aura"
  local combatMessage = "$player$ gains Concentration Aura."
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

function me.TestParseDownConcentrationAura()
  local testName = "TestParseDownConcentrationAura"
  local spellName = "concentration_aura"
  local combatMessage = "Concentration Aura fades from $player$."
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

function me.TestParseShadowResistanceAura()
  local testName = "TestParseShadowResistanceAura"
  local spellName = "shadow_resistance_aura"
  local combatMessage = "$player$ gains Shadow Resistance Aura."
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

function me.TestParseDownShadowResistanceAura()
  local testName = "TestParseDownShadowResistanceAura"
  local spellName = "shadow_resistance_aura"
  local combatMessage = "Shadow Resistance Aura fades from $player$."
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

function me.TestParseFrostResistanceAura()
  local testName = "TestParseFrostResistanceAura"
  local spellName = "frost_resistance_aura"
  local combatMessage = "$player$ gains Frost Resistance Aura."
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

function me.TestParseDownFrostResistanceAura()
  local testName = "TestParseDownFrostResistanceAura"
  local spellName = "frost_resistance_aura"
  local combatMessage = "Frost Resistance Aura fades from $player$."
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

function me.TestParseFireResistanceAura()
  local testName = "TestParseFireResistanceAura"
  local spellName = "fire_resistance_aura"
  local combatMessage = "$player$ gains Fire Resistance Aura."
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

function me.TestParseDownFireResistanceAura()
  local testName = "TestParseDownFireResistanceAura"
  local spellName = "fire_resistance_aura"
  local combatMessage = "Fire Resistance Aura fades from $player$."
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

function me.TestParseHammerOfWrath()
  local testName = "TestParseHammerOfWrath"
  local spellName = "hammer_of_wrath"
  local combatMessage = "$player$ begins to cast Hammer of Wrath."
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

function me.TestParseBlessingOfProtection()
  local testName = "TestParseBlessingOfProtection"
  local spellName = "blessing_of_protection"
  local combatMessage = "$player$ gains Blessing of Protection."
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

function me.TestParseDownBlessingOfProtection()
  local testName = "TestParseDownBlessingOfProtection"
  local spellName = "blessing_of_protection"
  local combatMessage = "Blessing of Protection fades from $player$."
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

function me.TestParseBlessingOfFreedom()
  local testName = "TestParseBlessingOfFreedom"
  local spellName = "blessing_of_freedom"
  local combatMessage = "$player$ gains Blessing of Freedom."
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

function me.TestParseDownBlessingOfFreedom()
  local testName = "TestParseDownBlessingOfFreedom"
  local spellName = "blessing_of_freedom"
  local combatMessage = "Blessing of Freedom fades from $player$."
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

function me.TestParseBlessingOfSacrifice()
  local testName = "TestParseBlessingOfSacrifice"
  local spellName = "blessing_of_sacrifice"
  local combatMessage = "$player$ gains Blessing of Sacrifice."
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

function me.TestParseDownBlessingOfSacrifice()
  local testName = "TestParseDownBlessingOfSacrifice"
  local spellName = "blessing_of_sacrifice"
  local combatMessage = "Blessing of Sacrifice fades from $player$."
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

function me.TestParseHammerOfJustice()
  local testName = "TestParseHammerOfJustice"
  local spellName = "hammer_of_justice"
  local combatMessage = "You are afflicted by Hammer of Justice."
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

function me.TestParseRepentance()
  local testName = "TestParseRepentance"
  local spellName = "repentance"
  local combatMessage = "You are afflicted by Repentance."
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

function me.TestParseLayOnHands()
  local testName = "TestParseLayOnHands"
  local spellName = "lay_on_hands"
  local combatMessage = "$player$'s Lay ond Hands heals $player$ for $amount$."
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

function me.TestParseCritLayOnHands()
  local testName = "TestParseCritLayOnHands"
  local spellName = "lay_on_hands"
  local combatMessage = "$player$'s Lay ond Hands critically heals $player$ for $amount$."
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

function me.TestParseDownLayOnHands()
  local testName = "TestParseDownLayOnHands"
  local spellName = "lay_on_hands"
  local combatMessage = "Lay on Hands fades from $player$."
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

function me.TestParseDivineShield()
  local testName = "TestParseDivineShield"
  local spellName = "divine_shield"
  local combatMessage = "$player$ gains Divine Shield."
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

function me.TestParseDownDivineShield()
  local testName = "TestParseDownDivineShield"
  local spellName = "divine_shield"
  local combatMessage = "Divine Shield fades from $player$."
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

function me.TestParseDivineFavor()
  local testName = "TestParseDivineFavor"
  local spellName = "divine_favor"
  local combatMessage = "$player$ gains Divine Favor."
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

function me.TestParseDownDivineFavor()
  local testName = "TestParseDownDivineFavor"
  local spellName = "divine_favor"
  local combatMessage = "Divine Favor fades from $player$."
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

function me.TestParseForbearance()
  local testName = "TestParseForbearance"
  local spellName = "forbearance"
  local combatMessage = "$player$ is afflicted by Forbearance."
  local testType = mod.testHelper.testType.parse
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellPeriodicSpellHostilePlayerDamage)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseDownForbearance()
  local testName = "TestParseDownForbearance"
  local spellName = "forbearance"
  local combatMessage = "Forbearance fades from $player$."
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

function me.TestParseEnemyAvoidImmuneHammerOfWrath()
  local testName = "TestParseEnemyAvoidImmuneHammerOfWrath"
  local spellName = "hammer_of_wrath"
  local combatMessage = "Your Hammer of Wrath failed. $player$ is immune."
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

function me.TestParseEnemyAvoidMissHammerOfWrath()
  local testName = "TestParseEnemyAvoidMissHammerOfWrath"
  local spellName = "hammer_of_wrath"
  local combatMessage = "Your Hammer of Wrath missed $player$."
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

function me.TestParseEnemyAvoidImmuneHammerOfJustice()
  local testName = "TestParseEnemyAvoidImmuneHammerOfJustice"
  local spellName = "hammer_of_justice"
  local combatMessage = "Your Hammer of Justice failed. $player$ is immune."
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

function me.TestParseSelfAvoidImmuneHammerOfWrath()
  local testName = "TestParseSelfAvoidImmuneHammerOfWrath"
  local spellName = "hammer_of_wrath"
  local combatMessage = "$player$'s Hammer of Wrath failed. You are immune."
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

function me.TestParseSelfAvoidMissHammerOfWrath()
  local testName = "TestParseSelfAvoidMissHammerOfWrath"
  local spellName = "hammer_of_wrath"
  local combatMessage = "$player$'s Hammer of Wrath misses you."
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

function me.TestParseSelfAvoidImmuneHammerOfJustice()
  local testName = "TestParseSelfAvoidImmuneHammerOfJustice"
  local spellName = "hammer_of_justice"
  local combatMessage = "$player$'s Hammer of Justice failed. You are immune."
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
