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
mod.testRogueDe = me

me.tag = "TestRogueDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[3]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ROGUE_DE__Test()
  mod.testReporter.StartTestRun("global_rogue_de_all")
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
function _G.__PVPW__TEST_ROGUE_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_rogue_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_rogue_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_rogue_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_rogue_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_rogue_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_rogue_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ROGUE_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_rogue_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlenden)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTritt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTrittZumSchweigenGebracht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprinten)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEntrinnen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNierenhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFieserTrick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalinrausch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKlingenwirbel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownKlingenwirbel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKaltbluetigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownKaltbluetigkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidTritt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFieserTrick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSolarplexus)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRiposte)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidNierenhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlenden)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGeisterhafterStoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKopfnuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKonzentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidAblenken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRuestungSchwaechen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidErdrosseln)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlutung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidTritt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFieserTrick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSolarplexus)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRiposte)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidNierenhieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlenden)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGeisterhafterStoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKopfnuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKonzentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidAblenken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRuestungSchwaechen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidErdrosseln)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlutung)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseTritt)
  mod.testReporter.AddToTestQueue(me.TestParseCritTritt)
  mod.testReporter.AddToTestQueue(me.TestParseTrittZumSchweigenGebracht)
  mod.testReporter.AddToTestQueue(me.TestParseSprinten)
  mod.testReporter.AddToTestQueue(me.TestParseDownSprinten)
  mod.testReporter.AddToTestQueue(me.TestParseEntrinnen)
  mod.testReporter.AddToTestQueue(me.TestParseDownEntrinnen)
  mod.testReporter.AddToTestQueue(me.TestParseNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseAdrenalinrausch)
  mod.testReporter.AddToTestQueue(me.TestParseDownAdrenalinrausch)
  mod.testReporter.AddToTestQueue(me.TestParseKlingenwirbel)
  mod.testReporter.AddToTestQueue(me.TestParseDownKlingenwirbel)
  mod.testReporter.AddToTestQueue(me.TestParseKaltbluetigkeit)
  mod.testReporter.AddToTestQueue(me.TestParseDownKaltbluetigkeit)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeTritt)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryTritt)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneTritt)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissTritt)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockTritt)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParrySolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidBlockGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKopfnuss)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneKonzentration)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneAblenken)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistAblenken)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneErdrosseln)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockTritt)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFieserTrick)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParrySolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockSolarplexus)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockRiposte)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistNierenhieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBlenden)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidBlockGeisterhafterStoss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKopfnuss)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneKonzentration)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneAblenken)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistAblenken)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissRuestungSchwaechen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneErdrosseln)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlutung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissBlutung)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBlenden()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlenden",
    "blenden"
  )
end

function me.TestSoundTritt()
  mod.testHelper.TestSound(
    className,
    "TestSoundTritt",
    "tritt"
  )
end

function me.TestSoundTrittZumSchweigenGebracht()
  mod.testHelper.TestSound(
    className,
    "TestSoundTrittZumSchweigenGebracht",
    "tritt_zum_schweigen_gebracht"
  )
end

function me.TestSoundSprinten()
  mod.testHelper.TestSound(
    className,
    "TestSoundSprinten",
    "sprinten"
  )
end

function me.TestSoundDownSprinten()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSprinten",
    "sprinten"
  )
end

function me.TestSoundEntrinnen()
  mod.testHelper.TestSound(
    className,
    "TestSoundEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundDownEntrinnen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEntrinnen",
    "entrinnen"
  )
end

function me.TestSoundNierenhieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundNierenhieb",
    "nierenhieb"
  )
end

function me.TestSoundFieserTrick()
  mod.testHelper.TestSound(
    className,
    "TestSoundFieserTrick",
    "fieser_trick"
  )
end

function me.TestSoundAdrenalinrausch()
  mod.testHelper.TestSound(
    className,
    "TestSoundAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundDownAdrenalinrausch()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAdrenalinrausch",
    "adrenalinrausch"
  )
end

function me.TestSoundKlingenwirbel()
  mod.testHelper.TestSound(
    className,
    "TestSoundKlingenwirbel",
    "klingenwirbel"
  )
end

function me.TestSoundDownKlingenwirbel()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownKlingenwirbel",
    "klingenwirbel"
  )
end

function me.TestSoundKaltbluetigkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundKaltbluetigkeit",
    "kaltbluetigkeit"
  )
end

function me.TestSoundDownKaltbluetigkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownKaltbluetigkeit",
    "kaltbluetigkeit"
  )
end

function me.TestSoundEnemyAvoidTritt()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidTritt",
    "tritt"
  )
end

function me.TestSoundEnemyAvoidFieserTrick()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFieserTrick",
    "fieser_trick"
  )
end

function me.TestSoundEnemyAvoidSolarplexus()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSolarplexus",
    "solarplexus"
  )
end

function me.TestSoundEnemyAvoidRiposte()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidRiposte",
    "riposte"
  )
end

function me.TestSoundEnemyAvoidNierenhieb()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidNierenhieb",
    "nierenhieb"
  )
end

function me.TestSoundEnemyAvoidBlenden()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlenden",
    "blenden"
  )
end

function me.TestSoundEnemyAvoidGeisterhafterStoss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGeisterhafterStoss",
    "geisterhafter_stoss"
  )
end

function me.TestSoundEnemyAvoidKopfnuss()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKopfnuss",
    "kopfnuss"
  )
end

function me.TestSoundEnemyAvoidKonzentration()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidKonzentration",
    "konzentration"
  )
end

function me.TestSoundEnemyAvoidAblenken()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidAblenken",
    "ablenken"
  )
end

function me.TestSoundEnemyAvoidRuestungSchwaechen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidRuestungSchwaechen",
    "ruestung_schwaechen"
  )
end

function me.TestSoundEnemyAvoidErdrosseln()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidErdrosseln",
    "erdrosseln"
  )
end

function me.TestSoundEnemyAvoidBlutung()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlutung",
    "blutung"
  )
end

function me.TestSoundSelfAvoidTritt()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidTritt",
    "tritt"
  )
end

function me.TestSoundSelfAvoidFieserTrick()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFieserTrick",
    "fieser_trick"
  )
end

function me.TestSoundSelfAvoidSolarplexus()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSolarplexus",
    "solarplexus"
  )
end

function me.TestSoundSelfAvoidRiposte()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidRiposte",
    "riposte"
  )
end

function me.TestSoundSelfAvoidNierenhieb()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidNierenhieb",
    "nierenhieb"
  )
end

function me.TestSoundSelfAvoidBlenden()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlenden",
    "blenden"
  )
end

function me.TestSoundSelfAvoidGeisterhafterStoss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGeisterhafterStoss",
    "geisterhafter_stoss"
  )
end

function me.TestSoundSelfAvoidKopfnuss()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKopfnuss",
    "kopfnuss"
  )
end

function me.TestSoundSelfAvoidKonzentration()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidKonzentration",
    "konzentration"
  )
end

function me.TestSoundSelfAvoidAblenken()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidAblenken",
    "ablenken"
  )
end

function me.TestSoundSelfAvoidRuestungSchwaechen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidRuestungSchwaechen",
    "ruestung_schwaechen"
  )
end

function me.TestSoundSelfAvoidErdrosseln()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidErdrosseln",
    "erdrosseln"
  )
end

function me.TestSoundSelfAvoidBlutung()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlutung",
    "blutung"
  )
end

function me.TestParseBlenden()
  mod.testHelper.TestParse(
    className,
    "TestParseBlenden",
    "blenden",
    "Ihr seid von Blenden betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseTritt()
  mod.testHelper.TestParse(
    className,
    "TestParseTritt",
    "tritt",
    "$player$ trifft Euch (mit Tritt). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseCritTritt()
  mod.testHelper.TestParse(
    className,
    "TestParseCritTritt",
    "tritt",
    "$player$ trifft Euch kritisch (mit Tritt). Schaden: $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseTrittZumSchweigenGebracht()
  mod.testHelper.TestParse(
    className,
    "TestParseTrittZumSchweigenGebracht",
    "tritt_zum_schweigen_gebracht",
    "Ihr seid von Tritt - zum Schweigen gebracht betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSprinten()
  mod.testHelper.TestParse(
    className,
    "TestParseSprinten",
    "sprinten",
    "$player$ bekommt 'Sprinten'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSprinten()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSprinten",
    "sprinten",
    "Sprinten schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEntrinnen()
  mod.testHelper.TestParse(
    className,
    "TestParseEntrinnen",
    "entrinnen",
    "$player$ bekommt 'Entrinnen'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEntrinnen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEntrinnen",
    "entrinnen",
    "Entrinnen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNierenhieb()
  mod.testHelper.TestParse(
    className,
    "TestParseNierenhieb",
    "nierenhieb",
    "Ihr seid von Nierenhieb betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFieserTrick()
  mod.testHelper.TestParse(
    className,
    "TestParseFieserTrick",
    "fieser_trick",
    "Ihr seid von Fieser Trick betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseAdrenalinrausch()
  mod.testHelper.TestParse(
    className,
    "TestParseAdrenalinrausch",
    "adrenalinrausch",
    "$player$ bekommt 'Adrenalinrausch'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAdrenalinrausch()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAdrenalinrausch",
    "adrenalinrausch",
    "Adrenalinrausch schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKlingenwirbel()
  mod.testHelper.TestParse(
    className,
    "TestParseKlingenwirbel",
    "klingenwirbel",
    "$player$ bekommt 'Klingenwirbel'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownKlingenwirbel()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownKlingenwirbel",
    "klingenwirbel",
    "Klingenwirbel schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseKaltbluetigkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseKaltbluetigkeit",
    "kaltbluetigkeit",
    "$player$ bekommt 'Kaltblütigkeit'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownKaltbluetigkeit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownKaltbluetigkeit",
    "kaltbluetigkeit",
    "Kaltblütigkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidDodgeTritt()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeTritt",
    "tritt",
    "$player$ ist Tritt ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryTritt()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryTritt",
    "tritt",
    "Tritt wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneTritt()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneTritt",
    "tritt",
    "Tritt war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissTritt()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissTritt",
    "tritt",
    "Tritt hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockTritt()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockTritt",
    "tritt",
    "Tritt wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneFieserTrick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFieserTrick",
    "fieser_trick",
    "Fieser Trick war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissFieserTrick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissFieserTrick",
    "fieser_trick",
    "Fieser Trick hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistFieserTrick()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFieserTrick",
    "fieser_trick",
    "Ihr habt es mit Fieser Trick versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeSolarplexus()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeSolarplexus",
    "solarplexus",
    "$player$ ist Solarplexus ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParrySolarplexus()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParrySolarplexus",
    "solarplexus",
    "Solarplexus wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneSolarplexus()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSolarplexus",
    "solarplexus",
    "Solarplexus war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissSolarplexus()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissSolarplexus",
    "solarplexus",
    "Solarplexus hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockSolarplexus()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockSolarplexus",
    "solarplexus",
    "Solarplexus wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeRiposte",
    "riposte",
    "$player$ ist Riposte ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryRiposte",
    "riposte",
    "Riposte wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneRiposte",
    "riposte",
    "Riposte war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissRiposte",
    "riposte",
    "Riposte hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockRiposte()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockRiposte",
    "riposte",
    "Riposte wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidDodgeNierenhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeNierenhieb",
    "nierenhieb",
    "$player$ ist Nierenhieb ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryNierenhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryNierenhieb",
    "nierenhieb",
    "Nierenhieb wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneNierenhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneNierenhieb",
    "nierenhieb",
    "Nierenhieb war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissNierenhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissNierenhieb",
    "nierenhieb",
    "Nierenhieb hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistNierenhieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistNierenhieb",
    "nierenhieb",
    "Ihr habt es mit Nierenhieb versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneBlenden()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlenden",
    "blenden",
    "Blenden war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBlenden()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBlenden",
    "blenden",
    "Blenden hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidDodgeGeisterhafterStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeGeisterhafterStoss",
    "geisterhafter_stoss",
    "$player$ ist Geisterhafter Stoß ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryGeisterhafterStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryGeisterhafterStoss",
    "geisterhafter_stoss",
    "Geisterhafter Stoß wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneGeisterhafterStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGeisterhafterStoss",
    "geisterhafter_stoss",
    "Geisterhafter Stoß war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissGeisterhafterStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissGeisterhafterStoss",
    "geisterhafter_stoss",
    "Geisterhafter Stoß hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidBlockGeisterhafterStoss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidBlockGeisterhafterStoss",
    "geisterhafter_stoss",
    "Geisterhafter Stoß wurde von $player$ geblockt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseEnemyAvoidImmuneKopfnuss()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKopfnuss",
    "kopfnuss",
    "Kopfnuss war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneKonzentration()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneKonzentration",
    "konzentration",
    "Konzentration war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneAblenken()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneAblenken",
    "ablenken",
    "Ablenken war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistAblenken()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistAblenken",
    "ablenken",
    "Ihr habt es mit Ablenken versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeRuestungSchwaechen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeRuestungSchwaechen",
    "ruestung_schwaechen",
    "$player$ ist Rüstung schwächen ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryRuestungSchwaechen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryRuestungSchwaechen",
    "ruestung_schwaechen",
    "Rüstung schwächen wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneRuestungSchwaechen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneRuestungSchwaechen",
    "ruestung_schwaechen",
    "Rüstung schwächen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissRuestungSchwaechen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissRuestungSchwaechen",
    "ruestung_schwaechen",
    "Rüstung schwächen hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneErdrosseln()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneErdrosseln",
    "erdrosseln",
    "Erdrosseln war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidDodgeBlutung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeBlutung",
    "blutung",
    "$player$ ist Blutung ausgewichen.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryBlutung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryBlutung",
    "blutung",
    "Blutung wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneBlutung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlutung",
    "blutung",
    "Blutung war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissBlutung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissBlutung",
    "blutung",
    "Blutung hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeTritt()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeTritt",
    "tritt",
    "$player$s Tritt wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryTritt()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryTritt",
    "tritt",
    "Tritt von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneTritt()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneTritt",
    "tritt",
    "$player$ versucht es mit Tritt... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissTritt()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissTritt",
    "tritt",
    "$player$ greift an (mit Tritt) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockTritt()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockTritt",
    "tritt",
    "$player$s Tritt wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneFieserTrick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFieserTrick",
    "fieser_trick",
    "$player$ versucht es mit Fieser Trick... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissFieserTrick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissFieserTrick",
    "fieser_trick",
    "$player$ greift an (mit Fieser Trick) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistFieserTrick()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFieserTrick",
    "fieser_trick",
    "$player$ versucht es mit Fieser Trick... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeSolarplexus()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeSolarplexus",
    "solarplexus",
    "$player$s Solarplexus wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParrySolarplexus()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParrySolarplexus",
    "solarplexus",
    "Solarplexus von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneSolarplexus()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSolarplexus",
    "solarplexus",
    "$player$ versucht es mit Solarplexus... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissSolarplexus()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissSolarplexus",
    "solarplexus",
    "$player$ greift an (mit Solarplexus) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockSolarplexus()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockSolarplexus",
    "solarplexus",
    "$player$s Solarplexus wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeRiposte",
    "riposte",
    "$player$s Riposte wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryRiposte",
    "riposte",
    "Riposte von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneRiposte",
    "riposte",
    "$player$ versucht es mit Riposte... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissRiposte",
    "riposte",
    "$player$ greift an (mit Riposte) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockRiposte()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockRiposte",
    "riposte",
    "$player$s Riposte wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidDodgeNierenhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeNierenhieb",
    "nierenhieb",
    "$player$s Nierenhieb wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryNierenhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryNierenhieb",
    "nierenhieb",
    "Nierenhieb von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneNierenhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneNierenhieb",
    "nierenhieb",
    "$player$ versucht es mit Nierenhieb... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissNierenhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissNierenhieb",
    "nierenhieb",
    "$player$ greift an (mit Nierenhieb) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistNierenhieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistNierenhieb",
    "nierenhieb",
    "$player$ versucht es mit Nierenhieb... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneBlenden()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlenden",
    "blenden",
    "$player$ versucht es mit Blenden... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBlenden()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBlenden",
    "blenden",
    "$player$ greift an (mit Blenden) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidDodgeGeisterhafterStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeGeisterhafterStoss",
    "geisterhafter_stoss",
    "$player$s Geisterhafter Stoß wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryGeisterhafterStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryGeisterhafterStoss",
    "geisterhafter_stoss",
    "Geisterhafter Stoß von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneGeisterhafterStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGeisterhafterStoss",
    "geisterhafter_stoss",
    "$player$ versucht es mit Geisterhafter Stoß... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissGeisterhafterStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissGeisterhafterStoss",
    "geisterhafter_stoss",
    "$player$ greift an (mit Geisterhafter Stoß) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidBlockGeisterhafterStoss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidBlockGeisterhafterStoss",
    "geisterhafter_stoss",
    "$player$s Geisterhafter Stoß wurde geblockt.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.BLOCK
  )
end

function me.TestParseSelfAvoidImmuneKopfnuss()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKopfnuss",
    "kopfnuss",
    "$player$ versucht es mit Kopfnuss... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneKonzentration()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneKonzentration",
    "konzentration",
    "$player$ versucht es mit Konzentration... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneAblenken()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneAblenken",
    "ablenken",
    "$player$ versucht es mit Ablenken... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistAblenken()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistAblenken",
    "ablenken",
    "$player$ versucht es mit Ablenken... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeRuestungSchwaechen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeRuestungSchwaechen",
    "ruestung_schwaechen",
    "$player$s Rüstung schwächen wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryRuestungSchwaechen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryRuestungSchwaechen",
    "ruestung_schwaechen",
    "Rüstung schwächen von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneRuestungSchwaechen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneRuestungSchwaechen",
    "ruestung_schwaechen",
    "$player$ versucht es mit Rüstung schwächen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissRuestungSchwaechen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissRuestungSchwaechen",
    "ruestung_schwaechen",
    "$player$ greift an (mit Rüstung schwächen) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneErdrosseln()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneErdrosseln",
    "erdrosseln",
    "$player$ versucht es mit Erdrosseln... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidDodgeBlutung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeBlutung",
    "blutung",
    "$player$s Blutung wurde ausgewichen.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryBlutung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryBlutung",
    "blutung",
    "Blutung von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneBlutung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlutung",
    "blutung",
    "$player$ versucht es mit Blutung... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissBlutung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissBlutung",
    "blutung",
    "$player$ greift an (mit Blutung) und verfehlt euch.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end
