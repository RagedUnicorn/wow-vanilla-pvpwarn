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
mod.testWarlockDe = me

me.tag = "TestWarlockDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[7]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_WARLOCK_DE__Test()
  mod.testReporter.StartTestRun("global_warlock_de_all")
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

function _G.__PVPW__TEST_WARLOCK_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_warlock_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_warlock_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_warlock_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_warlock_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_warlock_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_warlock_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_WARLOCK_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_warlock_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFurcht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTeufelsbeherschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTeufelsbeherschung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenbrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchreckensgeheul)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErheblicherZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownErheblicherZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGrosserZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGrosserZauberstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTodesmantel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchVerstaerken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFluchVerstaerken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchwacherGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGeringerGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGrosserGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErheblicherGesundheitsstein)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchDerErschoepfung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFluchDerSprachen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundZaubersperre)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeelenverbindung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeelenverbindung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerfuehrung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFluchDerSprachen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidTodesmantel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFurcht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchreckensgeheul)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchattenbrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFluchDerSprachen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidTodesmantel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFurcht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchreckensgeheul)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchattenbrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidZaubersperre)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerfuehrung)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseTeufelsbeherschung)
  mod.testReporter.AddToTestQueue(me.TestParseDownTeufelsbeherschung)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchattenzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseErheblicherZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownErheblicherZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseGrosserZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseDownGrosserZauberstein)
  mod.testReporter.AddToTestQueue(me.TestParseTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseFluchVerstaerken)
  mod.testReporter.AddToTestQueue(me.TestParseDownFluchVerstaerken)
  mod.testReporter.AddToTestQueue(me.TestParseSchwacherGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseGeringerGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseGrosserGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseErheblicherGesundheitsstein)
  mod.testReporter.AddToTestQueue(me.TestParseFluchDerErschoepfung)
  mod.testReporter.AddToTestQueue(me.TestParseFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeelensteinAuferstehung)
  mod.testReporter.AddToTestQueue(me.TestParseZaubersperre)
  mod.testReporter.AddToTestQueue(me.TestParseSeelenverbindung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeelenverbindung)
  mod.testReporter.AddToTestQueue(me.TestParseVerfuehrung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFluchDerSprachen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistTodesmantel)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistFurcht)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistSchreckensgeheul)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistSchattenbrand)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneZaubersperre)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistZaubersperre)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerfuehrung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerfuehrung)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundFurcht()
  mod.testHelper.TestSound(
    className,
    "TestSoundFurcht",
    "furcht"
  )
end

function me.TestSoundTeufelsbeherschung()
  mod.testHelper.TestSound(
    className,
    "TestSoundTeufelsbeherschung",
    "teufelsbeherschung"
  )
end

function me.TestSoundDownTeufelsbeherschung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTeufelsbeherschung",
    "teufelsbeherschung"
  )
end

function me.TestSoundSchattenbrand()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenbrand",
    "schattenbrand"
  )
end

function me.TestSoundSchattenzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenzauberschutz",
    "schattenzauberschutz"
  )
end

function me.TestSoundDownSchattenzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenzauberschutz",
    "schattenzauberschutz"
  )
end

function me.TestSoundSchreckensgeheul()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchreckensgeheul",
    "schreckensgeheul"
  )
end

function me.TestSoundZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundZauberstein",
    "zauberstein"
  )
end

function me.TestSoundDownZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownZauberstein",
    "zauberstein"
  )
end

function me.TestSoundErheblicherZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundErheblicherZauberstein",
    "erheblicher_zauberstein"
  )
end

function me.TestSoundDownErheblicherZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownErheblicherZauberstein",
    "erheblicher_zauberstein"
  )
end

function me.TestSoundGrosserZauberstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGrosserZauberstein",
    "grosser_zauberstein"
  )
end

function me.TestSoundDownGrosserZauberstein()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGrosserZauberstein",
    "grosser_zauberstein"
  )
end

function me.TestSoundTodesmantel()
  mod.testHelper.TestSound(
    className,
    "TestSoundTodesmantel",
    "todesmantel"
  )
end

function me.TestSoundFluchVerstaerken()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchVerstaerken",
    "fluch_verstaerken"
  )
end

function me.TestSoundDownFluchVerstaerken()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFluchVerstaerken",
    "fluch_verstaerken"
  )
end

function me.TestSoundSchwacherGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchwacherGesundheitsstein",
    "schwacher_gesundheitsstein"
  )
end

function me.TestSoundGeringerGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGeringerGesundheitsstein",
    "geringer_gesundheitsstein"
  )
end

function me.TestSoundGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGesundheitsstein",
    "gesundheitsstein"
  )
end

function me.TestSoundGrosserGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundGrosserGesundheitsstein",
    "grosser_gesundheitsstein"
  )
end

function me.TestSoundErheblicherGesundheitsstein()
  mod.testHelper.TestSound(
    className,
    "TestSoundErheblicherGesundheitsstein",
    "erheblicher_gesundheitsstein"
  )
end

function me.TestSoundFluchDerErschoepfung()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchDerErschoepfung",
    "fluch_der_erschoepfung"
  )
end

function me.TestSoundFluchDerSprachen()
  mod.testHelper.TestSound(
    className,
    "TestSoundFluchDerSprachen",
    "fluch_der_sprachen"
  )
end

function me.TestSoundSeelensteinAuferstehung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeelensteinAuferstehung",
    "seelenstein_auferstehung"
  )
end

function me.TestSoundDownSeelensteinAuferstehung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeelensteinAuferstehung",
    "seelenstein_auferstehung"
  )
end

function me.TestSoundZaubersperre()
  mod.testHelper.TestSound(
    className,
    "TestSoundZaubersperre",
    "zaubersperre"
  )
end

function me.TestSoundSeelenverbindung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeelenverbindung",
    "seelenverbindung"
  )
end

function me.TestSoundDownSeelenverbindung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeelenverbindung",
    "seelenverbindung"
  )
end

function me.TestSoundVerfuehrung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerfuehrung",
    "verfuehrung"
  )
end

function me.TestSoundEnemyAvoidFluchDerSprachen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFluchDerSprachen",
    "fluch_der_sprachen"
  )
end

function me.TestSoundEnemyAvoidTodesmantel()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidTodesmantel",
    "todesmantel"
  )
end

function me.TestSoundEnemyAvoidFurcht()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidFurcht",
    "furcht"
  )
end

function me.TestSoundEnemyAvoidSchreckensgeheul()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchreckensgeheul",
    "schreckensgeheul"
  )
end

function me.TestSoundEnemyAvoidSchattenbrand()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchattenbrand",
    "schattenbrand"
  )
end

function me.TestSoundSelfAvoidFluchDerSprachen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFluchDerSprachen",
    "fluch_der_sprachen"
  )
end

function me.TestSoundSelfAvoidTodesmantel()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidTodesmantel",
    "todesmantel"
  )
end

function me.TestSoundSelfAvoidFurcht()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidFurcht",
    "furcht"
  )
end

function me.TestSoundSelfAvoidSchreckensgeheul()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchreckensgeheul",
    "schreckensgeheul"
  )
end

function me.TestSoundSelfAvoidSchattenbrand()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchattenbrand",
    "schattenbrand"
  )
end

function me.TestSoundSelfAvoidZaubersperre()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidZaubersperre",
    "zaubersperre"
  )
end

function me.TestSoundSelfAvoidVerfuehrung()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerfuehrung",
    "verfuehrung"
  )
end

function me.TestParseFurcht()
  mod.testHelper.TestParse(
    className,
    "TestParseFurcht",
    "furcht",
    "Ihr seid von Furcht betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseTeufelsbeherschung()
  mod.testHelper.TestParse(
    className,
    "TestParseTeufelsbeherschung",
    "teufelsbeherschung",
    "$player$ bekommt 'Teufelsbeherschung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTeufelsbeherschung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTeufelsbeherschung",
    "teufelsbeherschung",
    "Teufelsbeherschung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchattenbrand()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenbrand",
    "schattenbrand",
    "Ihr seid von Schattenbrand betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSchattenzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenzauberschutz",
    "schattenzauberschutz",
    "$player$ bekommt 'Schattenzauberschutz'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchattenzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchattenzauberschutz",
    "schattenzauberschutz",
    "Schattenzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchreckensgeheul()
  mod.testHelper.TestParse(
    className,
    "TestParseSchreckensgeheul",
    "schreckensgeheul",
    "Ihr seid von Schreckensgeheul betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseZauberstein",
    "zauberstein",
    "$player$ bekommt 'Zauberstein'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownZauberstein",
    "zauberstein",
    "Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseErheblicherZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseErheblicherZauberstein",
    "erheblicher_zauberstein",
    "$player$ bekommt 'Erheblicher Zauberstein'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownErheblicherZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownErheblicherZauberstein",
    "erheblicher_zauberstein",
    "Erheblicher Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGrosserZauberstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGrosserZauberstein",
    "grosser_zauberstein",
    "$player$ bekommt 'Großer Zauberstein'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGrosserZauberstein()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGrosserZauberstein",
    "grosser_zauberstein",
    "Großer Zauberstein schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTodesmantel()
  mod.testHelper.TestParse(
    className,
    "TestParseTodesmantel",
    "todesmantel",
    "Ihr seid von Todesmantel betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFluchVerstaerken()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchVerstaerken",
    "fluch_verstaerken",
    "$player$ bekommt 'Fluch verstärken'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFluchVerstaerken()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFluchVerstaerken",
    "fluch_verstaerken",
    "Fluch verstärken schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchwacherGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseSchwacherGesundheitsstein",
    "schwacher_gesundheitsstein",
    "$player$s Schwacher Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGeringerGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGeringerGesundheitsstein",
    "geringer_gesundheitsstein",
    "$player$s Geringer Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGesundheitsstein",
    "gesundheitsstein",
    "$player$s Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseGrosserGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseGrosserGesundheitsstein",
    "grosser_gesundheitsstein",
    "$player$s Großer Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseErheblicherGesundheitsstein()
  mod.testHelper.TestParse(
    className,
    "TestParseErheblicherGesundheitsstein",
    "major_healthstone",
    "$player$s Erheblicher Gesundheitsstein heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseFluchDerErschoepfung()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchDerErschoepfung",
    "fluch_der_erschoepfung",
    "Ihr seid von Fluch der Erschöpfung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseFluchDerSprachen()
  mod.testHelper.TestParse(
    className,
    "TestParseFluchDerSprachen",
    "fluch_der_sprachen",
    "Ihr seid von Fluch der Sprachen betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeelensteinAuferstehung()
  mod.testHelper.TestParse(
    className,
    "TestParseSeelensteinAuferstehung",
    "seelenstein_auferstehung",
    "$player$ bekommt 'Seelenstein-Auferstehung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeelensteinAuferstehung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeelensteinAuferstehung",
    "seelenstein_auferstehung",
    "Seelenstein-Auferstehung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseZaubersperre()
  mod.testHelper.TestParse(
    className,
    "TestParseZaubersperre",
    "zaubersperre",
    "Ihr seid von Zaubersperre betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeelenverbindung()
  mod.testHelper.TestParse(
    className,
    "TestParseSeelenverbindung",
    "seelenverbindung",
    "$player$ bekommt 'Seelenverbindung'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeelenverbindung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeelenverbindung",
    "seelenverbindung",
    "Seelenverbindung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVerfuehrung()
  mod.testHelper.TestParse(
    className,
    "TestParseVerfuehrung",
    "verfuehrung",
    "Ihr seid von Verführung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneFluchDerSprachen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFluchDerSprachen",
    "fluch_der_sprachen",
    "Fluch der Sprachen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFluchDerSprachen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFluchDerSprachen",
    "fluch_der_sprachen",
    "Ihr habt es mit Fluch der Sprachen versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneTodesmantel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneTodesmantel",
    "todesmantel",
    "Todesmantel war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistTodesmantel()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistTodesmantel",
    "todesmantel",
    "Ihr habt es mit Todesmantel versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneFurcht()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneFurcht",
    "furcht",
    "Furcht war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistFurcht()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistFurcht",
    "furcht",
    "Ihr habt es mit Furcht versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneSchreckensgeheul()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchreckensgeheul",
    "schreckensgeheul",
    "Schreckensgeheul war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistSchreckensgeheul()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistSchreckensgeheul",
    "schreckensgeheul",
    "Ihr habt es mit Schreckensgeheul versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneSchattenbrand()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchattenbrand",
    "schattenbrand",
    "Schattenbrand war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistSchattenbrand()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistSchattenbrand",
    "schattenbrand",
    "Ihr habt es mit Schattenbrand versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFluchDerSprachen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFluchDerSprachen",
    "fluch_der_sprachen",
    "$player$ versucht es mit Fluch der Sprachen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFluchDerSprachen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFluchDerSprachen",
    "fluch_der_sprachen",
    "$player$ versucht es mit Fluch der Sprachen... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneTodesmantel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneTodesmantel",
    "todesmantel",
    "$player$ versucht es mit Todesmantel... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistTodesmantel()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistTodesmantel",
    "todesmantel",
    "$player$ versucht es mit Todesmantel... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneFurcht()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneFurcht",
    "furcht",
    "$player$ versucht es mit Furcht... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistFurcht()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistFurcht",
    "furcht",
    "$player$ versucht es mit Furcht... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSchreckensgeheul()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchreckensgeheul",
    "schreckensgeheul",
    "$player$ versucht es mit Schreckensgeheul... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSchreckensgeheul()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSchreckensgeheul",
    "schreckensgeheul",
    "$player$ versucht es mit Schreckensgeheul... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSchattenbrand()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchattenbrand",
    "schattenbrand",
    "$player$ versucht es mit Schattenbrand... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSchattenbrand()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSchattenbrand",
    "schattenbrand",
    "$player$ versucht es mit Schattenbrand... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneZaubersperre()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneZaubersperre",
    "spell_lock",
    "$player$ versucht es mit Zaubersperre... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistZaubersperre()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistZaubersperre",
    "zaubersperre",
    "$player$ versucht es mit Zaubersperre... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVerfuehrung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerfuehrung",
    "verfuehrung",
    "$player$ versucht es mit Verführung... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerfuehrung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerfuehrung",
    "verfuehrung",
    "$player$ versucht es mit Verführung... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
