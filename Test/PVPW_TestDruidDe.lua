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
mod.testDruidDe = me

me.tag = "TestDruidDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[8]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_DRUID_DE__Test()
  mod.testReporter.StartTestRun("global_druid_de_all")
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

function _G.__PVPW__TEST_DRUID_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_druid_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_druid_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_druid_de_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_druid_de_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_druid_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_druid_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_druid_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_druid_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_DRUID_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_druid_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBaumrinde)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBaumrinde)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGriffDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGriffDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildeAttacke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRasendeRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRasendeRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVergiftungAufheben)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVergiftungAufheben)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAnregen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAnregen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeenfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidWucherwurzeln)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFeenfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidWildeAttacke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWucherwurzeln)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFeenfeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHieb)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWildeAttacke)

  if not playManual then
    -- mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseBaumrinde)
  mod.testReporter.AddToTestQueue(me.TestParseDownBaumrinde)
  mod.testReporter.AddToTestQueue(me.TestParseGriffDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseDownGriffDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseHieb)
  mod.testReporter.AddToTestQueue(me.TestParseWildeAttacke)
  mod.testReporter.AddToTestQueue(me.TestParseRasendeRegeneration)
  mod.testReporter.AddToTestQueue(me.TestParseDownRasendeRegeneration)
  mod.testReporter.AddToTestQueue(me.TestParseVergiftungAufheben)
  mod.testReporter.AddToTestQueue(me.TestParseDownVergiftungAufheben)
  mod.testReporter.AddToTestQueue(me.TestParseAnregen)
  mod.testReporter.AddToTestQueue(me.TestParseDownAnregen)
  mod.testReporter.AddToTestQueue(me.TestParseSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchnelligkeitDerNatur)
  mod.testReporter.AddToTestQueue(me.TestParseFeenfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneWucherwurzeln)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistWucherwurzeln)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFeenfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFeenfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidDodgeHieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidParryHieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissHieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistHieb)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneWildeAttacke)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistWildeAttacke)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneWucherwurzeln)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistWucherwurzeln)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFeenfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFeenfeuer)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidDodgeHieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidParryHieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneHieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissHieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistHieb)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneWildeAttacke)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistWildeAttacke)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundBaumrinde()
  mod.testHelper.TestSound(
    className,
    "TestSoundBaumrinde",
    "baumrinde"
  )
end

function me.TestSoundDownBaumrinde()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBaumrinde",
    "baumrinde"
  )
end

function me.TestSoundGriffDerNatur()
  mod.testHelper.TestSound(
    className,
    "TestSoundGriffDerNatur",
    "griff_der_natur"
  )
end

function me.TestSoundDownGriffDerNatur()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGriffDerNatur",
    "griff_der_natur"
  )
end

function me.TestSoundHieb()
  mod.testHelper.TestSound(
    className,
    "TestSoundHieb",
    "hieb"
  )
end

function me.TestSoundWildeAttacke()
  mod.testHelper.TestSound(
    className,
    "TestSoundWildeAttacke",
    "wilde_attacke"
  )
end

function me.TestSoundRasendeRegeneration()
  mod.testHelper.TestSound(
    className,
    "TestSoundRasendeRegeneration",
    "rasende_regeneration"
  )
end

function me.TestSoundDownRasendeRegeneration()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRasendeRegeneration",
    "rasende_regeneration"
  )
end

function me.TestSoundVergiftungAufheben()
  mod.testHelper.TestSound(
    className,
    "TestSoundVergiftungAufheben",
    "vergiftung_aufheben"
  )
end

function me.TestSoundDownVergiftungAufheben()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownVergiftungAufheben",
    "vergiftung_aufheben"
  )
end

function me.TestSoundAnregen()
  mod.testHelper.TestSound(
    className,
    "TestSoundAnregen",
    "anregen"
  )
end

function me.TestSoundDownAnregen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownAnregen",
    "anregen"
  )
end

function me.TestSoundSchnelligkeitDerNatur()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchnelligkeitDerNatur",
    "schnelligkeit_der_natur"
  )
end

function me.TestSoundDownSchnelligkeitDerNatur()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchnelligkeitDerNatur",
    "schnelligkeit_der_natur"
  )
end

function me.TestSoundFeenfeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeenfeuer",
    "feenfeuer"
  )
end

function me.TestSoundEnemyAvoidWucherwurzeln()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidWucherwurzeln",
    "wucherwurzeln"
  )
end

function me.TestSoundEnemyAvoidFeenfeuer()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFeenfeuer",
    "feenfeuer"
  )
end

function me.TestSoundEnemyAvoidHieb()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidHieb",
    "hieb"
  )
end

function me.TestSoundEnemyAvoidWildeAttacke()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidWildeAttacke",
    "wilde_attacke"
  )
end

function me.TestSoundSelfAvoidWucherwurzeln()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidWucherwurzeln",
    "wucherwurzeln"
  )
end

function me.TestSoundSelfAvoidFeenfeuer()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFeenfeuer",
    "feenfeuer"
  )
end

function me.TestSoundSelfAvoidHieb()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidHieb",
    "hieb"
  )
end

function me.TestSoundSelfAvoidWildeAttacke()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidWildeAttacke",
    "wilde_attacke"
  )
end

function me.TestParseBaumrinde()
  mod.testHelper.TestParse(
    className,
    "TestParseBaumrinde",
    "baumrinde",
    "$player$ bekommt Baumrinde.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBaumrinde()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBaumrinde",
    "baumrinde",
    "Baumrinde schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGriffDerNatur()
  mod.testHelper.TestParse(
    className,
    "TestParseGriffDerNatur",
    "griff_der_natur",
    "$player$ bekommt Griff der Natur.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGriffDerNatur()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGriffDerNatur",
    "griff_der_natur",
    "Griff der Natur schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHieb()
  mod.testHelper.TestParse(
    className,
    "TestParseHieb",
    "hieb",
    "Ihr seid von Hieb betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseWildeAttacke()
  mod.testHelper.TestParse(
    className,
    "TestParseWildeAttacke",
    "wilde_attacke",
    "Ihr seid von Wilde Attacke betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseRasendeRegeneration()
  mod.testHelper.TestParse(
    className,
    "TestParseRasendeRegeneration",
    "rasende_regeneration",
    "$player$ bekommt Rasende Regeneration.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRasendeRegeneration()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRasendeRegeneration",
    "rasende_regeneration",
    "Rasende Regeneration schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVergiftungAufheben()
  mod.testHelper.TestParse(
    className,
    "TestParseVergiftungAufheben",
    "vergiftung_aufheben",
    "$player$ bekommt Vergiftung aufheben.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownVergiftungAufheben()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownVergiftungAufheben",
    "vergiftung_aufheben",
    "Vergiftgung Aufheben schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseAnregen()
  mod.testHelper.TestParse(
    className,
    "TestParseAnregen",
    "anregen",
    "$player$ bekommt Anregen.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownAnregen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownAnregen",
    "anregen",
    "Anregen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchnelligkeitDerNatur()
  mod.testHelper.TestParse(
    className,
    "TestParseSchnelligkeitDerNatur",
    "schnelligkeit_der_natur",
    "$player$ bekommt Schnelligkeit der Natur.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchnelligkeitDerNatur()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchnelligkeitDerNatur",
    "schnelligkeit_der_natur",
    "Schnelligkeit der Natur schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFeenfeuer()
  mod.testHelper.TestParse(
    className,
    "TestParseFeenfeuer",
    "feenfeuer",
    "Ihr seid von Feenfeuer betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneWucherwurzeln()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneWucherwurzeln",
    "wucherwurzeln",
    "Wucherwurzeln war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistWucherwurzeln()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistWucherwurzeln",
    "wucherwurzeln",
    "Ihr habt es mit Wucherwurzeln versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFeenfeuer()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFeenfeuer",
    "feenfeuer",
    "Feenfeuer war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFeenfeuer()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFeenfeuer",
    "feenfeuer",
    "Ihr habt es mit Feenfeuer versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidDodgeHieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidDodgeHieb",
    "hieb",
    "$player$ ist Hieb ausgewichen.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseEnemyAvoidParryHieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidParryHieb",
    "hieb",
    "Hieb wurde von $player$ pariert.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseEnemyAvoidImmuneHieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneHieb",
    "hieb",
    "Hieb war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissHieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissHieb",
    "hieb",
    "Hieb hat $player$ verfehlt.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidResistHieb()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistHieb",
    "bash",
    "Ihr habt es mit Hieb versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneWildeAttacke()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneWildeAttacke",
    "wilde_attacke",
    "Wilde Attacke war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistWildeAttacke()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistWildeAttacke",
    "wilde_attacke",
    "Ihr habt es mit Wilde Attacke versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneWucherwurzeln()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneWucherwurzeln",
    "wucherwurzeln",
    "$player$ versucht es mit Wucherwurzeln... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistWucherwurzeln()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistWucherwurzeln",
    "wucherwurzeln",
    "$player$ versucht es mit Wucherwurzeln... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFeenfeuer()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFeenfeuer",
    "feenfeuer",
    "$player$ versucht es mit Feenfeuer... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFeenfeuer()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFeenfeuer",
    "feenfeuer",
    "$player$ versucht es mit Feenfeuer... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidDodgeHieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidDodgeHieb",
    "hieb",
    "$player$s Hieb wurde ausgewichen.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.DODGE
  )
end

function me.TestParseSelfAvoidParryHieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidParryHieb",
    "hieb",
    "Hieb von $player$ wurde pariert.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.PARRY
  )
end

function me.TestParseSelfAvoidImmuneHieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneHieb",
    "hieb",
    "$player$ versucht es mit Hieb... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissHieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissHieb",
    "hieb",
    "$player$ greift an (mit Hieb) und verfehlt euch.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidResistHieb()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistHieb",
    "hieb",
    "$player$ versucht es mit Hieb... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneWildeAttacke()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneWildeAttacke",
    "wilde_attacke",
    "$player$ versucht es mit Wilde Attacke... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistWildeAttacke()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistWildeAttacke",
    "wilde_attacke",
    "$player$ versucht es mit Wilde Attacke... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
