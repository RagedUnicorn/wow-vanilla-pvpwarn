--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
mod.testPriestEn = me

me.tag = "TestPriestEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[4]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PRIEST_EN__Test()
  mod.testReporter.StartTestRun("global_priest_en_all")
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

function _G.__PVPW__TEST_PRIEST_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_priest_en_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_priest_en_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_priest_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_priest_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_priest_en_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_priest_en_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_priest_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_priest_en_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_priest_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricEmbrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFearWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFearWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElunesGrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElunesGrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStarshards)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMindControl)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVampiricEmbrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidManaBurn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMindControl)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidShadowWordPain)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVampiricEmbrace)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParsePsychicScream)
  mod.testReporter.AddToTestQueue(me.TestParseSilence)
  mod.testReporter.AddToTestQueue(me.TestParsePowerInfusion)
  mod.testReporter.AddToTestQueue(me.TestParseDownPowerInfusion)
  mod.testReporter.AddToTestQueue(me.TestParseInnerFire)
  mod.testReporter.AddToTestQueue(me.TestParseDownInnerFire)
  mod.testReporter.AddToTestQueue(me.TestParseVampiricEmbrace)
  mod.testReporter.AddToTestQueue(me.TestParseDesperatePrayer)
  mod.testReporter.AddToTestQueue(me.TestParseCritDesperatePrayer)
  mod.testReporter.AddToTestQueue(me.TestParseDevouringPlague)
  mod.testReporter.AddToTestQueue(me.TestParseTouchOfWeakness)
  mod.testReporter.AddToTestQueue(me.TestParseDownTouchOfWeakness)
  mod.testReporter.AddToTestQueue(me.TestParseFearWard)
  mod.testReporter.AddToTestQueue(me.TestParseDownFearWard)
  mod.testReporter.AddToTestQueue(me.TestParseElunesGrace)
  mod.testReporter.AddToTestQueue(me.TestParseDownElunesGrace)
  mod.testReporter.AddToTestQueue(me.TestParseStarshards)
  mod.testReporter.AddToTestQueue(me.TestParseHexOfWeakness)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneDevouringPlague)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistDevouringPlague)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneManaBurn)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistManaBurn)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneMindControl)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistMindControl)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePsychicScream)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPsychicScream)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneShadowWordPain)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistShadowWordPain)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSilence)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistSilence)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVampiricEmbrace)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVampiricEmbrace)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneDevouringPlague)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistDevouringPlague)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneManaBurn)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistManaBurn)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneMindControl)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistMindControl)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePsychicScream)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPsychicScream)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneShadowWordPain)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistShadowWordPain)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSilence)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistSilence)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVampiricEmbrace)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVampiricEmbrace)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundPsychicScream()
  mod.testHelper.TestSound(
    className,
    "TestSoundPsychicScream",
    "psychic_scream"
  )
end

function me.TestSoundSilence()
  mod.testHelper.TestSound(
    className,
    "TestSoundSilence",
    "silence"
  )
end

function me.TestSoundPowerInfusion()
  mod.testHelper.TestSound(
    className,
    "TestSoundPowerInfusion",
    "power_infusion"
  )
end

function me.TestSoundDownPowerInfusion()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownPowerInfusion",
    "power_infusion"
  )
end

function me.TestSoundInnerFire()
  mod.testHelper.TestSound(
    className,
    "TestSoundInnerFire",
    "inner_fire"
  )
end

function me.TestSoundDownInnerFire()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInnerFire",
    "inner_fire"
  )
end

function me.TestSoundVampiricEmbrace()
  mod.testHelper.TestSound(
    className,
    "TestSoundVampiricEmbrace",
    "vampiric_embrace"
  )
end

function me.TestSoundDesperatePrayer()
  mod.testHelper.TestSound(
    className,
    "TestSoundDesperatePrayer",
    "desperate_prayer"
  )
end

function me.TestSoundDevouringPlague()
  mod.testHelper.TestSound(
    className,
    "TestSoundDevouringPlague",
    "devouring_plague"
  )
end

function me.TestSoundTouchOfWeakness()
  mod.testHelper.TestSound(
    className,
    "TestSoundTouchOfWeakness",
    "touch_of_weakness"
  )
end

function me.TestSoundDownTouchOfWeakness()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTouchOfWeakness",
    "touch_of_weakness"
  )
end

function me.TestSoundFearWard()
  mod.testHelper.TestSound(
    className,
    "TestSoundFearWard",
    "fear_ward"
  )
end

function me.TestSoundDownFearWard()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFearWard",
    "fear_ward"
  )
end

function me.TestSoundElunesGrace()
  mod.testHelper.TestSound(
    className,
    "TestSoundElunesGrace",
    "elunes_grace"
  )
end

function me.TestSoundDownElunesGrace()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownElunesGrace",
    "elunes_grace"
  )
end

function me.TestSoundStarshards()
  mod.testHelper.TestSound(
    className,
    "TestSoundStarshards",
    "starshards"
  )
end

function me.TestSoundHexOfWeakness()
  mod.testHelper.TestSound(
    className,
    "TestSoundHexOfWeakness",
    "hex_of_weakness"
  )
end

function me.TestSoundEnemyAvoidDevouringPlague()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidDevouringPlague",
    "devouring_plague"
  )
end

function me.TestSoundEnemyAvoidBlackout()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlackout",
    "blackout"
  )
end

function me.TestSoundEnemyAvoidManaBurn()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidManaBurn",
    "mana_burn"
  )
end

function me.TestSoundEnemyAvoidMindControl()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidMindControl",
    "mind_control"
  )
end

function me.TestSoundEnemyAvoidPsychicScream()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPsychicScream",
    "psychic_scream"
  )
end

function me.TestSoundEnemyAvoidShadowWordPain()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidShadowWordPain",
    "shadow_word_pain"
  )
end

function me.TestSoundEnemyAvoidSilence()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSilence",
    "silence"
  )
end

function me.TestSoundEnemyAvoidVampiricEmbrace()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVampiricEmbrace",
    "vampiric_embrace"
  )
end

function me.TestSoundSelfAvoidDevouringPlague()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidDevouringPlague",
    "devouring_plague"
  )
end

function me.TestSoundSelfAvoidBlackout()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlackout",
    "blackout"
  )
end

function me.TestSoundSelfAvoidManaBurn()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidManaBurn",
    "mana_burn"
  )
end

function me.TestSoundSelfAvoidMindControl()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidMindControl",
    "mind_control"
  )
end

function me.TestSoundSelfAvoidPsychicScream()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPsychicScream",
    "psychic_scream"
  )
end

function me.TestSoundSelfAvoidShadowWordPain()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidShadowWordPain",
    "shadow_word_pain"
  )
end

function me.TestSoundSelfAvoidSilence()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSilence",
    "silence"
  )
end

function me.TestSoundSelfAvoidVampiricEmbrace()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVampiricEmbrace",
    "vampiric_embrace"
  )
end

function me.TestParsePsychicScream()
  mod.testHelper.TestParse(
    className,
    "TestParsePsychicScream",
    "psychic_scream",
    "You are afflicted by Psychic Scream.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSilence()
  mod.testHelper.TestParse(
    className,
    "TestParseSilence",
    "silence",
    "You are afflicted by Silence.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParsePowerInfusion()
  mod.testHelper.TestParse(
    className,
    "TestParsePowerInfusion",
    "power_infusion",
    "$player$ gains Power Infusion.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownPowerInfusion()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownPowerInfusion",
    "power_infusion",
    "Power Infusion fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseInnerFire()
  mod.testHelper.TestParse(
    className,
    "TestParseInnerFire",
    "inner_fire",
    "$player$ gains Inner Fire.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInnerFire()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInnerFire",
    "inner_fire",
    "Inner Fire fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVampiricEmbrace()
  mod.testHelper.TestParse(
    className,
    "TestParseVampiricEmbrace",
    "vampiric_embrace",
    "You are afflicted by Vampiric Embrace.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseDesperatePrayer()
  mod.testHelper.TestParse(
    className,
    "TestParseDesperatePrayer",
    "desperate_prayer",
    "$player$'s Desperate Prayer heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCritDesperatePrayer()
  mod.testHelper.TestParse(
    className,
    "TestParseCritDesperatePrayer",
    "desperate_prayer",
    "$player$'s Desperate Prayer critically heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseDevouringPlague()
  mod.testHelper.TestParse(
    className,
    "TestParseDevouringPlague",
    "devouring_plague",
    "You are afflicted by Devouring Plague.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseTouchOfWeakness()
  mod.testHelper.TestParse(
    className,
    "TestParseTouchOfWeakness",
    "touch_of_weakness",
    "$player$ gains Touch of Weakness.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTouchOfWeakness()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTouchOfWeakness",
    "touch_of_weakness",
    "Touch of Weakness fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFearWard()
  mod.testHelper.TestParse(
    className,
    "TestParseFearWard",
    "fear_ward",
    "$player$ gains Fear Ward.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFearWard()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFearWard",
    "fear_ward",
    "Fear Ward fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseElunesGrace()
  mod.testHelper.TestParse(
    className,
    "TestParseElunesGrace",
    "elunes_grace",
    "$player$ gains Elune's Grace.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownElunesGrace()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownElunesGrace",
    "elunes_grace",
    "Elune's Grace fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseStarshards()
  mod.testHelper.TestParse(
    className,
    "TestParseStarshards",
    "starshards",
    "You are afflicted by Starshards.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseHexOfWeakness()
  mod.testHelper.TestParse(
    className,
    "TestParseHexOfWeakness",
    "hex_of_weakness",
    "You are afflicted by Hex of Weakness.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneDevouringPlague()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneDevouringPlague",
    "devouring_plague",
    "Your Devouring Plague failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistDevouringPlague()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistDevouringPlague",
    "devouring_plague",
    "Your Devouring Plague was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneBlackout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlackout",
    "blackout",
    "Your Blackout failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistBlackout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistBlackout",
    "blackout",
    "Your Blackout was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneManaBurn()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneManaBurn",
    "mana_burn",
    "Your Mana Burn failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistManaBurn()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistManaBurn",
    "mana_burn",
    "Your Mana Burn was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneMindControl()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneMindControl",
    "mind_control",
    "Your Mind Control failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistMindControl()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistMindControl",
    "mind_control",
    "Your Mind Control was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmunePsychicScream()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePsychicScream",
    "psychic_scream",
    "Your Psychic Scream failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPsychicScream()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPsychicScream",
    "psychic_scream",
    "Your Psychic Scream was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneShadowWordPain()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneShadowWordPain",
    "shadow_word_pain",
    "Your Shadow Word: Pain failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistShadowWordPain()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistShadowWordPain",
    "shadow_word_pain",
    "Your Shadow Word: Pain was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneSilence()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSilence",
    "silence",
    "Your Silence failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistSilence()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistSilence",
    "silence",
    "Your Silence was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneVampiricEmbrace()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVampiricEmbrace",
    "vampiric_embrace",
    "Your Vampiric Embrace failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVampiricEmbrace()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVampiricEmbrace",
    "vampiric_embrace",
    "Your Vampiric Embrace was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneDevouringPlague()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneDevouringPlague",
    "devouring_plague",
    "$player$'s Devouring Plague failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistDevouringPlague()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistDevouringPlague",
    "devouring_plague",
    "$player$'s Devouring Plague was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneBlackout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlackout",
    "blackout",
    "$player$'s Blackout failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistBlackout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistBlackout",
    "blackout",
    "$player$'s Blackout was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneManaBurn()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneManaBurn",
    "mana_burn",
    "$player$'s Mana Burn failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistManaBurn()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistManaBurn",
    "mana_burn",
    "$player$'s Mana Burn was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneMindControl()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneMindControl",
    "mind_control",
    "$player$'s Mind Control failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistMindControl()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistMindControl",
    "mind_control",
    "$player$'s Mind Control was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmunePsychicScream()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePsychicScream",
    "psychic_scream",
    "$player$'s Psychic Scream failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPsychicScream()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPsychicScream",
    "psychic_scream",
    "$player$'s Psychic Scream was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneShadowWordPain()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneShadowWordPain",
    "shadow_word_pain",
    "$player$'s Shadow Word: Pain failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistShadowWordPain()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistShadowWordPain",
    "shadow_word_pain",
    "$player$'s Shadow Word: Pain was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSilence()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSilence",
    "silence",
    "$player$'s Silence failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSilence()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSilence",
    "silence",
    "$player$'s Silence was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVampiricEmbrace()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVampiricEmbrace",
    "vampiric_embrace",
    "$player$'s Vampiric Embrace failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVampiricEmbrace()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVampiricEmbrace",
    "vampiric_embrace",
    "$player$'s Vampiric Embrace was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
