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
mod.testWarriorDe = me

me.tag = "TestWarriorDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[1]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARRIOR_DE__Test()
  mod.testReporter.StartTestRun("global_warrior_de_all")
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

function _G.__PVPW__TEST_WARRIOR_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_warrior_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warrior_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_warrior_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warrior_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warrior_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warrior_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARRIOR_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_warrior_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerwut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTollkuehnheit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTodeswunsch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildwall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKampfhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerhaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerteidigungshaltung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLetztesGefecht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntwaffnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErschuetternderSchlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlutrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZuschlagen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBetaeubungAbfangen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDrohruf)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildblock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchildblock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildhiebZumSchweigenGebracht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchildschlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBetaeubungAbfangen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKniesehne)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidToedlicherStoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidUeberwaeltigen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlutdurst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDrohruf)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidZuschlagen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidErschuetternderSchlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntwaffnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchildhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchildschlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBetaeubungAbfangen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKniesehne)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidToedlicherStoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidUeberwaeltigen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlutdurst)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDrohruf)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidZuschlagen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidErschuetternderSchlag)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntwaffnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchildhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchildschlag)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseBerserkerwut)
  mod.testReporter.AddToTestQueue(me.TestParseDownBerserkerwut)
  mod.testReporter.AddToTestQueue(me.TestParseTollkuehnheit)
  mod.testReporter.AddToTestQueue(me.TestParseDownTollkuehnheit)
  mod.testReporter.AddToTestQueue(me.TestParseTodeswunsch)
  mod.testReporter.AddToTestQueue(me.TestParseDownTodeswunsch)
  mod.testReporter.AddToTestQueue(me.TestParseSchildwall)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchildwall)
  mod.testReporter.AddToTestQueue(me.TestParseKampfhaltung)
  mod.testReporter.AddToTestQueue(me.TestParseBerserkerhaltung)
  mod.testReporter.AddToTestQueue(me.TestParseVerteidigungshaltung)
  mod.testReporter.AddToTestQueue(me.TestParseSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseLetztesGefecht)
  mod.testReporter.AddToTestQueue(me.TestParseDownLetztesGefecht)
  mod.testReporter.AddToTestQueue(me.TestParseEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseBlutrausch)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlutrausch)
  mod.testReporter.AddToTestQueue(me.TestParseZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseCritZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseSchildblock)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchildblock)
  mod.testReporter.AddToTestQueue(me.TestParseSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSchildhiebZumSchweigenGebracht)
  mod.testReporter.AddToTestQueue(me.TestParseSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneUeberwaeltigen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissUeberwaeltigen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParrySchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParrySchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistBetaeubungAbfangen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockKniesehne)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockToedlicherStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneUeberwaeltigen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissUeberwaeltigen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockBlutdurst)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistSturmangriffsbetaeubung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistDrohruf)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockZuschlagen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistErschuetternderSchlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissEntwaffnen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParrySchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockSchildhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParrySchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissSchildschlag)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockSchildschlag)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBerserkerwut()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundDownBerserkerwut()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBerserkerwut",
    "berserkerwut"
  )
end

function me.TestSoundTollkuehnheit()
  mod.testHelper.TestSound(
    className,
    "TestSoundTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundDownTollkuehnheit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTollkuehnheit",
    "tollkuehnheit"
  )
end

function me.TestSoundTodeswunsch()
  mod.testHelper.TestSound(
    className,
    "TestSoundTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundDownTodeswunsch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTodeswunsch",
    "todeswunsch"
  )
end

function me.TestSoundSchildwall()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildwall",
    "schildwall"
  )
end

function me.TestSoundDownSchildwall()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildwall",
    "schildwall"
  )
end

function me.TestSoundKampfhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundKampfhaltung",
    "kampfhaltung"
  )
end

function me.TestSoundBerserkerhaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundBerserkerhaltung",
    "berserkerhaltung"
  )
end

function me.TestSoundVerteidigungshaltung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerteidigungshaltung",
    "verteidigungshaltung"
  )
end

function me.TestSoundSturmangriffsbetaeubung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung"
  )
end

function me.TestSoundLetztesGefecht()
  mod.testHelper.TestSound(
    className,
    "TestSoundLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundDownLetztesGefecht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownLetztesGefecht",
    "letztes_gefecht"
  )
end

function me.TestSoundEntwaffnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntwaffnen",
    "entwaffnen"
  )
end

function me.TestSoundErschuetternderSchlag()
  mod.testHelper.TestSound(
    className,
    "TestSoundErschuetternderSchlag",
    "erschuetternder_schlag"
  )
end

function me.TestSoundBlutrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundDownBlutrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlutrausch",
    "blutrausch"
  )
end

function me.TestSoundZuschlagen()
  mod.testHelper.TestSound(
    className,
    "TestSoundZuschlagen",
    "zuschlagen"
  )
end

function me.TestSoundBetaeubungAbfangen()
  mod.testHelper.TestSound(
    className,
    "TestSoundBetaeubungAbfangen",
    "betaeubung_abfangen"
  )
end

function me.TestSoundDrohruf()
  mod.testHelper.TestSound(
    className,
    "TestSoundDrohruf",
    "drohruf"
  )
end

function me.TestSoundSchildblock()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildblock",
    "schildblock"
  )
end

function me.TestSoundDownSchildblock()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchildblock",
    "schildblock"
  )
end

function me.TestSoundSchildhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildhieb",
    "schildhieb"
  )
end

function me.TestSoundSchildhiebZumSchweigenGebracht()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildhiebZumSchweigenGebracht",
    "schildhieb_zum_schweigen_gebracht"
  )
end

function me.TestSoundSchildschlag()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchildschlag",
    "schildschlag"
  )
end

function me.TestSoundEnemyAvoidBetaeubungAbfangen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBetaeubungAbfangen",
    "betaeubung_abfangen"
  )
end

function me.TestSoundEnemyAvoidKniesehne()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKniesehne",
    "kniesehne"
  )
end

function me.TestSoundEnemyAvoidToedlicherStoss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidToedlicherStoss",
    "toedlicher_stoss"
  )
end

function me.TestSoundEnemyAvoidUeberwaeltigen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidUeberwaeltigen",
    "ueberwaeltigen"
  )
end

function me.TestSoundEnemyAvoidBlutdurst()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlutdurst",
    "blutdurst"
  )
end

function me.TestSoundEnemyAvoidSturmangriffsbetaeubung()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung"
  )
end

function me.TestSoundEnemyAvoidDrohruf()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidDrohruf",
    "drohruf"
  )
end

function me.TestSoundEnemyAvoidZuschlagen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidZuschlagen",
    "zuschlagen"
  )
end

function me.TestSoundEnemyAvoidErschuetternderSchlag()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidErschuetternderSchlag",
    "erschuetternder_schlag"
  )
end

function me.TestSoundEnemyAvoidEntwaffnen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidEntwaffnen",
    "entwaffnen"
  )
end

function me.TestSoundEnemyAvoidSchildhieb()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchildhieb",
    "schildhieb"
  )
end

function me.TestSoundEnemyAvoidSchildschlag()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchildschlag",
    "schildschlag"
  )
end

function me.TestSoundSelfAvoidBetaeubungAbfangen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBetaeubungAbfangen",
    "betaeubung_abfangen"
  )
end

function me.TestSoundSelfAvoidKniesehne()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKniesehne",
    "kniesehne"
  )
end

function me.TestSoundSelfAvoidToedlicherStoss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidToedlicherStoss",
    "toedlicher_stoss"
  )
end

function me.TestSoundSelfAvoidUeberwaeltigen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidUeberwaeltigen",
    "ueberwaeltigen"
  )
end

function me.TestSoundSelfAvoidBlutdurst()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlutdurst",
    "blutdurst"
  )
end

function me.TestSoundSelfAvoidSturmangriffsbetaeubung()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung"
  )
end

function me.TestSoundSelfAvoidDrohruf()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidDrohruf",
    "drohruf"
  )
end

function me.TestSoundSelfAvoidZuschlagen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidZuschlagen",
    "zuschlagen"
  )
end

function me.TestSoundSelfAvoidErschuetternderSchlag()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidErschuetternderSchlag",
    "erschuetternder_schlag"
  )
end

function me.TestSoundSelfAvoidEntwaffnen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidEntwaffnen",
    "entwaffnen"
  )
end

function me.TestSoundSelfAvoidSchildhieb()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchildhieb",
    "schildhieb"
  )
end

function me.TestSoundSelfAvoidSchildschlag()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchildschlag",
    "schildschlag"
  )
end

function me.TestParseBerserkerwut()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerwut",
    "berserkerwut",
    "$player$ bekommt 'Berserkerwut'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBerserkerwut()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBerserkerwut",
    "berserkerwut",
    "Berserkerwut schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTollkuehnheit()
  mod.testHelper.TestParse(
    className,
    "TestParseTollkuehnheit",
    "tollkuehnheit",
    "$player$ bekommt 'Tollkühnheit'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTollkuehnheit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTollkuehnheit",
    "tollkuehnheit",
    "Tollkühnheit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTodeswunsch()
  mod.testHelper.TestParse(
    className,
    "TestParseTodeswunsch",
    "todeswunsch",
    "$player$ bekommt 'Todeswunsch'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTodeswunsch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTodeswunsch",
    "todeswunsch",
    "Todeswunsch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchildwall()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildwall",
    "schildwall",
    "$player$ bekommt 'Schildwall'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchildwall()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchildwall",
    "schildwall",
    "Schildwall schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKampfhaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseKampfhaltung",
    "kampfhaltung",
    "$player$ bekommt 'Kampfhaltung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseBerserkerhaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseBerserkerhaltung",
    "berserkerhaltung",
    "$player$ bekommt 'Berserkerhaltung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseVerteidigungshaltung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerteidigungshaltung",
    "verteidigungshaltung",
    "$player$ bekommt 'Verteidigungshaltung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseSturmangriffsbetaeubung()
  mod.testHelper.TestParse(
    className,
    "TestParseSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "Ihr seid von Sturmangriffsbetäubung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseLetztesGefecht()
  mod.testHelper.TestParse(
    className,
    "TestParseLetztesGefecht",
    "letztes_gefecht",
    "$player$ bekommt 'Letztes Gefecht'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownLetztesGefecht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownLetztesGefecht",
    "letztes_gefecht",
    "Letztes Gefecht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEntwaffnen()
  mod.testHelper.TestParse(
    className,
    "TestParseEntwaffnen",
    "entwaffnen",
    "Ihr seid von Entwaffnen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseErschuetternderSchlag()
  mod.testHelper.TestParse(
    className,
    "TestParseErschuetternderSchlag",
    "erschuetternder_schlag",
    "Ihr seid von Erschütternder Schlag betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBlutrausch()
  mod.testHelper.TestParse(
    className,
    "TestParseBlutrausch",
    "blutrausch",
    "$player$ bekommt 'Blutrausch'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBlutrausch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBlutrausch",
    "blutrausch",
    "Blutrausch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseZuschlagen()
  mod.testHelper.TestParse(
    className,
    "TestParseZuschlagen",
    "zuschlagen",
    "$player$ trifft Euch (mit Zuschlagen). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritZuschlagen()
  mod.testHelper.TestParse(
    className,
    "TestParseCritZuschlagen",
    "zuschlagen",
    "$player$ trifft Euch kritisch (mit Zuschlagen). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseBetaeubungAbfangen()
  mod.testHelper.TestParse(
    className,
    "TestParseBetaeubungAbfangen",
    "betaeubung_abfangen",
    "Ihr seid von Betäubung abfangen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseDrohruf()
  mod.testHelper.TestParse(
    className,
    "TestParseDrohruf",
    "drohruf",
    "Ihr seid von Drohruf betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSchildblock()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildblock",
    "schildblock",
    "$player$ bekommt 'Schildblock'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchildblock()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchildblock",
    "schildblock",
    "Schildblock schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchildhieb()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildhieb",
    "schildhieb",
    "$player$ trifft Euch (mit Schildhieb). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSchildhiebZumSchweigenGebracht()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildhiebZumSchweigenGebracht",
    "schildhieb_zum_schweigen_gebracht",
    "Ihr seid von Schildhieb - zum Schweigen gebracht betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSchildschlag()
  mod.testHelper.TestParse(
    className,
    "TestParseSchildschlag",
    "schildschlag",
    "$player$ trifft Euch (mit Schildschlag). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseEnemyAvoidImmuneBetaeubungAbfangen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBetaeubungAbfangen",
    "betaeubung_abfangen",
    "Betäubung abfangen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistBetaeubungAbfangen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistBetaeubungAbfangen",
    "betaeubung_abfangen",
    "Ihr habt es mit Betäubung abfangen versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeKniesehne()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeKniesehne",
    "kniesehne",
    "$player$ ist Kniesehne ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryKniesehne()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryKniesehne",
    "kniesehne",
    "Kniesehne wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneKniesehne()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKniesehne",
    "kniesehne",
    "Kniesehne war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissKniesehne()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissKniesehne",
    "kniesehne",
    "Kniesehne hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockKniesehne()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockKniesehne",
    "kniesehne",
    "Kniesehne wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeToedlicherStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeToedlicherStoss",
    "toedlicher_stoss",
    "$player$ ist Tödlicher Stoß ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryToedlicherStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryToedlicherStoss",
    "toedlicher_stoss",
    "Tödlicher Stoß wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneToedlicherStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneToedlicherStoss",
    "toedlicher_stoss",
    "Tödlicher Stoß war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissToedlicherStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissToedlicherStoss",
    "toedlicher_stoss",
    "Tödlicher Stoß hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockToedlicherStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockToedlicherStoss",
    "toedlicher_stoss",
    "Tödlicher Stoß wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneUeberwaeltigen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneUeberwaeltigen",
    "ueberwaeltigen",
    "Überwältigen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissUeberwaeltigen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissUeberwaeltigen",
    "ueberwaeltigen",
    "Überwältigen hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeBlutdurst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeBlutdurst",
    "blutdurst",
    "$player$ ist Blutdurst ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryBlutdurst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryBlutdurst",
    "blutdurst",
    "Blutdurst wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneBlutdurst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlutdurst",
    "blutdurst",
    "Blutdurst war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBlutdurst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBlutdurst",
    "blutdurst",
    "Blutdurst hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockBlutdurst()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockBlutdurst",
    "blutdurst",
    "Blutdurst wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneSturmangriffsbetaeubung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "Sturmangriffsbetäubung war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistSturmangriffsbetaeubung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "Ihr habt es mit Sturmangriffsbetäubung versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneDrohruf()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneDrohruf",
    "drohruf",
    "Drohruf war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistDrohruf()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistDrohruf",
    "drohruf",
    "Ihr habt es mit Drohruf versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeZuschlagen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeZuschlagen",
    "zuschlagen",
    "$player$ ist Zuschlagen ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryZuschlagen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryZuschlagen",
    "zuschlagen",
    "Zuschlagen wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneZuschlagen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneZuschlagen",
    "zuschlagen",
    "Zuschlagen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissZuschlagen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissZuschlagen",
    "zuschlagen",
    "Zuschlagen hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockZuschlagen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockZuschlagen",
    "zuschlagen",
    "Zuschlagen wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeErschuetternderSchlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeErschuetternderSchlag",
    "erschuetternder_schlag",
    "$player$ ist Erschütternder Schlag ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryErschuetternderSchlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryErschuetternderSchlag",
    "erschuetternder_schlag",
    "Erschütternder Schlag wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneErschuetternderSchlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneErschuetternderSchlag",
    "erschuetternder_schlag",
    "Erschütternder Schlag war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissErschuetternderSchlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissErschuetternderSchlag",
    "erschuetternder_schlag",
    "Erschütternder Schlag hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistErschuetternderSchlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistErschuetternderSchlag",
    "erschuetternder_schlag",
    "Ihr habt es mit Erschütternder Schlag versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeEntwaffnen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeEntwaffnen",
    "entwaffnen",
    "$player$ ist Entwaffnen ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryEntwaffnen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryEntwaffnen",
    "entwaffnen",
    "Entwaffnen wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneEntwaffnen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneEntwaffnen",
    "entwaffnen",
    "Entwaffnen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissEntwaffnen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissEntwaffnen",
    "entwaffnen",
    "Entwaffnen hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeSchildhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeSchildhieb",
    "schildhieb",
    "$player$ ist Schildhieb ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParrySchildhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParrySchildhieb",
    "schildhieb",
    "Schildhieb wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneSchildhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchildhieb",
    "schildhieb",
    "Schildhieb war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissSchildhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissSchildhieb",
    "schildhieb",
    "Schildhieb hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockSchildhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockSchildhieb",
    "schildhieb",
    "Schildhieb wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeSchildschlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeSchildschlag",
    "schildschlag",
    "$player$ ist Schildschlag ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParrySchildschlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParrySchildschlag",
    "schildschlag",
    "Schildschlag wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneSchildschlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchildschlag",
    "schildschlag",
    "Schildschlag war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissSchildschlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissSchildschlag",
    "schildschlag",
    "Schildschlag hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockSchildschlag()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockSchildschlag",
    "schildschlag",
    "Schildschlag wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneBetaeubungAbfangen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBetaeubungAbfangen",
    "betaeubung_abfangen",
    "$player$ versucht es mit Betäubung abfangen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistBetaeubungAbfangen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistBetaeubungAbfangen",
    "betaeubung_abfangen",
    "$player$ versucht es mit Betäubung abfangen... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeKniesehne()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeKniesehne",
    "kniesehne",
    "$player$s Kniesehne wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryKniesehne()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryKniesehne",
    "kniesehne",
    "Kniesehne von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneKniesehne()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKniesehne",
    "kniesehne",
    "$player$ versucht es mit Kniesehne... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissKniesehne()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissKniesehne",
    "kniesehne",
    "$player$ greift an (mit Kniesehne) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockKniesehne()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockKniesehne",
    "kniesehne",
    "$player$s Kniesehne wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeToedlicherStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeToedlicherStoss",
    "toedlicher_stoss",
    "$player$s Tödlicher Stoß wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryToedlicherStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryToedlicherStoss",
    "toedlicher_stoss",
    "Tödlicher Stoß von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneToedlicherStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneToedlicherStoss",
    "toedlicher_stoss",
    "$player$ versucht es mit Tödlicher Stoß... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissToedlicherStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissToedlicherStoss",
    "toedlicher_stoss",
    "$player$ greift an (mit Tödlicher Stoß) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockToedlicherStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockToedlicherStoss",
    "toedlicher_stoss",
    "$player$s Tödlicher Stoß wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneUeberwaeltigen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneUeberwaeltigen",
    "ueberwaeltigen",
    "$player$ versucht es mit Überwältigen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissUeberwaeltigen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissUeberwaeltigen",
    "ueberwaeltigen",
    "$player$ greift an (mit Überwältigen) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeBlutdurst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeBlutdurst",
    "blutdurst",
    "$player$s Blutdurst wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryBlutdurst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryBlutdurst",
    "blutdurst",
    "Blutdurst von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneBlutdurst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlutdurst",
    "blutdurst",
    "$player$ versucht es mit Blutdurst... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBlutdurst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBlutdurst",
    "blutdurst",
    "$player$ greift an (mit Blutdurst) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockBlutdurst()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockBlutdurst",
    "blutdurst",
    "$player$s Blutdurst wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneSturmangriffsbetaeubung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "$player$ versucht es mit Sturmangriffsbetäubung... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSturmangriffsbetaeubung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSturmangriffsbetaeubung",
    "sturmangriffsbetaeubung",
    "$player$ versucht es mit Sturmangriffsbetäubung... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneDrohruf()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneDrohruf",
    "drohruf",
    "$player$ versucht es mit Drohruf... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistDrohruf()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistDrohruf",
    "drohruf",
    "$player$ versucht es mit Drohruf... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeZuschlagen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeZuschlagen",
    "zuschlagen",
    "$player$s Zuschlagen wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryZuschlagen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryZuschlagen",
    "zuschlagen",
    "Zuschlagen von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneZuschlagen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneZuschlagen",
    "zuschlagen",
    "$player$ versucht es mit Zuschlagen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissZuschlagen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissZuschlagen",
    "zuschlagen",
    "$player$ greift an (mit Zuschlagen) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockZuschlagen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockZuschlagen",
    "zuschlagen",
    "$player$s Zuschlagen wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeErschuetternderSchlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeErschuetternderSchlag",
    "erschuetternder_schlag",
    "$player$s Erschütternder Schlag wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryErschuetternderSchlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryErschuetternderSchlag",
    "erschuetternder_schlag",
    "Erschütternder Schlag von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneErschuetternderSchlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneErschuetternderSchlag",
    "erschuetternder_schlag",
    "$player$ versucht es mit Erschütternder Schlag... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissErschuetternderSchlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissErschuetternderSchlag",
    "erschuetternder_schlag",
    "$player$ greift an (mit Erschütternder Schlag) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistErschuetternderSchlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistErschuetternderSchlag",
    "erschuetternder_schlag",
    "$player$ versucht es mit Erschütternder Schlag... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeEntwaffnen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeEntwaffnen",
    "entwaffnen",
    "$player$s Entwaffnen wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryEntwaffnen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryEntwaffnen",
    "entwaffnen",
    "Entwaffnen von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneEntwaffnen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneEntwaffnen",
    "entwaffnen",
    "$player$ versucht es mit Entwaffnen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissEntwaffnen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissEntwaffnen",
    "entwaffnen",
    "$player$ greift an (mit Entwaffnen) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeSchildhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeSchildhieb",
    "schildhieb",
    "$player$s Schildhieb wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParrySchildhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParrySchildhieb",
    "schildhieb",
    "Schildhieb von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneSchildhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchildhieb",
    "schildhieb",
    "$player$ versucht es mit Schildhieb... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissSchildhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissSchildhieb",
    "schildhieb",
    "$player$ greift an (mit Schildhieb) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockSchildhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockSchildhieb",
    "schildhieb",
    "$player$s Schildhieb wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeSchildschlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeSchildschlag",
    "schildschlag",
    "$player$s Schildschlag wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParrySchildschlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParrySchildschlag",
    "schildschlag",
    "Schildschlag von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneSchildschlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchildschlag",
    "schildschlag",
    "$player$ versucht es mit Schildschlag... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissSchildschlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissSchildschlag",
    "schildschlag",
    "$player$ greift an (mit Schildschlag) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockSchildschlag()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockSchildschlag",
    "schildschlag",
    "$player$s Schildschlag wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end
