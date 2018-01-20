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
local className = PVPW_CLASSLIST[7]

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
  mod.testHelper.TestSound(
    className,
    "TestSoundFear",
    "fear"
  )
end

function me.TestSoundFelDomination()
  mod.testHelper.TestSound(
    className,
    "TestSoundFelDomination",
    "fel_domination"
  )
end

function me.TestSoundDownFelDomination()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFelDomination",
    "fel_domination"
  )
end

function me.TestSoundShadowburn()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowburn",
    "shadowburn"
  )
end

function me.TestSoundShadowWard()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowWard",
    "shadow_ward"
  )
end

function me.TestSoundDownShadowWard()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShadowWard",
    "shadow_ward"
  )
end

function me.TestSoundHowlOfTerror()
  mod.testHelper.TestSound(
    className,
    "TestSoundHowlOfTerror",
    "howl_of_terror"
  )
end

function me.TestSoundSpellstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundSpellstone",
    "spellstone"
  )
end

function me.TestSoundDownSpellstone()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSpellstone",
    "spellstone"
  )
end

function me.TestSoundGreaterSpellstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundGreaterSpellstone",
    "greater_spellstone"
  )
end

function me.TestSoundDownGreaterSpellstone()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGreaterSpellstone",
    "greater_spellstone"
  )
end

function me.TestSoundMajorSpellstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundMajorSpellstone",
    "major_spellstone"
  )
end

function me.TestSoundDownMajorSpellstone()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownMajorSpellstone",
    "major_spellstone"
  )
end

function me.TestSoundDeathCoil()
  mod.testHelper.TestSound(
    className,
    "TestSoundDeathCoil",
    "death_coil"
  )
end

function me.TestSoundAmplifyCurse()
  mod.testHelper.TestSound(
    className,
    "TestSoundAmplifyCurse",
    "amplify_curse"
  )
end

function me.TestSoundDownAmplifyCurse()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAmplifyCurse",
    "amplify_curse"
  )
end

function me.TestSoundMinorHealthstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundMinorHealthstone",
    "minor_healthstone"
  )
end

function me.TestSoundLesserHealthstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundLesserHealthstone",
    "lesser_healthstone"
  )
end

function me.TestSoundGreaterHealthstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundGreaterHealthstone",
    "greater_healthstone"
  )
end

function me.TestSoundMajorHealthstone()
  mod.testHelper.TestSound(
    className,
    "TestSoundMajorHealthstone",
    "major_healthstone"
  )
end

function me.TestSoundCurseOfExhaustion()
  mod.testHelper.TestSound(
    className,
    "TestSoundCurseOfExhaustion",
    "curse_of_exhaustion"
  )
end

function me.TestSoundCurseOfTongues()
  mod.testHelper.TestSound(
    className,
    "TestSoundCurseOfTongues",
    "curse_of_tongues"
  )
end

function me.TestSoundSoulstoneResurrection()
  mod.testHelper.TestSound(
    className,
    "TestSoundSoulstoneResurrection",
    "soulstone_resurrection"
  )
end

function me.TestSoundDownSoulstoneResurrection()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSoulstoneResurrection",
    "soulstone_resurrection"
  )
end

function me.TestSoundSpellLock()
  mod.testHelper.TestSound(
    className,
    "TestSoundSpellLock",
    "spell_lock"
  )
end

function me.TestSoundSoulLink()
  mod.testHelper.TestSound(
    className,
    "TestSoundSoulLink",
    "soul_link"
  )
end

function me.TestSoundDownSoulLink()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSoulLink",
    "soul_link"
  )
end

function me.TestSoundSeduction()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeduction",
    "seduction"
  )
end

function me.TestSoundEnemyAvoidCurseOfTongues()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidCurseOfTongues",
    "curse_of_tongues"
  )
end

function me.TestSoundEnemyAvoidDeathCoil()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidDeathCoil",
    "death_coil"
  )
end

function me.TestSoundEnemyAvoidFear()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFear",
    "fear"
  )
end

function me.TestSoundEnemyAvoidHowlOfTerror()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidHowlOfTerror",
    "howl_of_terror"
  )
end

function me.TestSoundEnemyAvoidShadowburn()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidShadowburn",
    "shadowburn"
  )
end

function me.TestSoundSelfAvoidCurseOfTongues()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidCurseOfTongues",
    "curse_of_tongues"
  )
end

function me.TestSoundSelfAvoidDeathCoil()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidDeathCoil",
    "death_coil"
  )
end

function me.TestSoundSelfAvoidFear()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFear",
    "fear"
  )
end

function me.TestSoundSelfAvoidHowlOfTerror()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidHowlOfTerror",
    "howl_of_terror"
  )
end

function me.TestSoundSelfAvoidShadowburn()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidShadowburn",
    "shadowburn"
  )
end

function me.TestSoundSelfAvoidSpellLock()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSpellLock",
    "spell_lock"
  )
end

function me.TestSoundSelfAvoidSeduction()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSeduction",
    "seduction"
  )
end

function me.TestParseFear()
  mod.testHelper.TestParse(
    className,
    "TestParseFear",
    "fear",
    "You are afflicted by Fear.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFelDomination()
  mod.testHelper.TestParse(
    className,
    "TestParseFelDomination",
    "fel_domination",
    "$player$ gains Fel Domination.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFelDomination()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFelDomination",
    "fel_domination",
    "Fel Domination fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseShadowburn()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowburn",
    "shadowburn",
    "You are afflicted by Shadowburn.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseShadowWard()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowWard",
    "shadow_ward",
    "$player$ gains Shadow Ward.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShadowWard()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShadowWard",
    "shadow_ward",
    "Shadow Ward fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHowlOfTerror()
  mod.testHelper.TestParse(
    className,
    "TestParseHowlOfTerror",
    "howl_of_terror",
    "You are afflicted by Howl of Terror.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSpellstone()
  mod.testHelper.TestParse(
    className,
    "TestParseSpellstone",
    "spellstone",
    "$player$ gains Spellstone.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSpellstone()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSpellstone",
    "spellstone",
    "Spellstone fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGreaterSpellstone()
  mod.testHelper.TestParse(
    className,
    "TestParseGreaterSpellstone",
    "greater_spellstone",
    "$player$ gains Greater Spellstone.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGreaterSpellstone()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGreaterSpellstone",
    "greater_spellstone",
    "Greater Spellstone fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseMajorSpellstone()
  mod.testHelper.TestParse(
    className,
    "TestParseMajorSpellstone",
    "major_spellstone",
    "$player$ gains Major Spellstone.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownMajorSpellstone()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownMajorSpellstone",
    "major_spellstone",
    "Major Spellstone fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDeathCoil()
  mod.testHelper.TestParse(
    className,
    "TestParseDeathCoil",
    "death_coil",
    "You are afflicted by Death Coil.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAmplifyCurse()
  mod.testHelper.TestParse(
    className,
    "TestParseAmplifyCurse",
    "amplify_curse",
    "$player$ gains Amplify Curse.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAmplifyCurse()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAmplifyCurse",
    "amplify_curse",
    "Amplify Curse fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseMinorHealthstone()
  mod.testHelper.TestParse(
    className,
    "TestParseMinorHealthstone",
    "minor_healthstone",
    "$player$'s Minor Healthstone heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseLesserHealthstone()
  mod.testHelper.TestParse(
    className,
    "TestParseLesserHealthstone",
    "lesser_healthstone",
    "$player$'s Lesser Healthstone heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGreaterHealthstone()
  mod.testHelper.TestParse(
    className,
    "TestParseGreaterHealthstone",
    "greater_healthstone",
    "$player$'s Greater Healthstone heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMajorHealthstone()
  mod.testHelper.TestParse(
    className,
    "TestParseMajorHealthstone",
    "major_healthstone",
    "$player$'s Major Healthstone heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCurseOfExhaustion()
  mod.testHelper.TestParse(
    className,
    "TestParseCurseOfExhaustion",
    "curse_of_exhaustion",
    "You are afflicted by Curse of Exhaustion.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseCurseOfTongues()
  mod.testHelper.TestParse(
    className,
    "TestParseCurseOfTongues",
    "curse_of_tongues",
    "You are afflicted by Curse of Tongues.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSoulstoneResurrection()
  mod.testHelper.TestParse(
    className,
    "TestParseSoulstoneResurrection",
    "soulstone_resurrection",
    "$player$ gains Soulstone Resurrection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSoulstoneResurrection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSoulstoneResurrection",
    "soulstone_resurrection",
    "Soulstone Resurrection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSpellLock()
  mod.testHelper.TestParse(
    className,
    "TestParseSpellLock",
    "spell_lock",
    "You are afflicted by Spell Lock.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSoulLink()
  mod.testHelper.TestParse(
    className,
    "TestParseSoulLink",
    "soul_link",
    "$player$ gains Soul Link.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSoulLink()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSoulLink",
    "soul_link",
    "Soul Link fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSeduction()
  mod.testHelper.TestParse(
    className,
    "TestParseSeduction",
    "seduction",
    "You are afflicted by Seduction.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneCurseOfTongues()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneCurseOfTongues",
    "curse_of_tongues",
    "Your Curse of Tongues failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistCurseOfTongues()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistCurseOfTongues",
    "curse_of_tongues",
    "Your Curse of Tongues was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneDeathCoil()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneDeathCoil",
    "death_coil",
    "Your Death Coil failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistDeathCoil()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistDeathCoil",
    "death_coil",
    "Your Death Coil was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFear()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFear",
    "fear",
    "Your Fear failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFear()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFear",
    "fear",
    "Your Fear was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneHowlOfTerror()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneHowlOfTerror",
    "howl_of_terror",
    "Your Howl of Terror failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistHowlOfTerror()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistHowlOfTerror",
    "howl_of_terror",
    "Your Howl of Terror was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneShadowburn()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneShadowburn",
    "shadowburn",
    "Your Shadowburn failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistShadowburn()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistShadowburn",
    "shadowburn",
    "Your Shadowburn was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneCurseOfTongues()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneCurseOfTongues",
    "curse_of_tongues",
    "$player$'s Curse of Tongues failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistCurseOfTongues()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistCurseOfTongues",
    "curse_of_tongues",
    "$player$'s Curse of Tongues was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneDeathCoil()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneDeathCoil",
    "death_coil",
    "$player$'s Death Coil failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistDeathCoil()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistDeathCoil",
    "death_coil",
    "$player$'s Death Coil was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFear()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFear",
    "fear",
    "$player$'s Fear failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFear()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFear",
    "fear",
    "$player$'s Fear was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneHowlOfTerror()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneHowlOfTerror",
    "howl_of_terror",
    "$player$'s Howl of Terror failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistHowlOfTerror()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistHowlOfTerror",
    "howl_of_terror",
    "$player$'s Howl of Terror was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneShadowburn()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneShadowburn",
    "shadowburn",
    "$player$'s Shadowburn failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistShadowburn()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistShadowburn",
    "shadowburn",
    "$player$'s Shadowburn was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSpellLock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSpellLock",
    "spell_lock",
    "$player$'s Spell Lock failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSpellLock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSpellLock",
    "spell_lock",
    "$player$'s Spell Lock was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSeduction()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSeduction",
    "seduction",
    "$player$'s Seduction failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSeduction()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSeduction",
    "seduction",
    "$player$'s Seduction was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
