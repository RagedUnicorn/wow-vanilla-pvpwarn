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
mod.testMisc = me

me.tag = "TestMisc"

-- global
local _G = getfenv(0)
local className = "misc"

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
  local testName = "TestSoundThistleTea"
  local spellName = "thistle_tea"
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

function me.TestSoundRestoration()
  local testName = "TestSoundRestoration"
  local spellName = "restoration"
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

function me.TestSoundDownRestoration()
  local testName = "TestSoundDownRestoration"
  local spellName = "restoration"
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

function me.TestSoundFirstAid()
  local testName = "TestSoundFirstAid"
  local spellName = "first_aid"
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

function me.TestSoundInvulnerability()
  local testName = "TestSoundInvulnerability"
  local spellName = "invulnerability"
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

function me.TestSoundDownInvulnerability()
  local testName = "TestSoundDownInvulnerability"
  local spellName = "invulnerability"
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

function me.TestSoundFreeAction()
  local testName = "TestSoundFreeAction"
  local spellName = "free_action"
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

function me.TestSoundDownFreeAction()
  local testName = "TestSoundDownFreeAction"
  local spellName = "free_action"
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

function me.TestSoundThoriumGrenade()
  local testName = "TestSoundThoriumGrenade"
  local spellName = "thorium_grenade"
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

function me.TestSoundIronGrenade()
  local testName = "TestSoundIronGrenade"
  local spellName = "iron_grenade"
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

function me.TestSoundShadowProtection()
  local testName = "TestSoundShadowProtection"
  local spellName = "shadow_protection"
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

function me.TestSoundFrostProtection()
  local testName = "TestSoundFrostProtection"
  local spellName = "frost_protection"
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

function me.TestSoundFireProtection()
  local testName = "TestSoundFireProtection"
  local spellName = "fire_protection"
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

function me.TestSoundNatureProtection()
  local testName = "TestSoundNatureProtection"
  local spellName = "nature_protection"
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

function me.TestSoundArcaneProtection()
  local testName = "TestSoundArcaneProtection"
  local spellName = "arcane_protection"
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

function me.TestSoundEnemyAvoidThoriumGrenade()
  local testName = "TestSoundEnemyAvoidThoriumGrenade"
  local spellName = "thorium_grenade"
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

function me.TestSoundEnemyAvoidIronGrenade()
  local testName = "TestSoundEnemyAvoidIronGrenade"
  local spellName = "iron_grenade"
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

function me.TestSoundSelfAvoidThoriumGrenade()
  local testName = "TestSoundSelfAvoidThoriumGrenade"
  local spellName = "thorium_grenade"
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

function me.TestSoundSelfAvoidIronGrenade()
  local testName = "TestSoundSelfAvoidIronGrenade"
  local spellName = "iron_grenade"
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

function me.TestParseThistleTea()
  local testName = "TestParseThistleTea"
  local spellName = "thistle_tea"
  local combatMessage = "$player$ gains $amount$ Energy from $player$'s Restore Energy."
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

function me.TestParseRestoration()
  local testName = "TestParseRestoration"
  local spellName = "restoration"
  local combatMessage = "$player$ gains Restoration."
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

function me.TestParseDownRestoration()
  local testName = "TestParseDownRestoration"
  local spellName = "restoration"
  local combatMessage = "Restoration fades from $player$."
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

function me.TestParseFirstAid()
  local testName = "TestParseFirstAid"
  local spellName = "first_aid"
  local combatMessage = "$player$ gains First Aid."
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

function me.TestParseInvulnerability()
  local testName = "TestParseInvulnerability"
  local spellName = "invulnerability"
  local combatMessage = "$player$ gains Invulnerability."
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

function me.TestParseDownInvulnerability()
  local testName = "TestParseDownInvulnerability"
  local spellName = "invulnerability"
  local combatMessage = "Invulnerability fades from $player$."
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

function me.TestParseFreeAction()
  local testName = "TestParseFreeAction"
  local spellName = "free_action"
  local combatMessage = "$player$ gains Free Action."
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

function me.TestParseDownFreeAction()
  local testName = "TestParseDownFreeAction"
  local spellName = "free_action"
  local combatMessage = "Free Action fades from $player$."
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

function me.TestParseThoriumGrenade()
  local testName = "TestParseThoriumGrenade"
  local spellName = "thorium_grenade"
  local combatMessage = "You are afflicted by Thorium Grenade."
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

function me.TestParseIronGrenade()
  local testName = "TestParseIronGrenade"
  local spellName = "iron_grenade"
  local combatMessage = "You are afflicted by Iron Grenade."
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

function me.TestParseShadowProtection()
  local testName = "TestParseShadowProtection"
  local spellName = "shadow_protection"
  local combatMessage = "$player$ gains Shadow Protection."
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

function me.TestParseDownShadowProtection()
  local testName = "TestParseDownShadowProtection"
  local spellName = "shadow_protection"
  local combatMessage = "Shadow Protection fades from $player$."
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

function me.TestParseFrostProtection()
  local testName = "TestParseFrostProtection"
  local spellName = "frost_protection"
  local combatMessage = "$player$ gains Frost Protection."
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

function me.TestParseDownFrostProtection()
  local testName = "TestParseDownFrostProtection"
  local spellName = "frost_protection"
  local combatMessage = "Frost Protection fades from $player$."
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

function me.TestParseFireProtection()
  local testName = "TestParseFireProtection"
  local spellName = "fire_protection"
  local combatMessage = "$player$ gains Fire Protection."
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

function me.TestParseDownFireProtection()
  local testName = "TestParseDownFireProtection"
  local spellName = "fire_protection"
  local combatMessage = "Fire Protection fades from $player$."
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

function me.TestParseNatureProtection()
  local testName = "TestParseNatureProtection"
  local spellName = "nature_protection"
  local combatMessage = "$player$ gains Nature Protection."
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

function me.TestParseDownNatureProtection()
  local testName = "TestParseDownNatureProtection"
  local spellName = "nature_protection"
  local combatMessage = "Nature Protection fades from $player$."
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

function me.TestParseArcaneProtection()
  local testName = "TestParseArcaneProtection"
  local spellName = "arcane_protection"
  local combatMessage = "$player$ gains Arcane Protection."
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

function me.TestParseDownArcaneProtection()
  local testName = "TestParseDownArcaneProtection"
  local spellName = "arcane_protection"
  local combatMessage = "Arcane Protection fades from $player$."
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

function me.TestParseEnemyAvoidResistThoriumGrenade()
  local testName = "TestParseEnemyAvoidResistThoriumGrenade"
  local spellName = "thorium_grenade"
  local combatMessage = "Your Thorium Grenade was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed enemy avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse enemy avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneThoriumGrenade()
  local testName = "TestParseEnemyAvoidImmuneThoriumGrenade"
  local spellName = "thorium_grenade"
  local combatMessage = "Your Thorium Grenade failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed enemy avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse enemy avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidResistIronGrenade()
  local testName = "TestParseEnemyAvoidResistIronGrenade"
  local spellName = "iron_grenade"
  local combatMessage = "Your Iron Grenade was resisted by $player$."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed enemy avoid resist combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse enemy avoid resist combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseEnemyAvoidImmuneIronGrenade()
  local testName = "TestParseEnemyAvoidImmuneIronGrenade"
  local spellName = "iron_grenade"
  local combatMessage = "Your Iron Grenade failed. $player$ is immune."
  local testType = mod.testHelper.testType.parseAvoid
  local status

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = mod.parser.ParseCombatText(combatMessage, mod.testHelper.eventTypeSpellDamageShieldsOnSelf)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed enemy avoid immune combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse enemy avoid immune combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

function me.TestParseSelfAvoidResistThoriumGrenade()
  local testName = "TestParseSelfAvoidResistThoriumGrenade"
  local spellName = "thorium_grenade"
  local combatMessage = "$player$'s Thorium Grenade was resisted."
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

function me.TestParseSelfAvoidImmuneThoriumGrenade()
  local testName = "TestParseSelfAvoidImmuneThoriumGrenade"
  local spellName = "thorium_grenade"
  local combatMessage = "$player$'s Thorium Grenade failed. You are immune."
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

function me.TestParseSelfAvoidResistIronGrenade()
  local testName = "TestParseSelfAvoidResistIronGrenade"
  local spellName = "iron_grenade"
  local combatMessage = "$player$'s Iron Grenade was resisted."
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

function me.TestParseSelfAvoidImmuneIronGrenade()
  local testName = "TestParseSelfAvoidImmuneIronGrenade"
  local spellName = "iron_grenade"
  local combatMessage = "$player$'s Iron Grenade failed. You are immune."
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
