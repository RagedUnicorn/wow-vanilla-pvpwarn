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
mod.testRacialsEn = me

me.tag = "TestRacialsEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[11]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_RACIALS_EN__Test()
  mod.testReporter.StartTestRun("global_racials_en_all")
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

function _G.__PVPW__TEST_RACIALS_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_racials_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_racials_en_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_racials_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_racials_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_racials_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_racials_en_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_racials_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_racials_en_racials_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_racials_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPerception)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPerception)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWillOfTheForsaken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWillOfTheForsaken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneform)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownStoneform)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEscapeArtist)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWarStomp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserking)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserking)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowmeld)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowmeld)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidWarStomp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWarStomp)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParsePerception)
  mod.testReporter.AddToTestQueue(me.TestParseDownPerception)
  mod.testReporter.AddToTestQueue(me.TestParseWillOfTheForsaken)
  mod.testReporter.AddToTestQueue(me.TestParseDownWillOfTheForsaken)
  mod.testReporter.AddToTestQueue(me.TestParseStoneform)
  mod.testReporter.AddToTestQueue(me.TestParseDownStoneform)
  mod.testReporter.AddToTestQueue(me.TestParseEscapeArtist)
  mod.testReporter.AddToTestQueue(me.TestParseWarStomp)
  mod.testReporter.AddToTestQueue(me.TestParseBerserking)
  mod.testReporter.AddToTestQueue(me.TestParseDownBerserking)
  mod.testReporter.AddToTestQueue(me.TestParseShadowmeld)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowmeld)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneWarStomp)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistWarStomp)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneWarStomp)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistWarStomp)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundPerception()
  mod.testHelper.TestSound(
    className,
    "TestSoundPerception",
    "perception"
  )
end

function me.TestSoundDownPerception()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownPerception",
    "perception"
  )
end

function me.TestSoundWillOfTheForsaken()
  mod.testHelper.TestSound(
    className,
    "TestSoundWillOfTheForsaken",
    "will_of_the_forsaken"
  )
end

function me.TestSoundDownWillOfTheForsaken()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWillOfTheForsaken",
    "will_of_the_forsaken"
  )
end

function me.TestSoundStoneform()
  mod.testHelper.TestSound(
    className,
    "TestSoundStoneform",
    "stoneform"
  )
end

function me.TestSoundDownStoneform()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownStoneform",
    "stoneform"
  )
end

function me.TestSoundEscapeArtist()
  mod.testHelper.TestSound(
    className,
    "TestSoundEscapeArtist",
    "escape_artist"
  )
end

function me.TestSoundWarStomp()
  mod.testHelper.TestSound(
    className,
    "TestSoundWarStomp",
    "war_stomp"
  )
end

function me.TestSoundBerserking()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserking",
    "berserking"
  )
end

function me.TestSoundDownBerserking()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserking",
    "berserking"
  )
end

function me.TestSoundShadowmeld()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowmeld",
    "shadowmeld"
  )
end

function me.TestSoundDownShadowmeld()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShadowmeld",
    "shadowmeld"
  )
end

function me.TestSoundEnemyAvoidWarStomp()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidWarStomp",
    "war_stomp"
  )
end

function me.TestSoundSelfAvoidWarStomp()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidWarStomp",
    "war_stomp"
  )
end

function me.TestParsePerception()
  mod.testHelper.TestParse(
    className,
    "TestParsePerception",
    "perception",
    "$player$ gains Perception.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownPerception()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownPerception",
    "perception",
    "Perception fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseWillOfTheForsaken()
  mod.testHelper.TestParse(
    className,
    "TestParseWillOfTheForsaken",
    "will_of_the_forsaken",
    "$player$ gains Will of the Forsaken.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownWillOfTheForsaken()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownWillOfTheForsaken",
    "will_of_the_forsaken",
    "Will of the Forsaken fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseStoneform()
  mod.testHelper.TestParse(
    className,
    "TestParseStoneform",
    "stoneform",
    "$player$ gains Stoneform.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownStoneform()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownStoneform",
    "stoneform",
    "Stoneform fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEscapeArtist()
  mod.testHelper.TestParse(
    className,
    "TestParseEscapeArtist",
    "escape_artist",
    "$player$ begins to perform Escape Artist.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseWarStomp()
  mod.testHelper.TestParse(
    className,
    "TestParseWarStomp",
    "war_stomp",
    "$player$ begins to perform War Stomp.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseBerserking()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserking",
    "berserking",
    "$player$ gains Berserking.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBerserking()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBerserking",
    "berserking",
    "Berserking fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

--[[
  Info: Only fading of shadowmeld can be detected. Spells that are in the spellMap
  need a present test. This test does essentialy the same as the ParseDown test
  to meet this requirement.
]]--
function me.TestParseShadowmeld()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowmeld",
    "shadowmeld",
    "Shadowmeld fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDownShadowmeld()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShadowmeld",
    "shadowmeld",
    "Shadowmeld fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidImmuneWarStomp()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneWarStomp",
    "war_stomp",
    "Your War Stomp failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistWarStomp()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistWarStomp",
    "war_stomp",
    "Your War Stomp was resisted by $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneWarStomp()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneWarStomp",
    "war_stomp",
    "$player$'s War Stomp failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistWarStomp()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistWarStomp",
    "war_stomp",
    "$player$'s War Stomp was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
