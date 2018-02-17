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
mod.testHunterEn = me

me.tag = "TestHunterEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[9]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_HUNTER_EN__Test()
  mod.testReporter.StartTestRun("global_hunter_en_all")
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

function _G.__PVPW__TEST_HUNTER_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_hunter_en_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_hunter_en_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_hunter_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_hunter_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_hunter_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_hunter_en_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_hunter_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_hunter_en_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_HUNTER_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_hunter_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImprovedConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheMonkey)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeterrence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeterrence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWyvernSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlare)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundScareBeast)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBestialWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBestialWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidAimedShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSerpentSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidViperSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFreezingTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidWingClip)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidAimedShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidViperSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFreezingTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWingClip)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseImprovedConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseAspectOfTheMonkey)
  mod.testReporter.AddToTestQueue(me.TestParseAspectOfTheHawk)
  mod.testReporter.AddToTestQueue(me.TestParseRapidFire)
  mod.testReporter.AddToTestQueue(me.TestParseDownRapidFire)
  mod.testReporter.AddToTestQueue(me.TestParseDeterrence)
  mod.testReporter.AddToTestQueue(me.TestParseDownDeterrence)
  mod.testReporter.AddToTestQueue(me.TestParseExplosiveTrap)
  mod.testReporter.AddToTestQueue(me.TestParseFreezingTrap)
  mod.testReporter.AddToTestQueue(me.TestParseImmolationTrap)
  mod.testReporter.AddToTestQueue(me.TestParseFrostTrap)
  mod.testReporter.AddToTestQueue(me.TestParseWyvernSting)
  mod.testReporter.AddToTestQueue(me.TestParseViperSting)
  mod.testReporter.AddToTestQueue(me.TestParseScatterShot)
  mod.testReporter.AddToTestQueue(me.TestParseFlare)
  mod.testReporter.AddToTestQueue(me.TestParseScareBeast)
  mod.testReporter.AddToTestQueue(me.TestParseIntimidation)
  mod.testReporter.AddToTestQueue(me.TestParseDownIntimidation)
  mod.testReporter.AddToTestQueue(me.TestParseBestialWrath)
  mod.testReporter.AddToTestQueue(me.TestParseDownBestialWrath)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneAimedShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissAimedShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneScatterShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissScatterShot)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSerpentSting)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissSerpentSting)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneViperSting)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissViperSting)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFreezingTrap)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneAimedShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissAimedShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistConcussiveShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneScatterShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissScatterShot)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSerpentSting)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissSerpentSting)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneViperSting)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissViperSting)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFreezingTrap)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockWingClip)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistWingClip)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundConcussiveShot()
  mod.testHelper.TestSound(
    className,
    "TestSoundConcussiveShot",
    "concussive_shot"
  )
end

function me.TestSoundImprovedConcussiveShot()
  mod.testHelper.TestSound(
    className,
    "TestSoundImprovedConcussiveShot",
    "improved_concussive_shot"
  )
end

function me.TestSoundAspectOfTheMonkey()
  mod.testHelper.TestSound(
    className,
    "TestSoundAspectOfTheMonkey",
    "aspect_of_the_monkey"
  )
end

function me.TestSoundAspectOfTheHawk()
  mod.testHelper.TestSound(
    className,
    "TestSoundAspectOfTheHawk",
    "aspect_of_the_hawk"
  )
end

function me.TestSoundRapidFire()
  mod.testHelper.TestSound(
    className,
    "TestSoundRapidFire",
    "rapid_fire"
  )
end

function me.TestSoundDownRapidFire()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRapidFire",
    "rapid_fire"
  )
end

function me.TestSoundDeterrence()
  mod.testHelper.TestSound(
    className,
    "TestSoundDeterrence",
    "deterrence"
  )
end

function me.TestSoundDownDeterrence()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownDeterrence",
    "deterrence"
  )
end

function me.TestSoundExplosiveTrap()
  mod.testHelper.TestSound(
    className,
    "TestSoundExplosiveTrap",
    "explosive_trap"
  )
end

function me.TestSoundFreezingTrap()
  mod.testHelper.TestSound(
    className,
    "TestSoundFreezingTrap",
    "freezing_trap"
  )
end

function me.TestSoundImmolationTrap()
  mod.testHelper.TestSound(
    className,
    "TestSoundImmolationTrap",
    "immolation_trap"
  )
end

function me.TestSoundFrostTrap()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostTrap",
    "frost_trap"
  )
end

function me.TestSoundWyvernSting()
  mod.testHelper.TestSound(
    className,
    "TestSoundWyvernSting",
    "wyvern_sting"
  )
end

function me.TestSoundViperSting()
  mod.testHelper.TestSound(
    className,
    "TestSoundViperSting",
    "viper_sting"
  )
end

function me.TestSoundScatterShot()
  mod.testHelper.TestSound(
    className,
    "TestSoundScatterShot",
    "scatter_shot"
  )
end

function me.TestSoundFlare()
  mod.testHelper.TestSound(
    className,
    "TestSoundFlare",
    "flare"
  )
end

function me.TestSoundScareBeast()
  mod.testHelper.TestSound(
    className,
    "TestSoundScareBeast",
    "scare_beast"
  )
end

function me.TestSoundIntimidation()
  mod.testHelper.TestSound(
    className,
    "TestSoundIntimidation",
    "intimidation"
  )
end

function me.TestSoundDownIntimidation()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownIntimidation",
    "intimidation"
  )
end

function me.TestSoundBestialWrath()
  mod.testHelper.TestSound(
    className,
    "TestSoundBestialWrath",
    "bestial_wrath"
  )
end

function me.TestSoundDownBestialWrath()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBestialWrath",
    "bestial_wrath"
  )
end

function me.TestSoundEnemyAvoidAimedShot()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidAimedShot",
    "aimed_shot"
  )
end

function me.TestSoundEnemyAvoidConcussiveShot()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidConcussiveShot",
    "concussive_shot"
  )
end

function me.TestSoundEnemyAvoidScatterShot()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidScatterShot",
    "scatter_shot"
  )
end

function me.TestSoundEnemyAvoidSerpentSting()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSerpentSting",
    "serpent_sting"
  )
end

function me.TestSoundEnemyAvoidViperSting()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidViperSting",
    "viper_sting"
  )
end

function me.TestSoundEnemyAvoidFreezingTrap()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFreezingTrap",
    "freezing_trap"
  )
end

function me.TestSoundEnemyAvoidWingClip()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidWingClip",
    "wing_clip"
  )
end

function me.TestSoundSelfAvoidAimedShot()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidAimedShot",
    "aimed_shot"
  )
end

function me.TestSoundSelfAvoidConcussiveShot()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidConcussiveShot",
    "concussive_shot"
  )
end

function me.TestSoundSelfAvoidScatterShot()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidScatterShot",
    "scatter_shot"
  )
end

function me.TestSoundSelfAvoidSerpentSting()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSerpentSting",
    "serpent_sting"
  )
end

function me.TestSoundSelfAvoidViperSting()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidViperSting",
    "viper_sting"
  )
end

function me.TestSoundSelfAvoidFreezingTrap()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFreezingTrap",
    "freezing_trap"
  )
end

function me.TestSoundSelfAvoidWingClip()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidWingClip",
    "wing_clip"
  )
end

function me.TestParseConcussiveShot()
  mod.testHelper.TestParse(
    className,
    "TestParseConcussiveShot",
    "concussive_shot",
    "You are afflicted by Concussive Shot.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseImprovedConcussiveShot()
  mod.testHelper.TestParse(
    className,
    "TestParseImprovedConcussiveShot",
    "improved_concussive_shot",
    "You are afflicted by Improved Concussive Shot.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAspectOfTheMonkey()
  mod.testHelper.TestParse(
    className,
    "TestParseAspectOfTheMonkey",
    "aspect_of_the_monkey",
    "$player$ gains Aspect of the Monkey.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseAspectOfTheHawk()
  mod.testHelper.TestParse(
    className,
    "TestParseAspectOfTheHawk",
    "aspect_of_the_hawk",
    "$player$ gains Aspect of the Hawk.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseRapidFire()
  mod.testHelper.TestParse(
    className,
    "TestParseRapidFire",
    "rapid_fire",
    "$player$ gains Rapid Fire.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRapidFire()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRapidFire",
    "rapid_fire",
    "Rapid Fire fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDeterrence()
  mod.testHelper.TestParse(
    className,
    "TestParseDeterrence",
    "deterrence",
    "$player$ gains Deterrence.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownDeterrence()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownDeterrence",
    "deterrence",
    "Deterrence fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseExplosiveTrap()
  mod.testHelper.TestParse(
    className,
    "TestParseExplosiveTrap",
    "explosive_trap",
    "$player$ casts Explosive Trap.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFreezingTrap()
  mod.testHelper.TestParse(
    className,
    "TestParseFreezingTrap",
    "freezing_trap",
    "$player$ casts Freezing Trap.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseImmolationTrap()
  mod.testHelper.TestParse(
    className,
    "TestParseImmolationTrap",
    "immolation_trap",
    "$player$ casts Immolation Trap.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFrostTrap()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostTrap",
    "frost_trap",
    "$player$ casts Frost Trap.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseWyvernSting()
  mod.testHelper.TestParse(
    className,
    "TestParseWyvernSting",
    "wyvern_sting",
    "You are afflicted by Wyvern Sting.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseViperSting()
  mod.testHelper.TestParse(
    className,
    "TestParseViperSting",
    "viper_sting",
    "You are afflicted by Viper Sting.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseScatterShot()
  mod.testHelper.TestParse(
    className,
    "TestParseScatterShot",
    "scatter_shot",
    "You are afflicted by Scatter Shot.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFlare()
  mod.testHelper.TestParse(
    className,
    "TestParseFlare",
    "flare",
    "You are afflicted by Flare.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseScareBeast()
  mod.testHelper.TestParse(
    className,
    "TestParseScareBeast",
    "scare_beast",
    "$player$ begins to cast Scare Beast.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseIntimidation()
  mod.testHelper.TestParse(
    className,
    "TestParseIntimidation",
    "intimidation",
    "$player$ gains Intimidation.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownIntimidation()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownIntimidation",
    "intimidation",
    "Intimidation fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBestialWrath()
  mod.testHelper.TestParse(
    className,
    "TestParseBestialWrath",
    "bestial_wrath",
    "$player$ gains Bestial Wrath.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBestialWrath()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBestialWrath",
    "bestial_wrath",
    "Bestial Wrath fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidImmuneAimedShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneAimedShot",
    "aimed_shot",
    "Your Aimed Shot failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissAimedShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissAimedShot",
    "aimed_shot",
    "Your Aimed Shot missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneConcussiveShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneConcussiveShot",
    "concussive_shot",
    "Your Concussive Shot failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissConcussiveShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissConcussiveShot",
    "concussive_shot",
    "Your Concussive Shot missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistConcussiveShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistConcussiveShot",
    "concussive_shot",
    "Your Concussive Shot was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneScatterShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneScatterShot",
    "scatter_shot",
    "Your Scatter Shot failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissScatterShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissScatterShot",
    "scatter_shot",
    "Your Scatter Shot missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneSerpentSting()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSerpentSting",
    "serpent_sting",
    "Your Serpent Sting failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissSerpentSting()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissSerpentSting",
    "serpent_sting",
    "Your Serpent Sting missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneViperSting()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneViperSting",
    "viper_sting",
    "Your Viper Sting failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissViperSting()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissViperSting",
    "viper_sting",
    "Your Viper Sting missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneFreezingTrap()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFreezingTrap",
    "freezing_trap",
    "Your Freezing Trap failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidDodgeWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeWingClip",
    "wing_clip",
    "Your Wing Clip was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryWingClip",
    "wing_clip",
    "Your Wing Clip is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneWingClip",
    "wing_clip",
    "Your Wing Clip failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissWingClip",
    "wing_clip",
    "Your Wing Clip missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockWingClip",
    "wing_clip",
    "Your Wing Clip was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidResistWingClip()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistWingClip",
    "wing_clip",
    "Your Wing Clip was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneAimedShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneAimedShot",
    "aimed_shot",
    "$player$'s Aimed Shot failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissAimedShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissAimedShot",
    "aimed_shot",
    "$player$'s Aimed Shot misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneConcussiveShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneConcussiveShot",
    "concussive_shot",
    "$player$'s Concussive Shot failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissConcussiveShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissConcussiveShot",
    "concussive_shot",
    "$player$'s Concussive Shot misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistConcussiveShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistConcussiveShot",
    "concussive_shot",
    "$player$'s Concussive Shot was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneScatterShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneScatterShot",
    "scatter_shot",
    "$player$'s Scatter Shot failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissScatterShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissScatterShot",
    "scatter_shot",
    "$player$'s Scatter Shot misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneSerpentSting()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSerpentSting",
    "serpent_sting",
    "$player$'s Serpent Sting failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissSerpentSting()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissSerpentSting",
    "serpent_sting",
    "$player$'s Serpent Sting misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneViperSting()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneViperSting",
    "viper_sting",
    "$player$'s Viper Sting failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissViperSting()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissViperSting",
    "viper_sting",
    "$player$'s Viper Sting misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneFreezingTrap()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFreezingTrap",
    "freezing_trap",
    "$player$'s Freezing Trap failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidDodgeWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeWingClip",
    "wing_clip",
    "$player$'s Wing Clip was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryWingClip",
    "wing_clip",
    "$player$'s Wing Clip was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneWingClip",
    "wing_clip",
    "$player$'s Wing Clip failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissWingClip",
    "wing_clip",
    "$player$'s Wing Clip misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockWingClip",
    "wing_clip",
    "$player$'s Wing Clip was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidResistWingClip()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistWingClip",
    "wing_clip",
    "$player$'s Wing Clip was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
