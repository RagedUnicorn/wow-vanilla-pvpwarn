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
mod.testShamanEn = me

me.tag = "TestShamanEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[5]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SHAMAN_EN__Test()
  mod.testReporter.StartTestRun("global_shaman_en_all")
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

function _G.__PVPW__TEST_SHAMAN_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_shaman_en_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_shaman_en_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_shaman_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_shaman_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_shaman_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_shaman_en_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_shaman_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_shaman_en_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_SHAMAN_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_shaman_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElementalMastery)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElementalMastery)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTremorTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoisonCleansingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGroundingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGraceOfAirTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthbindTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDiseaseCleansingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaTideTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTranquilAirTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseElementalMastery)
  mod.testReporter.AddToTestQueue(me.TestParseDownElementalMastery)
  mod.testReporter.AddToTestQueue(me.TestParseNaturesSwiftness)
  mod.testReporter.AddToTestQueue(me.TestParseDownNaturesSwiftness)
  mod.testReporter.AddToTestQueue(me.TestParseTremorTotem)
  mod.testReporter.AddToTestQueue(me.TestParsePoisonCleansingTotem)
  mod.testReporter.AddToTestQueue(me.TestParseGroundingTotem)
  mod.testReporter.AddToTestQueue(me.TestParseFireResistanceTotem)
  mod.testReporter.AddToTestQueue(me.TestParseFlametongueTotem)
  mod.testReporter.AddToTestQueue(me.TestParseGraceOfAirTotem)
  mod.testReporter.AddToTestQueue(me.TestParseNatureResistanceTotem)
  mod.testReporter.AddToTestQueue(me.TestParseStoneskinTotem)
  mod.testReporter.AddToTestQueue(me.TestParseStrengthOfEarthTotem)
  mod.testReporter.AddToTestQueue(me.TestParseWindfuryTotem)
  mod.testReporter.AddToTestQueue(me.TestParseWindwallTotem)
  mod.testReporter.AddToTestQueue(me.TestParseEarthbindTotem)
  mod.testReporter.AddToTestQueue(me.TestParseFireNovaTotem)
  mod.testReporter.AddToTestQueue(me.TestParseMagmaTotem)
  mod.testReporter.AddToTestQueue(me.TestParseSearingTotem)
  mod.testReporter.AddToTestQueue(me.TestParseStoneclawTotem)
  mod.testReporter.AddToTestQueue(me.TestParseFrostResistanceTotem)
  mod.testReporter.AddToTestQueue(me.TestParseHealingStreamTotem)
  mod.testReporter.AddToTestQueue(me.TestParseDiseaseCleansingTotem)
  mod.testReporter.AddToTestQueue(me.TestParseManaSpringTotem)
  mod.testReporter.AddToTestQueue(me.TestParseManaTideTotem)
  mod.testReporter.AddToTestQueue(me.TestParseTranquilAirTotem)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneEarthShock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistEarthShock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFlameShock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFlameShock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFrostShock)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFrostShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneEarthShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistEarthShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFlameShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFlameShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFrostShock)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFrostShock)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundElementalMastery()
  mod.testHelper.TestSound(
    className,
    "TestSoundElementalMastery",
    "elemental_mastery"
  )
end

function me.TestSoundDownElementalMastery()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownElementalMastery",
    "elemental_mastery"
  )
end

function me.TestSoundNaturesSwiftness()
  mod.testHelper.TestSound(
    className,
    "TestSoundNaturesSwiftness",
    "natures_swiftness"
  )
end

function me.TestSoundDownNaturesSwiftness()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownNaturesSwiftness",
    "natures_swiftness"
  )
end

function me.TestSoundTremorTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundTremorTotem",
    "tremor_totem"
  )
end

function me.TestSoundPoisonCleansingTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundPoisonCleansingTotem",
    "poison_cleansing_totem"
  )
end

function me.TestSoundGroundingTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundGroundingTotem",
    "grounding_totem"
  )
end

function me.TestSoundFireResistanceTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireResistanceTotem",
    "fire_resistance_totem"
  )
end

function me.TestSoundFlametongueTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundFlametongueTotem",
    "flametongue_totem"
  )
end

function me.TestSoundGraceOfAirTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundGraceOfAirTotem",
    "grace_of_air_totem"
  )
end

function me.TestSoundNatureResistanceTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundNatureResistanceTotem",
    "nature_resistance_totem"
  )
end

function me.TestSoundStoneskinTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundStoneskinTotem",
    "stoneskin_totem"
  )
end

function me.TestSoundStrengthOfEarthTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundStrengthOfEarthTotem",
    "strength_of_earth_totem"
  )
end

function me.TestSoundWindfuryTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundWindfuryTotem",
    "windfury_totem"
  )
end

function me.TestSoundWindwallTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundWindwallTotem",
    "windwall_totem"
  )
end

function me.TestSoundEarthbindTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundEarthbindTotem",
    "earthbind_totem"
  )
end

function me.TestSoundFireNovaTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireNovaTotem",
    "fire_nova_totem"
  )
end

function me.TestSoundMagmaTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundMagmaTotem",
    "magma_totem"
  )
end

function me.TestSoundSearingTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundSearingTotem",
    "searing_totem"
  )
end

function me.TestSoundStoneclawTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundStoneclawTotem",
    "stoneclaw_totem"
  )
end

function me.TestSoundFrostResistanceTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostResistanceTotem",
    "frost_resistance_totem"
  )
end

function me.TestSoundHealingStreamTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundHealingStreamTotem",
    "healing_stream_totem"
  )
end

function me.TestSoundDiseaseCleansingTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundDiseaseCleansingTotem",
    "disease_cleansing_totem"
  )
end

function me.TestSoundManaSpringTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundManaSpringTotem",
    "mana_spring_totem"
  )
end

function me.TestSoundManaTideTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundManaTideTotem",
    "mana_tide_totem"
  )
end

function me.TestSoundTranquilAirTotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundTranquilAirTotem",
    "tranquil_air_totem"
  )
end

function me.TestSoundEnemyAvoidEarthShock()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidEarthShock",
    "earth_shock"
  )
end

function me.TestSoundEnemyAvoidFlameShock()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFlameShock",
    "flame_shock"
  )
end

function me.TestSoundEnemyAvoidFrostShock()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFrostShock",
    "frost_shock"
  )
end

function me.TestSoundSelfAvoidEarthShock()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidEarthShock",
    "earth_shock"
  )
end

function me.TestSoundSelfAvoidFlameShock()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFlameShock",
    "flame_shock"
  )
end

function me.TestSoundSelfAvoidFrostShock()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFrostShock",
    "frost_shock"
  )
end

function me.TestParseElementalMastery()
  mod.testHelper.TestParse(
    className,
    "TestParseElementalMastery",
    "elemental_mastery",
    "$player$ gains Elemental Mastery.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownElementalMastery()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownElementalMastery",
    "elemental_mastery",
    "Elemental Mastery fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNaturesSwiftness()
  mod.testHelper.TestParse(
    className,
    "TestParseNaturesSwiftness",
    "natures_swiftness",
    "$player$ gains Nature's Swiftness.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownNaturesSwiftness()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownNaturesSwiftness",
    "natures_swiftness",
    "Nature's Swiftness fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTremorTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseTremorTotem",
    "tremor_totem",
    "$player$ casts Tremor Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParsePoisonCleansingTotem()
  mod.testHelper.TestParse(
    className,
    "TestParsePoisonCleansingTotem",
    "poison_cleansing_totem",
    "$player$ casts Poison Cleansing Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGroundingTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseGroundingTotem",
    "grounding_totem",
    "$player$ casts Grounding Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFireResistanceTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseFireResistanceTotem",
    "fire_resistance_totem",
    "$player$ casts Fire Resistance Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFlametongueTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseFlametongueTotem",
    "flametongue_totem",
    "$player$ casts Flametongue Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGraceOfAirTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseGraceOfAirTotem",
    "grace_of_air_totem",
    "$player$ casts Grace of Air Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseNatureResistanceTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseNatureResistanceTotem",
    "nature_resistance_totem",
    "$player$ casts Nature Resistance Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseStoneskinTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseStoneskinTotem",
    "stoneskin_totem",
    "$player$ casts Stoneskin Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseStrengthOfEarthTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseStrengthOfEarthTotem",
    "strength_of_earth_totem",
    "$player$ casts Strength of Earth Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseWindfuryTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseWindfuryTotem",
    "windfury_totem",
    "$player$ casts Windfury Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseWindwallTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseWindwallTotem",
    "windwall_totem",
    "$player$ casts Windwall Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseEarthbindTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseEarthbindTotem",
    "earthbind_totem",
    "$player$ casts Earthbind Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFireNovaTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseFireNovaTotem",
    "fire_nova_totem",
    "$player$ casts Fire Nova Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseMagmaTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseMagmaTotem",
    "magma_totem",
    "$player$ casts Magma Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseSearingTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseSearingTotem",
    "searing_totem",
    "$player$ casts Searing Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseStoneclawTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseStoneclawTotem",
    "stoneclaw_totem",
    "$player$ casts Stoneclaw Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFrostResistanceTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostResistanceTotem",
    "frost_resistance_totem",
    "$player$ casts Frost Resistance Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseHealingStreamTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseHealingStreamTotem",
    "healing_stream_totem",
    "$player$ casts Healing Stream Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseDiseaseCleansingTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseDiseaseCleansingTotem",
    "disease_cleansing_totem",
    "$player$ casts Disease Cleansing Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseManaSpringTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseManaSpringTotem",
    "mana_spring_totem",
    "$player$ casts Mana Spring Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseManaTideTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseManaTideTotem",
    "mana_tide_totem",
    "$player$ casts Mana Tide Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseTranquilAirTotem()
  mod.testHelper.TestParse(
    className,
    "TestParseTranquilAirTotem",
    "tranquil_air_totem",
    "$player$ casts Tranquil Air Totem.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseEnemyAvoidImmuneEarthShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneEarthShock",
    "earth_shock",
    "Your Earth Shock failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistEarthShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistEarthShock",
    "earth_shock",
    "Your Earth Shock was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFlameShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFlameShock",
    "flame_shock",
    "Your Flame Shock failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFlameShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFlameShock",
    "flame_shock",
    "Your Flame Shock was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFrostShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFrostShock",
    "frost_shock",
    "Your Frost Shock failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFrostShock()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFrostShock",
    "frost_shock",
    "Your Frost Shock was resisted by $player$.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneEarthShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneEarthShock",
    "earth_shock",
    "$player$'s Earth Shock failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistEarthShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistEarthShock",
    "earth_shock",
    "$player$'s Earth Shock was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFlameShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFlameShock",
    "flame_shock",
    "$player$'s Flame Shock failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFlameShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFlameShock",
    "flame_shock",
    "$player$'s Flame Shock was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFrostShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFrostShock",
    "frost_shock",
    "$player$'s Frost Shock failed. You are immune.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFrostShock()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFrostShock",
    "frost_shock",
    "$player$'s Frost Shock was resisted.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
