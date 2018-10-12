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
mod.testPriestDe = me

me.tag = "TestPriestDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[4]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_PRIEST_DE__Test()
  mod.testReporter.StartTestRun("global_priest_de_all")
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

function _G.__PVPW__TEST_PRIEST_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_priest_de_all")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_priest_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_priest_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_PRIEST_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_priest_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychischerSchrei)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStille)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSeeleDerMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSeeleDerMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInneresFeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInneresFeuer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampirumarmung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerzweifeltesGebet)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerschlingendeSeuche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFurchtzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFurchtzauberschutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElunesAnmut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElunesAnmut)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSternensplitter)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVerhexungDerSchwaeche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVerschlingendeSeuche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManabrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGedankenkontrolle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychischerSchrei)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSchattenwortSchmerz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidStille)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVampirumarmung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVerschlingendeSeuche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidManabrand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGedankenkontrolle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPsychischerSchrei)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSchattenwortSchmerz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidStille)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVampirumarmung)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParsePsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseStille)
  mod.testReporter.AddToTestQueue(me.TestParseSeeleDerMacht)
  mod.testReporter.AddToTestQueue(me.TestParseDownSeeleDerMacht)
  mod.testReporter.AddToTestQueue(me.TestParseInneresFeuer)
  mod.testReporter.AddToTestQueue(me.TestParseDownInneresFeuer)
  mod.testReporter.AddToTestQueue(me.TestParseVampirumarmung)
  mod.testReporter.AddToTestQueue(me.TestParseVerzweifeltesGebet)
  mod.testReporter.AddToTestQueue(me.TestParseCritVerzweifeltesGebet)
  mod.testReporter.AddToTestQueue(me.TestParseVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueue(me.TestParseDownBeruehrungDerSchwaeche)
  mod.testReporter.AddToTestQueue(me.TestParseFurchtzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownFurchtzauberschutz)
  mod.testReporter.AddToTestQueue(me.TestParseElunesAnmut)
  mod.testReporter.AddToTestQueue(me.TestParseDownElunesAnmut)
  mod.testReporter.AddToTestQueue(me.TestParseSternensplitter)
  mod.testReporter.AddToTestQueue(me.TestParseVerhexungDerSchwaeche)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneManabrand)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistManabrand)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGedankenkontrolle)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistGedankenkontrolle)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmunePsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistPsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneSchattenwortSchmerz)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistSchattenwortSchmerz)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneStille)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistStille)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneVampirumarmung)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistVampirumarmung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVerschlingendeSeuche)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistBlackout)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneManabrand)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistManabrand)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGedankenkontrolle)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistGedankenkontrolle)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmunePsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistPsychischerSchrei)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneSchattenwortSchmerz)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistSchattenwortSchmerz)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneStille)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistStille)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneVampirumarmung)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistVampirumarmung)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundPsychischerSchrei()
  mod.testHelper.TestSound(
    className,
    "TestSoundPsychischerSchrei",
    "psychischer_schrei"
  )
end

function me.TestSoundStille()
  mod.testHelper.TestSound(
    className,
    "TestSoundStille",
    "stille"
  )
end

function me.TestSoundSeeleDerMacht()
  mod.testHelper.TestSound(
    className,
    "TestSoundSeeleDerMacht",
    "seele_der_macht"
  )
end

function me.TestSoundDownSeeleDerMacht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSeeleDerMacht",
    "seele_der_macht"
  )
end

function me.TestSoundInneresFeuer()
  mod.testHelper.TestSound(
    className,
    "TestSoundInneresFeuer",
    "inneres_feuer"
  )
end

function me.TestSoundDownInneresFeuer()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInneresFeuer",
    "inneres_feuer"
  )
end

function me.TestSoundVampirumarmung()
  mod.testHelper.TestSound(
    className,
    "TestSoundVampirumarmung",
    "vampirumarmung"
  )
end

function me.TestSoundVerzweifeltesGebet()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerzweifeltesGebet",
    "verzweifeltes_gebet"
  )
end

function me.TestSoundVerschlingendeSeuche()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerschlingendeSeuche",
    "verschlingende_seuche"
  )
end

function me.TestSoundBeruehrungDerSchwaeche()
  mod.testHelper.TestSound(
    className,
    "TestSoundBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche"
  )
end

function me.TestSoundDownBeruehrungDerSchwaeche()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche"
  )
end

function me.TestSoundFurchtzauberschutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundFurchtzauberschutz",
    "furchtzauberschutz"
  )
end

function me.TestSoundDownFurchtzauberschutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFurchtzauberschutz",
    "furchtzauberschutz"
  )
end

function me.TestSoundElunesAnmut()
  mod.testHelper.TestSound(
    className,
    "TestSoundElunesAnmut",
    "elunes_anmut"
  )
end

function me.TestSoundDownElunesAnmut()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownElunesAnmut",
    "elunes_anmut"
  )
end

function me.TestSoundSternensplitter()
  mod.testHelper.TestSound(
    className,
    "TestSoundSternensplitter",
    "sternensplitter"
  )
end

function me.TestSoundVerhexungDerSchwaeche()
  mod.testHelper.TestSound(
    className,
    "TestSoundVerhexungDerSchwaeche",
    "verhexung_der_schwaeche"
  )
end


function me.TestSoundEnemyAvoidVerschlingendeSeuche()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVerschlingendeSeuche",
    "verschlingende_seuche"
  )
end

function me.TestSoundEnemyAvoidBlackout()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidBlackout",
    "blackout"
  )
end

function me.TestSoundEnemyAvoidManabrand()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidManabrand",
    "manabrand"
  )
end

function me.TestSoundEnemyAvoidGedankenkontrolle()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidGedankenkontrolle",
    "gedankenkontrolle"
  )
end

function me.TestSoundEnemyAvoidPsychischerSchrei()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidPsychischerSchrei",
    "psychischer_schrei"
  )
end

function me.TestSoundEnemyAvoidSchattenwortSchmerz()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidSchattenwortSchmerz",
    "schattenwort_schmerz"
  )
end

function me.TestSoundEnemyAvoidStille()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidStille",
    "stille"
  )
end

function me.TestSoundEnemyAvoidVampirumarmung()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidVampirumarmung",
    "vampirumarmung"
  )
end

function me.TestSoundSelfAvoidVerschlingendeSeuche()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVerschlingendeSeuche",
    "verschlingende_seuche"
  )
end

function me.TestSoundSelfAvoidBlackout()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidBlackout",
    "blackout"
  )
end

function me.TestSoundSelfAvoidManabrand()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidManabrand",
    "manabrand"
  )
end

function me.TestSoundSelfAvoidGedankenkontrolle()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGedankenkontrolle",
    "gedankenkontrolle"
  )
end

function me.TestSoundSelfAvoidPsychischerSchrei()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidPsychischerSchrei",
    "psychischer_schrei"
  )
end

function me.TestSoundSelfAvoidSchattenwortSchmerz()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidSchattenwortSchmerz",
    "schattenwort_schmerz"
  )
end

function me.TestSoundSelfAvoidStille()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidStille",
    "stille"
  )
end

function me.TestSoundSelfAvoidVampirumarmung()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidVampirumarmung",
    "vampirumarmung"
  )
end

function me.TestParsePsychischerSchrei()
  mod.testHelper.TestParse(
    className,
    "TestParsePsychischerSchrei",
    "psychischer_schrei",
    "Ihr seid von Psychischer Schrei betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseStille()
  mod.testHelper.TestParse(
    className,
    "TestParseStille",
    "stille",
    "Ihr seid von Stille betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseSeeleDerMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseSeeleDerMacht",
    "seele_der_macht",
    "$player$ bekommt 'Seele der Macht'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSeeleDerMacht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSeeleDerMacht",
    "seele_der_macht",
    "Seele der Macht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseInneresFeuer()
  mod.testHelper.TestParse(
    className,
    "TestParseInneresFeuer",
    "inneres_feuer",
    "$player$ bekommt 'Inneres Feuer'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInneresFeuer()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInneresFeuer",
    "inneres_feuer",
    "Inneres Feuer schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseVampirumarmung()
  mod.testHelper.TestParse(
    className,
    "TestParsVampirumarmung",
    "vampirumarmung",
    "Ihr seid von Vampirumarmung betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerzweifeltesGebet()
  mod.testHelper.TestParse(
    className,
    "TestParseVerzweifeltesGebet",
    "verzweifeltes_gebet",
    "$player$s Verzweifeltes Gebet heilt $player$ um $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseCritVerzweifeltesGebet()
  mod.testHelper.TestParse(
    className,
    "TestParseCritVerzweifeltesGebet",
    "verzweifeltes_gebet",
    "Kritische Heilung: $player$s Verzweifeltes Gebet heilt $player$ um $amount$ Punkte.",
    mod.testHelper.eventTypeSpellHostilePlayerBuff
  )
end

function me.TestParseVerschlingendeSeuche()
  mod.testHelper.TestParse(
    className,
    "TestParseVerschlingendeSeuche",
    "verschlingende_seuche",
    "Ihr seid von Verschlingende Seuche betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseBeruehrungDerSchwaeche()
  mod.testHelper.TestParse(
    className,
    "TestParseBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche",
    "$player$ bekommt 'Berührung der Schwäche'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownBeruehrungDerSchwaeche()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownBeruehrungDerSchwaeche",
    "beruehrung_der_schwaeche",
    "Berührung der Schwäche schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFurchtzauberschutz()
  mod.testHelper.TestParse(
    className,
    "TestParseFurchtzauberschutz",
    "furchtzauberschutz",
    "$player$ bekommt 'Furchtzauberschutz'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFurchtzauberschutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFurchtzauberschutz",
    "furchtzauberschutz",
    "Furchtzauberschutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseElunesAnmut()
  mod.testHelper.TestParse(
    className,
    "TestParseElunesAnmut",
    "elunes_anmut",
    "$player$ bekommt 'Elunes Anmut'.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownElunesAnmut()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownElunesAnmut",
    "elunes_anmut",
    "Elunes Anmut schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSternensplitter()
  mod.testHelper.TestParse(
    className,
    "TestParseSternensplitter",
    "sternensplitter",
    "Ihr seid von Sternensplitter betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseVerhexungDerSchwaeche()
  mod.testHelper.TestParse(
    className,
    "TestParseVerhexungDerSchwaeche",
    "verhexung_der_schwaeche",
    "Ihr seid von Verhexung der Schwäche betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneVerschlingendeSeuche()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVerschlingendeSeuche",
    "verschlingende_seuche",
    "Verschlingende Seuche war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVerschlingendeSeuche()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVerschlingendeSeuche",
    "verschlingende_seuche",
    "Ihr habt es mit Verschlingende Seuche versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneBlackout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneBlackout",
    "blackout",
    "Blackout war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistBlackout()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistBlackout",
    "blackout",
    "Ihr habt es mit Blackout versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneManabrand()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneManabrand",
    "manabrand",
    "Manabrand war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistManabrand()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistManabrand",
    "manabrand",
    "Ihr habt es mit Manabrand versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneGedankenkontrolle()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGedankenkontrolle",
    "gedankenkontrolle",
    "Gedankenkontrolle war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistGedankenkontrolle()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistGedankenkontrolle",
    "gedankenkontrolle",
    "Ihr habt es mit Gedankenkontrolle versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmunePsychischerSchrei()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmunePsychischerSchrei",
    "psychischer_schrei",
    "Psychischer Schrei war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistPsychischerSchrei()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistPsychischerSchrei",
    "psychischer_schrei",
    "Ihr habt es mit Psychischer Schrei versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneSchattenwortSchmerz()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneSchattenwortSchmerz",
    "schattenwort_schmerz",
    "Schattenwort: Schmerz war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistSchattenwortSchmerz()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistSchattenwortSchmerz",
    "schattenwort_schmerz",
    "Ihr habt es mit Schattenwort: Schmerz versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneStille()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneStille",
    "stille",
    "Stille war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistStille()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistStille",
    "stille",
    "Ihr habt es mit Stille versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneVampirumarmung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneVampirumarmung",
    "vampirumarmung",
    "Vampirumarmung war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistVampirumarmung()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistVampirumarmung",
    "vampirumarmung",
    "Ihr habt es mit Vampirumarmung versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellSelfDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVerschlingendeSeuche()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVerschlingendeSeuche",
    "verschlingende_seuche",
    "$player$ versucht es mit Verschlingende Seuche... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVerschlingendeSeuche()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVerschlingendeSeuche",
    "verschlingende_seuche",
    "$player$ versucht es mit Verschlingende Seuche... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneBlackout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneBlackout",
    "blackout",
    "$player$ versucht es mit Blackout... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistBlackout()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistBlackout",
    "blackout",
    "$player$ versucht es mit Blackout... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneManabrand()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneManabrand",
    "manabrand",
    "$player$ versucht es mit Manabrand... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistManabrand()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistManabrand",
    "manabrand",
    "$player$ versucht es mit Manabrand... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneGedankenkontrolle()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGedankenkontrolle",
    "gedankenkontrolle",
    "$player$ versucht es mit Gedankenkontrolle... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistGedankenkontrolle()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistGedankenkontrolle",
    "gedankenkontrolle",
    "$player$ versucht es mit Gedankenkontrolle... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmunePsychischerSchrei()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmunePsychischerSchrei",
    "psychischer_schrei",
    "$player$ versucht es mit Psychischer Schrei... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistPsychischerSchrei()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistPsychischerSchrei",
    "psychischer_schrei",
    "$player$ versucht es mit Psychischer Schrei... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneSchattenwortSchmerz()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneSchattenwortSchmerz",
    "schattenwort_schmerz",
    "$player$ versucht es mit Schattenwort: Schmerz... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistSchattenwortSchmerz()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistSchattenwortSchmerz",
    "schattenwort_schmerz",
    "$player$ versucht es mit Schattenwort: Schmerz... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneStille()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneStille",
    "stille",
    "$player$ versucht es mit Stille... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistStille()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistStille",
    "stille",
    "$player$ versucht es mit Stille... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneVampirumarmung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneVampirumarmung",
    "vampirumarmung",
    "$player$ versucht es mit Vampirumarmung... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistVampirumarmung()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistVampirumarmung",
    "vampirumarmung",
    "$player$ versucht es mit Vampirumarmung... widerstanden.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
