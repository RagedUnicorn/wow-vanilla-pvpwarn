--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
mod.testPaladinEn = me

me.tag = "TestPaladinEn"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[2]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PALADIN_EN__Test()
  mod.testReporter.StartTestRun("global_paladin_en_all")
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

function _G.__PVPW__TEST_PALADIN_EN__Test_Sound()
  mod.testReporter.StartTestRun("global_paladin_en_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_paladin_en_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Sound_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_paladin_en_sound_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Sound_Self_Avoid()
  mod.testReporter.StartTestRun("global_paladin_en_sound_self_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASelfAvoidSoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Parse()
  mod.testReporter.StartTestRun("global_paladin_en_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_paladin_en_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_paladin_en_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_paladin_en_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PALADIN_EN__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_paladin_en_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDevotionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRetributionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcentrationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownConcentrationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRepentance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLayOnHands)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineFavor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineFavor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHammerOfWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHammerOfJustice)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  -- test combat log messages
  mod.testReporter.AddToTestQueue(me.TestParseDevotionAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownDevotionAura)
  mod.testReporter.AddToTestQueue(me.TestParseRetributionAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownRetributionAura)
  mod.testReporter.AddToTestQueue(me.TestParseConcentrationAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownConcentrationAura)
  mod.testReporter.AddToTestQueue(me.TestParseShadowResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownShadowResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseFrostResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseFireResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseDownFireResistanceAura)
  mod.testReporter.AddToTestQueue(me.TestParseHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfProtection)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfFreedom)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfFreedom)
  mod.testReporter.AddToTestQueue(me.TestParseBlessingOfSacrifice)
  mod.testReporter.AddToTestQueue(me.TestParseDownBlessingOfSacrifice)
  mod.testReporter.AddToTestQueue(me.TestParseHammerOfJustice)
  mod.testReporter.AddToTestQueue(me.TestParseRepentance)
  mod.testReporter.AddToTestQueue(me.TestParseLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseCritLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseDownLayOnHands)
  mod.testReporter.AddToTestQueue(me.TestParseDivineShield)
  mod.testReporter.AddToTestQueue(me.TestParseDownDivineShield)
  mod.testReporter.AddToTestQueue(me.TestParseDivineFavor)
  mod.testReporter.AddToTestQueue(me.TestParseDownDivineFavor)
  mod.testReporter.AddToTestQueue(me.TestParseForbearance)
  mod.testReporter.AddToTestQueue(me.TestParseDownForbearance)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidMissHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneHammerOfJustice)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidMissHammerOfWrath)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneHammerOfJustice)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundDevotionAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundDevotionAura",
    "devotion_aura"
  )
end

function me.TestSoundDownDevotionAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownDevotionAura",
    "devotion_aura"
  )
end

function me.TestSoundRetributionAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundRetributionAura",
    "retribution_aura"
  )
end

function me.TestSoundDownRetributionAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRetributionAura",
    "retribution_aura"
  )
end

function me.TestSoundConcentrationAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundConcentrationAura",
    "concentration_aura"
  )
end

function me.TestSoundDownConcentrationAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownConcentrationAura",
    "concentration_aura"
  )
end

function me.TestSoundShadowResistanceAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundShadowResistanceAura",
    "shadow_resistance_aura"
  )
end

function me.TestSoundDownShadowResistanceAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownShadowResistanceAura",
    "shadow_resistance_aura"
  )
end

function me.TestSoundFrostResistanceAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostResistanceAura",
    "frost_resistance_aura"
  )
end

function me.TestSoundDownFrostResistanceAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostResistanceAura",
    "frost_resistance_aura"
  )
end

function me.TestSoundFireResistanceAura()
  mod.testHelper.TestSound(
    className,
    "TestSoundFireResistanceAura",
    "fire_resistance_aura"
  )
end

function me.TestSoundDownFireResistanceAura()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFireResistanceAura",
    "fire_resistance_aura"
  )
end

function me.TestSoundHammerOfWrath()
  mod.testHelper.TestSound(
    className,
    "TestSoundHammerOfWrath",
    "hammer_of_wrath"
  )
end

function me.TestSoundBlessingOfProtection()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlessingOfProtection",
    "blessing_of_protection"
  )
end

function me.TestSoundDownBlessingOfProtection()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlessingOfProtection",
    "blessing_of_protection"
  )
end

function me.TestSoundBlessingOfFreedom()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlessingOfFreedom",
    "blessing_of_freedom"
  )
end

function me.TestSoundDownBlessingOfFreedom()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlessingOfFreedom",
    "blessing_of_freedom"
  )
end

function me.TestSoundBlessingOfSacrifice()
  mod.testHelper.TestSound(
    className,
    "TestSoundBlessingOfSacrifice",
    "blessing_of_sacrifice"
  )
end

function me.TestSoundDownBlessingOfSacrifice()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBlessingOfSacrifice",
    "blessing_of_sacrifice"
  )
end

function me.TestSoundHammerOfJustice()
  mod.testHelper.TestSound(
    className,
    "TestSoundHammerOfJustice",
    "hammer_of_justice"
  )
end

function me.TestSoundRepentance()
  mod.testHelper.TestSound(
    className,
    "TestSoundRepentance",
    "repentance"
  )
end

function me.TestSoundLayOnHands()
  mod.testHelper.TestSound(
    className,
    "TestSoundLayOnHands",
    "lay_on_hands"
  )
end

function me.TestSoundDownLayOnHands()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownLayOnHands",
    "lay_on_hands"
  )
end

function me.TestSoundDivineShield()
  mod.testHelper.TestSound(
    className,
    "TestSoundDivineShield",
    "divine_shield"
  )
end

function me.TestSoundDownDivineShield()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownDivineShield",
    "divine_shield"
  )
end

function me.TestSoundDivineFavor()
  mod.testHelper.TestSound(
    className,
    "TestSoundDivineFavor",
    "divine_favor"
  )
end

function me.TestSoundDownDivineFavor()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownDivineFavor",
    "divine_favor"
  )
end

function me.TestSoundForbearance()
  mod.testHelper.TestSound(
    className,
    "TestSoundForbearance",
    "forbearance"
  )
end

function me.TestSoundDownForbearance()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownForbearance",
    "forbearance"
  )
end

function me.TestSoundEnemyAvoidHammerOfWrath()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidHammerOfWrath",
    "hammer_of_wrath"
  )
end

function me.TestSoundEnemyAvoidHammerOfJustice()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidHammerOfJustice",
    "hammer_of_justice"
  )
end

function me.TestSoundSelfAvoidHammerOfWrath()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidHammerOfWrath",
    "hammer_of_wrath"
  )
end

function me.TestSoundSelfAvoidHammerOfJustice()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidHammerOfJustice",
    "hammer_of_justice"
  )
end

function me.TestParseDevotionAura()
  mod.testHelper.TestParse(
    className,
    "TestParseDevotionAura",
    "devotion_aura",
    "$player$ gains Devotion Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownDevotionAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownDevotionAura",
    "devotion_aura",
    "Devotion Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseRetributionAura()
  mod.testHelper.TestParse(
    className,
    "TestParseRetributionAura",
    "retribution_aura",
    "$player$ gains Retribution Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRetributionAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRetributionAura",
    "retribution_aura",
    "Retribution Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseConcentrationAura()
  mod.testHelper.TestParse(
    className,
    "TestParseConcentrationAura",
    "concentration_aura",
    "$player$ gains Concentration Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownConcentrationAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownConcentrationAura",
    "concentration_aura",
    "Concentration Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseShadowResistanceAura()
  mod.testHelper.TestParse(
    className,
    "TestParseShadowResistanceAura",
    "shadow_resistance_aura",
    "$player$ gains Shadow Resistance Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownShadowResistanceAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownShadowResistanceAura",
    "shadow_resistance_aura",
    "Shadow Resistance Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostResistanceAura()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostResistanceAura",
    "frost_resistance_aura",
    "$player$ gains Frost Resistance Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostResistanceAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostResistanceAura",
    "frost_resistance_aura",
    "Frost Resistance Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFireResistanceAura()
  mod.testHelper.TestParse(
    className,
    "TestParseFireResistanceAura",
    "fire_resistance_aura",
    "$player$ gains Fire Resistance Aura.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFireResistanceAura()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFireResistanceAura",
    "fire_resistance_aura",
    "Fire Resistance Aura fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHammerOfWrath()
  mod.testHelper.TestParse(
    className,
    "TestParseHammerOfWrath",
    "hammer_of_wrath",
    "$player$ begins to cast Hammer of Wrath.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseBlessingOfProtection()
  mod.testHelper.TestParse(
    className,
    "TestParseBlessingOfProtection",
    "blessing_of_protection",
    "$player$ gains Blessing of Protection.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBlessingOfProtection()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBlessingOfProtection",
    "blessing_of_protection",
    "Blessing of Protection fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBlessingOfFreedom()
  mod.testHelper.TestParse(
    className,
    "TestParseBlessingOfFreedom",
    "blessing_of_freedom",
    "$player$ gains Blessing of Freedom.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBlessingOfFreedom()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBlessingOfFreedom",
    "blessing_of_freedom",
    "Blessing of Freedom fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseBlessingOfSacrifice()
  mod.testHelper.TestParse(
    className,
    "TestParseBlessingOfSacrifice",
    "blessing_of_sacrifice",
    "$player$ gains Blessing of Sacrifice.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBlessingOfSacrifice()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBlessingOfSacrifice",
    "blessing_of_sacrifice",
    "Blessing of Sacrifice fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseHammerOfJustice()
  mod.testHelper.TestParse(
    className,
    "TestParseHammerOfJustice",
    "hammer_of_justice",
    "You are afflicted by Hammer of Justice.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseRepentance()
  mod.testHelper.TestParse(
    className,
    "TestParseRepentance",
    "repentance",
    "You are afflicted by Repentance.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseLayOnHands()
  mod.testHelper.TestParse(
    className,
    "TestParseLayOnHands",
    "lay_on_hands",
    "$player$'s Lay ond Hands heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCritLayOnHands()
  mod.testHelper.TestParse(
    className,
    "TestParseCritLayOnHands",
    "lay_on_hands",
    "$player$'s Lay ond Hands critically heals $player$ for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseDownLayOnHands()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownLayOnHands",
    "lay_on_hands",
    "Lay on Hands fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDivineShield()
  mod.testHelper.TestParse(
    className,
    "TestParseDivineShield",
    "divine_shield",
    "$player$ gains Divine Shield.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownDivineShield()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownDivineShield",
    "divine_shield",
    "Divine Shield fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseDivineFavor()
  mod.testHelper.TestParse(
    className,
    "TestParseDivineFavor",
    "divine_favor",
    "$player$ gains Divine Favor.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownDivineFavor()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownDivineFavor",
    "divine_favor",
    "Divine Favor fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseForbearance()
  mod.testHelper.TestParse(
    className,
    "TestParseForbearance",
    "forbearance",
    "$player$ is afflicted by Forbearance.",
    mod.testHelper.eventTypeSpellPeriodicSpellHostilePlayerDamage
  )
end

function me.TestParseDownForbearance()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownForbearance",
    "forbearance",
    "Forbearance fades from $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEnemyAvoidImmuneHammerOfWrath()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneHammerOfWrath",
    "hammer_of_wrath",
    "Your Hammer of Wrath failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidMissHammerOfWrath()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidMissHammerOfWrath",
    "hammer_of_wrath",
    "Your Hammer of Wrath missed $player$.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseEnemyAvoidImmuneHammerOfJustice()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneHammerOfJustice",
    "hammer_of_justice",
    "Your Hammer of Justice failed. $player$ is immune.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneHammerOfWrath()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneHammerOfWrath",
    "hammer_of_wrath",
    "$player$'s Hammer of Wrath failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidMissHammerOfWrath()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidMissHammerOfWrath",
    "hammer_of_wrath",
    "$player$'s Hammer of Wrath misses you.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.MISS
  )
end

function me.TestParseSelfAvoidImmuneHammerOfJustice()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneHammerOfJustice",
    "hammer_of_justice",
    "$player$'s Hammer of Justice failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end
