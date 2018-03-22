--[[
  MIT License

  Copyright (c) 2018 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

--[[
  To run the tests make sure to include this file into PVPWarn.toc.

  start test by calling from the game with /run [functionName]
]]--
local mod = pvpw
local me = {}
mod.testRogueEn = me

me.tag = "TestRogueEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[3]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ROGUE_EN__Test()
  mod.testReporter.StartTestRun("global_rogue_en_all")
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

--[[
  tests if a sound testcase can be found for each registered spell in PVPW_SpellMap
]]--
function _G.__PVPW__TEST_ROGUE_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_rogue_en_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_rogue_en_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_rogue_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_rogue_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_rogue_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_rogue_en_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_rogue_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_rogue_en_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_rogue_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKickSilenced)
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownColdBlood)
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
  mod.testReporter.AddToTestQueue(me.TestParseKickSilenced)
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
  mod.testReporter.AddToTestQueue(me.TestParseColdBlood)
  mod.testReporter.AddToTestQueue(me.TestParseDownColdBlood)
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
  mod.testHelper.TestSound(
    className,
    "TestSoundBlind",
    "blind"
  )
end

function me.TestSoundKick()
  mod.testHelper.TestSound(
    className,
    "TestSoundKick",
    "kick"
  )
end

function me.TestSoundKickSilenced()
  mod.testHelper.TestSound(
    className,
    "TestSoundKickSilenced",
    "kick_silenced"
  )
end

function me.TestSoundSprint()
  mod.testHelper.TestSound(
    className,
    "TestSoundSprint",
    "sprint"
  )
end

function me.TestSoundDownSprint()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSprint",
    "sprint"
  )
end

function me.TestSoundEvasion()
  mod.testHelper.TestSound(
    className,
    "TestSoundEvasion",
    "evasion"
  )
end

function me.TestSoundDownEvasion()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEvasion",
    "evasion"
  )
end

function me.TestSoundKidneyShot()
  mod.testHelper.TestSound(
    className,
    "TestSoundKidneyShot",
    "kidney_shot"
  )
end

function me.TestSoundCheapShot()
  mod.testHelper.TestSound(
    className,
    "TestSoundCheapShot",
    "cheap_shot"
  )
end

function me.TestSoundAdrenalineRush()
  mod.testHelper.TestSound(
    className,
    "TestSoundAdrenalineRush",
    "adrenaline_rush"
  )
end

function me.TestSoundDownAdrenalineRush()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAdrenalineRush",
    "adrenaline_rush"
  )
end

function me.TestSoundBladeFlurry()
  mod.testHelper.TestSound(
    className,
    "TestSoundBladeFlurry",
    "blade_flurry"
  )
end

function me.TestSoundDownBladeFlurry()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBladeFlurry",
    "blade_flurry"
  )
end

function me.TestSoundColdBlood()
  mod.testHelper.TestSound(
    className,
    "TestSoundColdBlood",
    "cold_blood"
  )
end

function me.TestSoundDownColdBlood()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownColdBlood",
    "cold_blood"
  )
end

function me.TestSoundEnemyAvoidKick()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKick",
    "kick"
  )
end

function me.TestSoundEnemyAvoidCheapShot()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidCheapShot",
    "cheap_shot"
  )
end

function me.TestSoundEnemyAvoidGouge()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGouge",
    "gouge"
  )
end

function me.TestSoundEnemyAvoidRiposte()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidRiposte",
    "riposte"
  )
end

function me.TestSoundEnemyAvoidKidneyShot()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKidneyShot",
    "kidney_shot"
  )
end

function me.TestSoundEnemyAvoidBlind()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlind",
    "blind"
  )
end

function me.TestSoundEnemyAvoidGhostlyStrike()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGhostlyStrike",
    "ghostly_strike"
  )
end

function me.TestSoundEnemyAvoidSap()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSap",
    "sap"
  )
end

function me.TestSoundEnemyAvoidPremeditation()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPremeditation",
    "premeditation"
  )
end

function me.TestSoundEnemyAvoidDistract()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidDistract",
    "distract"
  )
end

function me.TestSoundEnemyAvoidExposeArmor()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidExposeArmor",
    "expose_armor"
  )
end

function me.TestSoundEnemyAvoidGarrote()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGarrote",
    "garrote"
  )
end

function me.TestSoundEnemyAvoidRupture()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidRupture",
    "rupture"
  )
end

function me.TestSoundSelfAvoidKick()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKick",
    "kick"
  )
end

function me.TestSoundSelfAvoidCheapShot()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidCheapShot",
    "cheap_shot"
  )
end

function me.TestSoundSelfAvoidGouge()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGouge",
    "gouge"
  )
end

function me.TestSoundSelfAvoidRiposte()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidRiposte",
    "riposte"
  )
end

function me.TestSoundSelfAvoidKidneyShot()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKidneyShot",
    "kidney_shot"
  )
end

function me.TestSoundSelfAvoidBlind()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlind",
    "blind"
  )
end

function me.TestSoundSelfAvoidGhostlyStrike()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGhostlyStrike",
    "ghostly_strike"
  )
end

function me.TestSoundSelfAvoidSap()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSap",
    "sap"
  )
end

function me.TestSoundSelfAvoidPremeditation()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPremeditation",
    "premeditation"
  )
end

function me.TestSoundSelfAvoidDistract()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidDistract",
    "distract"
  )
end

function me.TestSoundSelfAvoidExposeArmor()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidExposeArmor",
    "expose_armor"
  )
end

function me.TestSoundSelfAvoidGarrote()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGarrote",
    "garrote"
  )
end

function me.TestSoundSelfAvoidRupture()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidRupture",
    "rupture"
  )
end

function me.TestParseBlind()
  mod.testHelper.TestParse(
    className,
    "TestParseBlind",
    "blind",
    "You are afflicted by Blind.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseKick()
  mod.testHelper.TestParse(
    className,
    "TestParseKick",
    "kick",
    "$player$'s Kick hits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritKick()
  mod.testHelper.TestParse(
    className,
    "TestParseCritKick",
    "kick",
    "$player$'s Kick crits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseKickSilenced()
  mod.testHelper.TestParse(
    className,
    "TestParseKickSilenced",
    "kick_silenced",
    "You are afflicted by Kick - Silenced.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSprint()
  mod.testHelper.TestParse(
    className,
    "TestParseSprint",
    "sprint",
    "$player$ gains Sprint.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSprint()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSprint",
    "sprint",
    "Sprint fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEvasion()
  mod.testHelper.TestParse(
    className,
    "TestParseEvasion",
    "evasion",
    "$player$ gains Evasion.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEvasion()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEvasion",
    "evasion",
    "Evasion fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKidneyShot()
  mod.testHelper.TestParse(
    className,
    "TestParseKidneyShot",
    "kidney_shot",
    "You are afflicted by Kidney Shot.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseCheapShot()
  mod.testHelper.TestParse(
    className,
    "TestParseCheapShot",
    "cheap_shot",
    "You are afflicted by Cheap Shot.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAdrenalineRush()
  mod.testHelper.TestParse(
    className,
    "TestParseAdrenalineRush",
    "adrenaline_rush",
    "$player$ gains Adrenaline Rush.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAdrenalineRush()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAdrenalineRush",
    "adrenaline_rush",
    "Adrenaline Rush fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBladeFlurry()
  mod.testHelper.TestParse(
    className,
    "TestParseBladeFlurry",
    "blade_flurry",
    "$player$ gains Blade Flurry.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBladeFlurry()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBladeFlurry",
    "blade_flurry",
    "Blade Flurry fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseColdBlood()
  mod.testHelper.TestParse(
    className,
    "TestParseColdBlood",
    "cold_blood",
    "$player$ gains Cold Blood.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownColdBlood()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownColdBlood",
    "cold_blood",
    "Cold Blood fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidDodgeKick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeKick",
    "kick",
    "Your Kick was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryKick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryKick",
    "kick",
    "Your Kick is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneKick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKick",
    "kick",
    "Your Kick failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissKick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissKick",
    "kick",
    "Your Kick missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockKick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockKick",
    "kick",
    "Your Kick was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneCheapShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneCheapShot",
    "cheap_shot",
    "Your Cheap Shot failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissCheapShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissCheapShot",
    "cheap_shot",
    "Your Cheap Shot missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistCheapShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistCheapShot",
    "cheap_shot",
    "Your Cheap Shot was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeGouge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeGouge",
    "gouge",
    "Your Gouge was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryGouge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryGouge",
    "gouge",
    "Your Gouge is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneGouge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGouge",
    "gouge",
    "Your Gouge failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissGouge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissGouge",
    "gouge",
    "Your Gouge missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockGouge()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockGouge",
    "gouge",
    "Your Gouge was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeRiposte",
    "riposte",
    "Your Riposte was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryRiposte",
    "riposte",
    "Your Riposte is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneRiposte",
    "riposte",
    "Your Riposte failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissRiposte",
    "riposte",
    "Your Riposte missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockRiposte",
    "riposte",
    "Your Riposte was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeKidneyShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeKidneyShot",
    "kidney_shot",
    "Your Kidney Shot was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryKidneyShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryKidneyShot",
    "kidney_shot",
    "Your Kidney Shot is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneKidneyShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKidneyShot",
    "kidney_shot",
    "Your Kidney Shot failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissKidneyShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissKidneyShot",
    "kidney_shot",
    "Your Kidney Shot missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistKidneyShot()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistKidneyShot",
    "kidney_shot",
    "Your Kidney Shot was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneBlind()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlind",
    "blind",
    "Your Blind failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBlind()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBlind",
    "blind",
    "Your Blind missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeGhostlyStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeGhostlyStrike",
    "ghostly_strike",
    "Your Ghostly Strike was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryGhostlyStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryGhostlyStrike",
    "ghostly_strike",
    "Your Ghostly Strike is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneGhostlyStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGhostlyStrike",
    "ghostly_strike",
    "Your Ghostly Strike failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissGhostlyStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissGhostlyStrike",
    "ghostly_strike",
    "Your Ghostly Strike missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockGhostlyStrike()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockGhostlyStrike",
    "ghostly_strike",
    "Your Ghostly Strike was blocked by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneSap()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSap",
    "sap",
    "Your Sap failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmunePremeditation()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePremeditation",
    "premeditation",
    "Your Premeditation failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneDistract()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneDistract",
    "distract",
    "Your Distract failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistDistract()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistDistract",
    "distract",
    "Your Distract was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeExposeArmor()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeExposeArmor",
    "expose_armor",
    "Your Expose Armor was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryExposeArmor()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryExposeArmor",
    "expose_armor",
    "Your Expose Armor is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneExposeArmor()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneExposeArmor",
    "expose_armor",
    "Your Expose Armor failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissExposeArmor()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissExposeArmor",
    "expose_armor",
    "Your Expose Armor missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneGarrote()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGarrote",
    "garrote",
    "Your Garrote failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidDodgeRupture()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeRupture",
    "rupture",
    "Your Rupture was dodged by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryRupture()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryRupture",
    "rupture",
    "Your Rupture is parried by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneRupture()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneRupture",
    "rupture",
    "Your Rupture failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissRupture()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissRupture",
    "rupture",
    "Your Rupture missed $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeKick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeKick",
    "kick",
    "$player$'s Kick was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryKick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryKick",
    "kick",
    "$player$'s Kick was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneKick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKick",
    "kick",
    "$player$'s Kick failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissKick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissKick",
    "kick",
    "$player$'s Kick misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockKick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockKick",
    "kick",
    "$player$'s Kick was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneCheapShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneCheapShot",
    "cheap_shot",
    "$player$'s Cheap Shot failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissCheapShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissCheapShot",
    "cheap_shot",
    "$player$'s Cheap Shot misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistCheapShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistCheapShot",
    "cheap_shot",
    "$player$'s Cheap Shot was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeGouge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeGouge",
    "gouge",
    "$player$'s Gouge was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryGouge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryGouge",
    "gouge",
    "$player$'s Gouge was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneGouge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGouge",
    "gouge",
    "$player$'s Gouge failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissGouge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissGouge",
    "gouge",
    "$player$'s Gouge misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockGouge()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockGouge",
    "gouge",
    "$player$'s Gouge was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeRiposte",
    "riposte",
    "$player$'s Riposte was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryRiposte",
    "riposte",
    "$player$'s Riposte was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneRiposte",
    "riposte",
    "$player$'s Riposte failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissRiposte",
    "riposte",
    "$player$'s Riposte misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockRiposte",
    "riposte",
    "$player$'s Riposte was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeKidneyShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeKidneyShot",
    "kidney_shot",
    "$player$'s Kidney Shot was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryKidneyShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryKidneyShot",
    "kidney_shot",
    "$player$'s Kidney Shot was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneKidneyShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKidneyShot",
    "kidney_shot",
    "$player$'s Kidney Shot failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissKidneyShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissKidneyShot",
    "kidney_shot",
    "$player$'s Kidney Shot misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistKidneyShot()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistKidneyShot",
    "kidney_shot",
    "$player$'s Kidney Shot was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneBlind()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlind",
    "blind",
    "$player$'s Blind failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBlind()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBlind",
    "blind",
    "$player$'s Blind misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeGhostlyStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeGhostlyStrike",
    "ghostly_strike",
    "$player$'s Ghostly Strike was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryGhostlyStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryGhostlyStrike",
    "ghostly_strike",
    "$player$'s Ghostly Strike was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneGhostlyStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGhostlyStrike",
    "ghostly_strike",
    "$player$'s Ghostly Strike failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissGhostlyStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissGhostlyStrike",
    "ghostly_strike",
    "$player$'s Ghostly Strike misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockGhostlyStrike()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockGhostlyStrike",
    "ghostly_strike",
    "$player$'s Ghostly Strike was blocked.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneSap()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSap",
    "sap",
    "$player$'s Sap failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmunePremeditation()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePremeditation",
    "premeditation",
    "$player$'s Premeditation failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneDistract()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneDistract",
    "distract",
    "$player$'s Distract failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistDistract()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistDistract",
    "distract",
    "$player$'s Distract was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeExposeArmor()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeExposeArmor",
    "expose_armor",
    "$player$'s Expose Armor was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryExposeArmor()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryExposeArmor",
    "expose_armor",
    "$player$'s Expose Armor was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneExposeArmor()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneExposeArmor",
    "expose_armor",
    "$player$'s Expose Armor failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissExposeArmor()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissExposeArmor",
    "expose_armor",
    "$player$'s Expose Armor misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneGarrote()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGarrote",
    "garrote",
    "$player$'s Garrote failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidDodgeRupture()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeRupture",
    "rupture",
    "$player$'s Rupture was dodged.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryRupture()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryRupture",
    "rupture",
    "$player$'s Rupture was parried.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneRupture()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneRupture",
    "rupture",
    "$player$'s Rupture failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissRupture()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissRupture",
    "rupture",
    "$player$'s Rupture misses you.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end
