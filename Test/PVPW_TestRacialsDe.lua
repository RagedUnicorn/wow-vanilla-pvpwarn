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
mod.testRacialsDe = me

me.tag = "TestRacialsDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[11]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_RACIALS_DE__Test()
  mod.testReporter.StartTestRun("global_racials_de_all")
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

function _G.__PVPW__TEST_RACIALS_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_racials_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_racials_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_racials_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_racials_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_racials_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_racials_de_racials_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_RACIALS_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_racials_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWachsamkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWachsamkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWilleDerVerlassenen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWilleDerVerlassenen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSteingestalt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSteingestalt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntfesselungskuenstler)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKriegsdonner)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserker)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserker)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenhaftigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenhaftigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKriegsdonner)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKriegsdonner)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseWachsamkeit)
  mod.testReporter.AddToTestQueue(me.TestParseDownWachsamkeit)
  mod.testReporter.AddToTestQueue(me.TestParseWilleDerVerlassenen)
  mod.testReporter.AddToTestQueue(me.TestParseDownWilleDerVerlassenen)
  mod.testReporter.AddToTestQueue(me.TestParseSteingestalt)
  mod.testReporter.AddToTestQueue(me.TestParseDownSteingestalt)
  mod.testReporter.AddToTestQueue(me.TestParseEntfesselungskuenstler)
  mod.testReporter.AddToTestQueue(me.TestParseKriegsdonner)
  mod.testReporter.AddToTestQueue(me.TestParseBerserker)
  mod.testReporter.AddToTestQueue(me.TestParseDownBerserker)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenhaftigkeit)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchattenhaftigkeit)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKriegsdonner)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistKriegsdonner)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKriegsdonner)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistKriegsdonner)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundWachsamkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundWachsamkeit",
    "wachsamkeit"
  )
end

function me.TestSoundDownWachsamkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWachsamkeit",
    "wachsamkeit"
  )
end

function me.TestSoundWilleDerVerlassenen()
  mod.testHelper.TestSound(
    className,
    "TestSoundWilleDerVerlassenen",
    "wille_der_verlassenen"
  )
end

function me.TestSoundDownWilleDerVerlassenen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWilleDerVerlassenen",
    "wille_der_verlassenen"
  )
end

function me.TestSoundSteingestalt()
  mod.testHelper.TestSound(
    className,
    "TestSoundSteingestalt",
    "steingestalt"
  )
end

function me.TestSoundDownSteingestalt()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSteingestalt",
    "steingestalt"
  )
end

function me.TestSoundEntfesselungskuenstler()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntfesselungskuenstler",
    "entfesselungskuenstler"
  )
end

function me.TestSoundKriegsdonner()
  mod.testHelper.TestSound(
    className,
    "TestSoundKriegsdonner",
    "kriegsdonner"
  )
end

function me.TestSoundBerserker()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserker",
    "berserker"
  )
end

function me.TestSoundDownBerserker()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserker",
    "berserker"
  )
end

function me.TestSoundSchattenhaftigkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenhaftigkeit",
    "schattenhaftigkeit"
  )
end

function me.TestSoundDownSchattenhaftigkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenhaftigkeit",
    "schattenhaftigkeit"
  )
end

function me.TestSoundEnemyAvoidKriegsdonner()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKriegsdonner",
    "kriegsdonner"
  )
end

function me.TestSoundSelfAvoidKriegsdonner()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKriegsdonner",
    "kriegsdonner"
  )
end

function me.TestParseWachsamkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseWachsamkeit",
    "wachsamkeit",
    "$player$ bekommt 'Wachsamkeit'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownWachsamkeit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownWachsamkeit",
    "wachsamkeit",
    "Wachsamkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseWilleDerVerlassenen()
  mod.testHelper.TestParse(
    className,
    "TestParseWilleDerVerlassenen",
    "wille_der_verlassenen",
    "$player$ bekommt 'Wille der Verlassenen'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownWilleDerVerlassenen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownWilleDerVerlassenen",
    "wille_der_verlassenen",
    "Wille der Verlassenen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSteingestalt()
  mod.testHelper.TestParse(
    className,
    "TestParseSteingestalt",
    "steingestalt",
    "$player$ bekommt 'Steingestalt'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSteingestalt()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSteingestalt",
    "steingestalt",
    "Steingestalt schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEntfesselungskuenstler()
  mod.testHelper.TestParse(
    className,
    "TestParseEntfesselungskuenstler",
    "entfesselungskuenstler",
    "$player$ beginnt Entfesselungskünstler auszuführen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseKriegsdonner()
  mod.testHelper.TestParse(
    className,
    "TestParseKriegsdonner",
    "kriegsdonner",
    "$player$ beginnt Kriegsdonner auszuführen.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseBerserker()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserker",
    "berserker",
    "$player$ bekommt 'Berserker'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBerserker()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBerserker",
    "berserker",
    "Berserker schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

--[[
  Info: Only fading of shadowmeld can be detected. Spells that are in the spellMap
  need a present test. This test does essentialy the same as the ParseDown test
  to meet this requirement.
]]--
function me.TestParseSchattenhaftigkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenhaftigkeit",
    "schattenhaftigkeit",
    "Schattenhaftigkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDownSchattenhaftigkeit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchattenhaftigkeit",
    "schattenhaftigkeit",
    "Schattenhaftigkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidImmuneKriegsdonner()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKriegsdonner",
    "kriegsdonner",
    "Kriegsdonner war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistKriegsdonner()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistKriegsdonner",
    "kriegsdonner",
    "Ihr habt es mit Kriegsdonner versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneKriegsdonner()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKriegsdonner",
    "kriegsdonner",
    "$player$ versucht es mit Kriegsdonner... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistKriegsdonner()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistKriegsdonner",
    "kriegsdonner",
    "$player$ versucht es mit Kriegsdonner... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
