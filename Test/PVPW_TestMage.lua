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
mod.testMage = me

me.tag = "TestMage"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[6]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_MAGE__Test()
  mod.testReporter.StartTestRun("global_mage_all")
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

function _G.__PVPW__TEST_MAGE__Test_Sound()
  mod.testReporter.StartTestRun("global_mage_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_mage_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_mage_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_mage_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Parse()
  mod.testReporter.StartTestRun("global_mage_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_mage_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_mage_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_mage_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_MAGE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_mage_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorphCow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorphPig)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorphTurtle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCounterspellSilenced)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcanePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArcanePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvocation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPresenceOfMind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPresenceOfMind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCombustion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCombustion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCounterspellSilenced)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCounterspell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorphCow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorphPig)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorphTurtle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostNova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCounterspellSilenced)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCounterspell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorphCow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorphPig)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorphTurtle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseIceBlock)
  mod.testReporter.AddToTestQueue(me.TestParseDownIceBlock)
  mod.testReporter.AddToTestQueue(me.TestParsePolymorph)
  mod.testReporter.AddToTestQueue(me.TestParsePolymorphCow)
  mod.testReporter.AddToTestQueue(me.TestParsePolymorphPig)
  mod.testReporter.AddToTestQueue(me.TestParsePolymorphTurtle)
  mod.testReporter.AddToTestQueue(me.TestParseBlink)
  mod.testReporter.AddToTestQueue(me.TestParseFireWard)
  mod.testReporter.AddToTestQueue(me.TestParseDownFireWard)
  mod.testReporter.AddToTestQueue(me.TestParseFrostWard)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostWard)
  mod.testReporter.AddToTestQueue(me.TestParseCounterspellSilenced)
  mod.testReporter.AddToTestQueue(me.TestParseManaShield)
  mod.testReporter.AddToTestQueue(me.TestParseDownManaShield)
  mod.testReporter.AddToTestQueue(me.TestParseIceBarrier)
  mod.testReporter.AddToTestQueue(me.TestParseDownIceBarrier)
  mod.testReporter.AddToTestQueue(me.TestParseFrostNova)
  mod.testReporter.AddToTestQueue(me.TestParseArcanePower)
  mod.testReporter.AddToTestQueue(me.TestParseDownArcanePower)
  mod.testReporter.AddToTestQueue(me.TestParseEvocation)
  mod.testReporter.AddToTestQueue(me.TestParsePresenceOfMind)
  mod.testReporter.AddToTestQueue(me.TestParseDownPresenceOfMind)
  mod.testReporter.AddToTestQueue(me.TestParseCombustion)
  mod.testReporter.AddToTestQueue(me.TestParseDownCombustion)
  mod.testReporter.AddToTestQueue(me.TestParseBlastWave)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistCounterspellSilenced)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneCounterspell)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePolymorph)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPolymorph)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePolymorphCow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPolymorphCow)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePolymorphPig)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPolymorphPig)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePolymorphTurtle)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPolymorphTurtle)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneConeOfCold)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistConeOfCold)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFrostNova)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFrostNova)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistCounterspellSilenced)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneCounterspell)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePolymorph)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPolymorph)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePolymorphCow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPolymorphCow)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePolymorphPig)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPolymorphPig)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePolymorphTurtle)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPolymorphTurtle)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneConeOfCold)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistConeOfCold)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFrostNova)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFrostNova)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundIceBlock()
  mod.testHelper.TestSound(
    className,
    "TestSoundIceBlock",
    "ice_block"
  )
end

function me.TestSoundDownIceBlock()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownIceBlock",
    "ice_block"
  )
end

function me.TestSoundPolymorph()
  mod.testHelper.TestSound(
    className,
    "TestSoundPolymorph",
    "polymorph"
  )
end

function me.TestSoundPolymorphCow()
  mod.testHelper.TestSound(
    className,
    "TestSoundPolymorphCow",
    "polymorph_cow"
  )
end

function me.TestSoundPolymorphPig()
  mod.testHelper.TestSound(
    className,
    "TestSoundPolymorphPig",
    "polymorph_pig"
  )
end

function me.TestSoundPolymorphTurtle()
  mod.testHelper.TestSound(
    className,
    "TestSoundPolymorphTurtle",
    "polymorph_turtle"
  )
end

function me.TestSoundBlink()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlink",
    "blink"
  )
end

function me.TestSoundFireWard()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireWard",
    "fire_ward"
  )
end

function me.TestSoundDownFireWard()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFireWard",
    "fire_ward"
  )
end

function me.TestSoundFrostWard()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostWard",
    "frost_ward"
  )
end

function me.TestSoundDownFrostWard()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostWard",
    "frost_ward"
  )
end

function me.TestSoundCounterspellSilenced()
  mod.testHelper.TestSound(
    className,
    "TestSoundCounterspellSilenced",
    "counterspell_silenced"
  )
end

function me.TestSoundManaShield()
  mod.testHelper.TestSound(
    className,
    "TestSoundManaShield",
    "mana_shield"
  )
end

function me.TestSoundDownManaShield()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownManaShield",
    "mana_shield"
  )
end

function me.TestSoundIceBarrier()
  mod.testHelper.TestSound(
    className,
    "TestSoundIceBarrier",
    "ice_barrier"
  )
end

function me.TestSoundDownIceBarrier()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownIceBarrier",
    "ice_barrier"
  )
end

function me.TestSoundFrostNova()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostNova",
    "frost_nova"
  )
end

function me.TestSoundArcanePower()
  mod.testHelper.TestSound(
    className,
    "TestSoundArcanePower",
    "arcane_power"
  )
end

function me.TestSoundDownArcanePower()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownArcanePower",
    "arcane_power"
  )
end

function me.TestSoundEvocation()
  mod.testHelper.TestSound(
    className,
    "TestSoundEvocation",
    "evocation"
  )
end

function me.TestSoundPresenceOfMind()
  mod.testHelper.TestSound(
    className,
    "TestSoundPresenceOfMind",
    "presence_of_mind"
  )
end

function me.TestSoundDownPresenceOfMind()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownPresenceOfMind",
    "presence_of_mind"
  )
end

function me.TestSoundCombustion()
  mod.testHelper.TestSound(
    className,
    "TestSoundCombustion",
    "combustion"
  )
end

function me.TestSoundDownCombustion()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownCombustion",
    "combustion"
  )
end

function me.TestSoundBlastWave()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlastWave",
    "blast_wave"
  )
end

function me.TestSoundEnemyAvoidCounterspellSilenced()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidCounterspellSilenced",
    "counterspell_silenced"
  )
end

function me.TestSoundEnemyAvoidCounterspell()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidCounterspell",
    "counterspell"
  )
end

function me.TestSoundEnemyAvoidPolymorph()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPolymorph",
    "polymorph"
  )
end

function me.TestSoundEnemyAvoidPolymorphCow()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPolymorphCow",
    "polymorph_cow"
  )
end

function me.TestSoundEnemyAvoidPolymorphPig()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPolymorphPig",
    "polymorph_pig"
  )
end

function me.TestSoundEnemyAvoidPolymorphTurtle()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPolymorphTurtle",
    "polymorph_turtle"
  )
end

function me.TestSoundEnemyAvoidConeOfCold()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidConeOfCold",
    "cone_of_cold"
  )
end

function me.TestSoundEnemyAvoidFrostNova()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFrostNova",
    "frost_nova"
  )
end

function me.TestSoundSelfAvoidCounterspellSilenced()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidCounterspellSilenced",
    "counterspell_silenced"
  )
end

function me.TestSoundSelfAvoidCounterspell()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidCounterspell",
    "counterspell"
  )
end

function me.TestSoundSelfAvoidPolymorph()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPolymorph",
    "polymorph"
  )
end

function me.TestSoundSelfAvoidPolymorphCow()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPolymorphCow",
    "polymorph_cow"
  )
end

function me.TestSoundSelfAvoidPolymorphPig()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPolymorphPig",
    "polymorph_pig"
  )
end

function me.TestSoundSelfAvoidPolymorphTurtle()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPolymorphTurtle",
    "polymorph_turtle"
  )
end

function me.TestSoundSelfAvoidConeOfCold()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidConeOfCold",
    "cone_of_cold"
  )
end

function me.TestSoundSelfAvoidFrostNova()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFrostNova",
    "frost_nova"
  )
end

function me.TestParseIceBlock()
  mod.testHelper.TestParse(
    className,
    "TestParseIceBlock",
    "ice_block",
    "$player$ gains Ice Block.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownIceBlock()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownIceBlock",
    "ice_block",
    "Ice Block fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParsePolymorph()
  mod.testHelper.TestParse(
    className,
    "TestParsePolymorph",
    "polymorph",
    "You are afflicted by Polymorph.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParsePolymorphPig()
  mod.testHelper.TestParse(
    className,
    "TestParsePolymorphPig",
    "polymorph_pig",
    "You are afflicted by Polymorph: Pig.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParsePolymorphCow()
  mod.testHelper.TestParse(
    className,
    "TestParsePolymorphCow",
    "polymorph_cow",
    "You are afflicted by Polymorph: Cow.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParsePolymorphTurtle()
  mod.testHelper.TestParse(
    className,
    "TestParsePolymorphTurtle",
    "polymorph_turtle",
    "You are afflicted by Polymorph: Turtle.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBlink()
  mod.testHelper.TestParse(
    className,
    "TestParseBlink",
    "blink",
    "$player$ gains Blink.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseFireWard()
  mod.testHelper.TestParse(
    className,
    "TestParseFireWard",
    "fire_ward",
    "$player$ gains Fire Ward.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFireWard()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFireWard",
    "fire_ward",
    "Fire Ward fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostWard()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostWard",
    "frost_ward",
    "$player$ gains Frost Ward.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostWard()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostWard",
    "frost_ward",
    "Frost Ward fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseCounterspellSilenced()
  mod.testHelper.TestParse(
    className,
    "TestParseCounterspellSilenced",
    "counterspell_silenced",
    "You are afflicted by Counterspell - Silenced.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseManaShield()
  mod.testHelper.TestParse(
    className,
    "TestParseManaShield",
    "mana_shield",
    "$player$ gains Mana Shield.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownManaShield()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownManaShield",
    "mana_shield",
    "Mana Shield fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseIceBarrier()
  mod.testHelper.TestParse(
    className,
    "TestParseIceBarrier",
    "ice_barrier",
    "$player$ gains Ice Barrier.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownIceBarrier()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownIceBarrier",
    "ice_barrier",
    "Ice Barrier fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostNova()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostNova",
    "frost_nova",
    "You are afflicted by Frost Nova.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseArcanePower()
  mod.testHelper.TestParse(
    className,
    "TestParseArcanePower",
    "arcane_power",
    "$player$ gains Arcane Power.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownArcanePower()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownArcanePower",
    "arcane_power",
    "Arcane Power fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEvocation()
  mod.testHelper.TestParse(
    className,
    "TestParseEvocation",
    "evocation",
    "$player$ gains Evocation.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParsePresenceOfMind()
  mod.testHelper.TestParse(
    className,
    "TestParsePresenceOfMind",
    "presence_of_mind",
    "$player$ gains Presence of Mind.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownPresenceOfMind()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownPresenceOfMind",
    "presence_of_mind",
    "Presence of Mind fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseCombustion()
  mod.testHelper.TestParse(
    className,
    "TestParseCombustion",
    "combustion",
    "$player$ gains Combustion.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownCombustion()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownCombustion",
    "combustion",
    "Combustion fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBlastWave()
  mod.testHelper.TestParse(
    className,
    "TestParseBlastWave",
    "blast_wave",
    "You are afflicted by Blast Wave.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidResistCounterspellSilenced()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistCounterspellSilenced",
    "counterspell_silenced",
    "Your Counterspell - Silenced was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneCounterspell()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneCounterspell",
    "counterspell",
    "Your Counterspell failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmunePolymorph()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePolymorph",
    "polymorph",
    "Your Polymorph failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPolymorph()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPolymorph",
    "polymorph",
    "Your Polymorph was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmunePolymorphCow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePolymorphCow",
    "polymorph_cow",
    "Your Polymorph: Cow failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPolymorphCow()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPolymorphCow",
    "polymorph_cow",
    "Your Polymorph: Cow was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmunePolymorphPig()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePolymorphPig",
    "polymorph_pig",
    "Your Polymorph: Pig failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPolymorphPig()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPolymorphPig",
    "polymorph_pig",
    "Your Polymorph: Pig was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmunePolymorphTurtle()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePolymorphTurtle",
    "polymorph_turtle",
    "Your Polymorph: Turtle failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPolymorphTurtle()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPolymorphTurtle",
    "polymorph_turtle",
    "Your Polymorph: Turtle was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneConeOfCold()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneConeOfCold",
    "cone_of_cold",
    "Your Cone Of Cold failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistConeOfCold()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistConeOfCold",
    "cone_of_cold",
    "Your Cone Of Cold was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFrostNova()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFrostNova",
    "frost_nova",
    "Your Frost Nova failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFrostNova()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFrostNova",
    "frost_nova",
    "Your Frost Nova was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidResistCounterspellSilenced()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistCounterspellSilenced",
    "counterspell_silenced",
    "$player$'s Counterspell was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneCounterspell()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneCounterspell",
    "counterspell",
    "$player$'s Counterspell failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmunePolymorph()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePolymorph",
    "polymorph",
    "$player$'s Polymorph failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPolymorph()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPolymorph",
    "polymorph_cow",
    "$player$'s Polymorph was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmunePolymorphCow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePolymorphCow",
    "polymorph_cow",
    "$player$'s Polymorph: Cow failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPolymorphCow()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPolymorphCow",
    "polymorph_cow",
    "$player$'s Polymorph: Cow was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmunePolymorphPig()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePolymorphPig",
    "polymorph_pig",
    "$player$'s Polymorph: Pig failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPolymorphPig()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPolymorphPig",
    "polymorph_pig",
    "$player$'s Polymorph: Pig was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmunePolymorphTurtle()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePolymorphTurtle",
    "polymorph_turtle",
    "$player$'s Polymorph: Turtle failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPolymorphTurtle()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPolymorphTurtle",
    "polymorph_turtle",
    "$player$'s Polymorph: Turtle was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneConeOfCold()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneConeOfCold",
    "cone_of_cold",
    "$player$'s Cone Of Cold failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistConeOfCold()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistConeOfCold",
    "cone_of_cold",
    "$player$'s Cone Of Cold was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFrostNova()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFrostNova",
    "frost_nova",
    "$player$'s Frost Nova failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFrostNova()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFrostNova",
    "frost_nova",
    "$player$'s Frost Nova was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
