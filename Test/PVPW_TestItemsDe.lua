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
mod.testItemsDe = me

me.tag = "TestItemsDe"

-- global
local _G = getfenv(0)
local className = PVPW_CLASSLIST[10]

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_ITEMS_DE__Test()
  mod.testReporter.StartTestRun("global_items_de_all")
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

function _G.__PVPW__TEST_ITEMS_DE__Test_Sound()
  mod.testReporter.StartTestRun("global_items_de_sound")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Sound_Down()
  mod.testReporter.StartTestRun("global_items_de_sound_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveASoundDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Parse()
  mod.testReporter.StartTestRun("global_items_de_parse")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Parse_Down()
  mod.testReporter.StartTestRun("global_items_de_parse_down")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseDownTestForSpellsThatFade(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Parse_Crit()
  mod.testReporter.StartTestRun("global_items_de_parse_crit")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAParseCritTestForSpellsThatCanCrit(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Parse_Enemy_Avoid()
  mod.testReporter.StartTestRun("global_items_de_parse_avoid")
  mod.testReporter.StartTestClass(className)

  mod.testHelper.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(me, className)
end

function _G.__PVPW__TEST_ITEMS_DE__Test_Parse_Self_Avoid()
  mod.testReporter.StartTestRun("global_items_de_parse_self_avoid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKoerperlicherSchutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownKoerperlicherSchutz)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSproedeRuestung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSproedeRuestung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPanzerDesWuehlers)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPanzerDesWuehlers)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEphemereMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEphemereMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEssenzSaphirons)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEssenzSaphirons)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeuerreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFeuerreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFliehen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFliehen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGeschenkDesLebens)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGeschenkDesLebens)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmunitaetGegenUnbeweglichkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmunitaetGegenUnbeweglichkeit)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGedankensprung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGedankensprung)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTollkuehnesStuermen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTollkuehnesStuermen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRuheloseStaerke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRuheloseStaerke)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomenRaketenstiefel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomenRaketenstiefel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRaketenstiefel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRaketenstiefel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSchattenreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSchattenreflektor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWappenDesSchlaechters)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWappenDesSchlaechters)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInstabileMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInstabileMacht)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGifttotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGifttotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundErdstoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownErdstoss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNetOMatik)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomenGedankenkontrollkappe)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidTollkuehnesStuermen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidNetOMatik)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidTollkuehnesStuermen)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidNetOMatik)

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

  mod.testReporter.AddToTestQueue(me.TestParseKoerperlicherSchutz)
  mod.testReporter.AddToTestQueue(me.TestParseDownKoerperlicherSchutz)
  mod.testReporter.AddToTestQueue(me.TestParseSproedeRuestung)
  mod.testReporter.AddToTestQueue(me.TestParseDownSproedeRuestung)
  mod.testReporter.AddToTestQueue(me.TestParsePanzerDesWuehlers)
  mod.testReporter.AddToTestQueue(me.TestParseDownPanzerDesWuehlers)
  mod.testReporter.AddToTestQueue(me.TestParseEphemereMacht)
  mod.testReporter.AddToTestQueue(me.TestParseDownEphemereMacht)
  mod.testReporter.AddToTestQueue(me.TestParseEssenzSaphirons)
  mod.testReporter.AddToTestQueue(me.TestParseDownEssenzSaphirons)
  mod.testReporter.AddToTestQueue(me.TestParseFeuerreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseDownFeuerreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseFliehen)
  mod.testReporter.AddToTestQueue(me.TestParseDownFliehen)
  mod.testReporter.AddToTestQueue(me.TestParseFrostreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseDownFrostreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseGeschenkDesLebens)
  mod.testReporter.AddToTestQueue(me.TestParseDownGeschenkDesLebens)
  mod.testReporter.AddToTestQueue(me.TestParseImmunitaetGegenUnbeweglichkeit)
  mod.testReporter.AddToTestQueue(me.TestParseDownImmunitaetGegenUnbeweglichkeit)
  mod.testReporter.AddToTestQueue(me.TestParseGedankensprung)
  mod.testReporter.AddToTestQueue(me.TestParseDownGedankensprung)
  mod.testReporter.AddToTestQueue(me.TestParseTollkuehnesStuermen)
  mod.testReporter.AddToTestQueue(me.TestParseDownTollkuehnesStuermen)
  mod.testReporter.AddToTestQueue(me.TestParseRuheloseStaerke)
  mod.testReporter.AddToTestQueue(me.TestParseDownRuheloseStaerke)
  mod.testReporter.AddToTestQueue(me.TestParseGnomenRaketenstiefel)
  mod.testReporter.AddToTestQueue(me.TestParseDownGnomenRaketenstiefel)
  mod.testReporter.AddToTestQueue(me.TestParseGoblinRaketenstiefel)
  mod.testReporter.AddToTestQueue(me.TestParseDownGoblinRaketenstiefel)
  mod.testReporter.AddToTestQueue(me.TestParseSchattenreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseDownSchattenreflektor)
  mod.testReporter.AddToTestQueue(me.TestParseWappenDesSchlaechters)
  mod.testReporter.AddToTestQueue(me.TestParseDownWappenDesSchlaechters)
  mod.testReporter.AddToTestQueue(me.TestParseInstabileMacht)
  mod.testReporter.AddToTestQueue(me.TestParseDownInstabileMacht)
  mod.testReporter.AddToTestQueue(me.TestParseGifttotem)
  mod.testReporter.AddToTestQueue(me.TestParseDownGifttotem)
  mod.testReporter.AddToTestQueue(me.TestParseGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueue(me.TestParseErdstoss)
  mod.testReporter.AddToTestQueue(me.TestParseDownErdstoss)
  mod.testReporter.AddToTestQueue(me.TestParseNetOMatik)
  mod.testReporter.AddToTestQueue(me.TestParseGnomenGedankenkontrollkappe)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneTollkuehnesStuermen)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidImmuneNetOMatik)
  mod.testReporter.AddToTestQueue(me.TestParseEnemyAvoidResistNetOMatik)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistGezeitenGluecksbringer)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneTollkuehnesStuermen)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidImmuneNetOMatik)
  mod.testReporter.AddToTestQueue(me.TestParseSelfAvoidResistNetOMatik)

  mod.testReporter.PlayTestQueue()
end

function me.TestSoundKoerperlicherSchutz()
  mod.testHelper.TestSound(
    className,
    "TestSoundKoerperlicherSchutz",
    "koerperlicher_schutz"
  )
end

function me.TestSoundDownKoerperlicherSchutz()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownKoerperlicherSchutz",
    "koerperlicher_schutz"
  )
end

function me.TestSoundSproedeRuestung()
  mod.testHelper.TestSound(
    className,
    "TestSoundSproedeRuestung",
    "sproede_ruestung"
  )
end

function me.TestSoundDownSproedeRuestung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSproedeRuestung",
    "sproede_ruestung"
  )
end

function me.TestSoundPanzerDesWuehlers()
  mod.testHelper.TestSound(
    className,
    "TestSoundPanzerDesWuehlers",
    "panzer_des_wuehlers"
  )
end

function me.TestSoundDownPanzerDesWuehlers()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownPanzerDesWuehlers",
    "panzer_des_wuehlers"
  )
end

function me.TestSoundEphemereMacht()
  mod.testHelper.TestSound(
    className,
    "TestSoundEphemereMacht",
    "ephemere_macht"
  )
end

function me.TestSoundDownEphemereMacht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEphemereMacht",
    "ephemere_macht"
  )
end

function me.TestSoundEssenzSaphirons()
  mod.testHelper.TestSound(
    className,
    "TestSoundEssenzSaphirons",
    "essenz_saphirons"
  )
end

function me.TestSoundDownEssenzSaphirons()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownEssenzSaphirons",
    "essenz_saphirons"
  )
end

function me.TestSoundFeuerreflektor()
  mod.testHelper.TestSound(
    className,
    "TestSoundFeuerreflektor",
    "feuerreflektor"
  )
end

function me.TestSoundDownFeuerreflektor()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFeuerreflektor",
    "feuerreflektor"
  )
end

function me.TestSoundFliehen()
  mod.testHelper.TestSound(
    className,
    "TestSoundFliehen",
    "fliehen"
  )
end

function me.TestSoundDownFliehen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFliehen",
    "fliehen"
  )
end

function me.TestSoundFrostreflektor()
  mod.testHelper.TestSound(
    className,
    "TestSoundFrostreflektor",
    "frostreflektor"
  )
end

function me.TestSoundDownFrostreflektor()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownFrostreflektor",
    "frostreflektor"
  )
end

function me.TestSoundGeschenkDesLebens()
  mod.testHelper.TestSound(
    className,
    "TestSoundGeschenkDesLebens",
    "geschenk_des_lebens"
  )
end

function me.TestSoundDownGeschenkDesLebens()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGeschenkDesLebens",
    "geschenk_des_lebens"
  )
end

function me.TestSoundImmunitaetGegenUnbeweglichkeit()
  mod.testHelper.TestSound(
    className,
    "TestSoundImmunitaetGegenUnbeweglichkeit",
    "immunitaet_gegen_unbeweglichkeit"
  )
end

function me.TestSoundDownImmunitaetGegenUnbeweglichkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownImmunitaetGegenUnbeweglichkeit",
    "immunitaet_gegen_unbeweglichkeit"
  )
end

function me.TestSoundGedankensprung()
  mod.testHelper.TestSound(
    className,
    "TestSoundGedankensprung",
    "gedankensprung"
  )
end

function me.TestSoundDownGedankensprung()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGedankensprung",
    "gedankensprung"
  )
end

function me.TestSoundTollkuehnesStuermen()
  mod.testHelper.TestSound(
    className,
    "TestSoundTollkuehnesStuermen",
    "tollkuehnes_stuermen"
  )
end

function me.TestSoundDownTollkuehnesStuermen()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownTollkuehnesStuermen",
    "tollkuehnes_stuermen"
  )
end

function me.TestSoundRuheloseStaerke()
  mod.testHelper.TestSound(
    className,
    "TestSoundRuheloseStaerke",
    "ruhelose_staerke"
  )
end

function me.TestSoundDownRuheloseStaerke()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownRuheloseStaerke",
    "ruhelose_staerke"
  )
end

function me.TestSoundGnomenRaketenstiefel()
  mod.testHelper.TestSound(
    className,
    "TestSoundGnomenRaketenstiefel",
    "gnomen_raketenstiefel"
  )
end

function me.TestSoundDownGnomenRaketenstiefel()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGnomenRaketenstiefel",
    "gnomen_raketenstiefel"
  )
end

function me.TestSoundGoblinRaketenstiefel()
  mod.testHelper.TestSound(
    className,
    "TestSoundGoblinRaketenstiefel",
    "goblin_raketenstiefel"
  )
end

function me.TestSoundDownGoblinRaketenstiefel()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGoblinRaketenstiefel",
    "goblin_raketenstiefel"
  )
end

function me.TestSoundSchattenreflektor()
  mod.testHelper.TestSound(
    className,
    "TestSoundSchattenreflektor",
    "schattenreflektor"
  )
end

function me.TestSoundDownSchattenreflektor()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownSchattenreflektor",
    "schattenreflektor"
  )
end

function me.TestSoundWappenDesSchlaechters()
  mod.testHelper.TestSound(
    className,
    "TestSoundWappenDesSchlaechters",
    "wappen_des_schlaechters"
  )
end

function me.TestSoundDownWappenDesSchlaechters()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownWappenDesSchlaechters",
    "wappen_des_schlaechters"
  )
end

function me.TestSoundInstabileMacht()
  mod.testHelper.TestSound(
    className,
    "TestSoundInstabileMacht",
    "instabile_macht"
  )
end

function me.TestSoundDownInstabileMacht()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownInstabileMacht",
    "instabile_macht"
  )
end

function me.TestSoundGifttotem()
  mod.testHelper.TestSound(
    className,
    "TestSoundGifttotem",
    "gifttotem"
  )
end

function me.TestSoundDownGifttotem()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownGifttotem",
    "gifttotem"
  )
end

function me.TestSoundGezeitenGluecksbringer()
  mod.testHelper.TestSound(
    className,
    "TestSoundGezeitenGluecksbringer",
    "gezeiten_gluecksbringer"
  )
end

function me.TestSoundErdstoss()
  mod.testHelper.TestSound(
    className,
    "TestSoundErdstoss",
    "erdstoss"
  )
end

function me.TestSoundDownErdstoss()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownErdstoss",
    "erdstoss"
  )
end

function me.TestSoundNetOMatik()
  mod.testHelper.TestSound(
    className,
    "TestSoundNetOMatik",
    "net_o_matik"
  )
end

function me.TestSoundGnomenGedankenkontrollkappe()
  mod.testHelper.TestSound(
    className,
    "TestSoundGnomenGedankenkontrollkappe",
    "gnomen_gedankenkontrollkappe"
  )
end

function me.TestSoundEnemyAvoidGezeitenGluecksbringer()
  mod.testHelper.TestSound(
    className,
    "TestSoundEnemyAvoidGezeitenGluecksbringer",
    "gezeiten_gluecksbringer"
  )
end

function me.TestSoundEnemyAvoidTollkuehnesStuermen()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidTollkuehnesStuermen",
    "tollkuehnes_stuermen"
  )
end

function me.TestSoundEnemyAvoidNetOMatik()
  mod.testHelper.TestSoundEnemyAvoid(
    className,
    "TestSoundEnemyAvoidNetOMatik",
    "net_o_matik"
  )
end

function me.TestSoundSelfAvoidGezeitenGluecksbringer()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidGezeitenGluecksbringer",
    "gezeiten_gluecksbringer"
  )
end

function me.TestSoundSelfAvoidTollkuehnesStuermen()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidTollkuehnesStuermen",
    "tollkuehnes_stuermen"
  )
end

function me.TestSoundSelfAvoidNetOMatik()
  mod.testHelper.TestSoundSelfAvoid(
    className,
    "TestSoundSelfAvoidNetOMatik",
    "net_o_matik"
  )
end

function me.TestParseKoerperlicherSchutz()
  mod.testHelper.TestParse(
    className,
    "TestParseKoerperlicherSchutz",
    "koerperlicher_schutz",
    "$player$ bekommt Körperlicher Schutz.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownKoerperlicherSchutz()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownKoerperlicherSchutz",
    "koerperlicher_schutz",
    "Körperlicher Schutz schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSproedeRuestung()
  mod.testHelper.TestParse(
    className,
    "TestParseSproedeRuestung",
    "sproede_ruestung",
    "$player$ bekommt Spröde Rüstung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSproedeRuestung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSproedeRuestung",
    "sproede_ruestung",
    "Spröde Rüstung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParsePanzerDesWuehlers()
  mod.testHelper.TestParse(
    className,
    "TestParsePanzerDesWuehlers",
    "panzer_des_wuehlers",
    "$player$ bekommt Panzer des Wühlers.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownPanzerDesWuehlers()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownPanzerDesWuehlers",
    "panzer_des_wuehlers",
    "Panzer des Wühlers schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEphemereMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseEphemereMacht",
    "ephemere_macht",
    "$player$ bekommt Ephemere Macht.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEphemereMacht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEphemereMacht",
    "ephemere_macht",
    "Ephemere Macht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseEssenzSaphirons()
  mod.testHelper.TestParse(
    className,
    "TestParseEssenzSaphirons",
    "essenz_saphirons",
    "$player$ bekommt Essenz Saphirons.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownEssenzSaphirons()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownEssenzSaphirons",
    "essenz_saphirons",
    "Essenz Saphirons schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFeuerreflektor()
  mod.testHelper.TestParse(
    className,
    "TestParseFeuerreflektor",
    "feuerreflektor",
    "$player$ bekommt Feuerreflektor.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFeuerreflektor()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFeuerreflektor",
    "feuerreflektor",
    "Feuerreflektor schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFliehen()
  mod.testHelper.TestParse(
    className,
    "TestParseFliehen",
    "fliehen",
    "$player$ bekommt Fliehen.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFliehen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFliehen",
    "fliehen",
    "Fliehen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseFrostreflektor()
  mod.testHelper.TestParse(
    className,
    "TestParseFrostreflektor",
    "frostreflektor",
    "$player$ bekommt Frostreflektor.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownFrostreflektor()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownFrostreflektor",
    "frostreflektor",
    "Frostreflektor schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGeschenkDesLebens()
  mod.testHelper.TestParse(
    className,
    "TestParseGeschenkDesLebens",
    "geschenk_des_lebens",
    "$player$ bekommt Geschenk des Lebens.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGeschenkDesLebens()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGeschenkDesLebens",
    "geschenk_des_lebens",
    "Geschenk des Lebens schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseImmunitaetGegenUnbeweglichkeit()
  mod.testHelper.TestParse(
    className,
    "TestParseImmunitaetGegenUnbeweglichkeit",
    "immunitaet_gegen_unbeweglichkeit",
    "$player$ bekommt Immunität gegen Unbeweglichkeit.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownImmunitaetGegenUnbeweglichkeit()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownImmunitaetGegenUnbeweglichkeit",
    "immunitaet_gegen_unbeweglichkeit",
    "Immunität gegen Unbeweglichkeit schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGedankensprung()
  mod.testHelper.TestParse(
    className,
    "TestParseGedankensprung",
    "gedankensprung",
    "$player$ bekommt Gedankensprung.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGedankensprung()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGedankensprung",
    "gedankensprung",
    "Gedankensprung schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseTollkuehnesStuermen()
  mod.testHelper.TestParse(
    className,
    "TestParseTollkuehnesStuermen",
    "tollkuehnes_stuermen",
    "$player$ bekommt Tollkühnes Stürmen.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownTollkuehnesStuermen()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownTollkuehnesStuermen",
    "tollkuehnes_stuermen",
    "Tollkühnes Stürmen schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseRuheloseStaerke()
  mod.testHelper.TestParse(
    className,
    "TestParseRuheloseStaerke",
    "ruhelose_staerke",
    "$player$ bekommt Ruhelose Stärke.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownRuheloseStaerke()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownRuheloseStaerke",
    "ruhelose_staerke",
    "Ruhelose Stärke schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGnomenRaketenstiefel()
  mod.testHelper.TestParse(
    className,
    "TestParseGnomenRaketenstiefel",
    "gnomen_raketenstiefel",
    "$player$ bekommt Gnomen-Raketenstiefel.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGnomenRaketenstiefel()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGnomenRaketenstiefel",
    "gnomen_raketenstiefel",
    "Gnomen-Raketenstiefel schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGoblinRaketenstiefel()
  mod.testHelper.TestParse(
    className,
    "TestParseGoblinRaketenstiefel",
    "goblin_raketenstiefel",
    "$player$ bekommt Goblin-Raketenstiefel.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGoblinRaketenstiefel()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGoblinRaketenstiefel",
    "goblin_raketenstiefel",
    "Goblin-Raketenstiefel schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseSchattenreflektor()
  mod.testHelper.TestParse(
    className,
    "TestParseSchattenreflektor",
    "schattenreflektor",
    "$player$ bekommt Schattenreflektor.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownSchattenreflektor()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownSchattenreflektor",
    "schattenreflektor",
    "Schattenreflektor schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseWappenDesSchlaechters()
  mod.testHelper.TestParse(
    className,
    "TestParseWappenDesSchlaechters",
    "wappen_des_schlaechters",
    "$player$ bekommt Wappen des Schlächters.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownWappenDesSchlaechters()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownWappenDesSchlaechters",
    "wappen_des_schlaechters",
    "Wappen des Schlächters schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseInstabileMacht()
  mod.testHelper.TestParse(
    className,
    "TestParseInstabileMacht",
    "instabile_macht",
    "$player$ bekommt Instabile Macht.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownInstabileMacht()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownInstabileMacht",
    "instabile_macht",
    "Instabile Macht schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGifttotem()
  mod.testHelper.TestParse(
    className,
    "TestParseGifttotem",
    "gifttotem",
    "$player$ bekommt Gifttotem.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownGifttotem()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownGifttotem",
    "gifttotem",
    "Gifttotem schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseGezeitenGluecksbringer()
  mod.testHelper.TestParse(
    className,
    "TestParseGezeitenGluecksbringer",
    "gezeiten_gluecksbringer",
    "Ihr seid von Gezeiten-Glücksbringer betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseErdstoss()
  mod.testHelper.TestParse(
    className,
    "TestParseErdstoss",
    "erdstoss",
    "$player$ bekommt Erdstoß.",
    mod.testHelper.eventTypeSpellPeriodicHostilePlayerBuffs
  )
end

function me.TestParseDownErdstoss()
  mod.testHelper.TestParseDown(
    className,
    "TestParseDownErdstoss",
    "erdstoss",
    "Erdstoß schwindet von $player$.",
    mod.testHelper.eventTypeSpellAuraGoneOther
  )
end

function me.TestParseNetOMatik()
  mod.testHelper.TestParse(
    className,
    "TestParseNetOMatic",
    "net_o_matik",
    "Ihr seid von Net-o-Matik betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseGnomenGedankenkontrollkappe()
  mod.testHelper.TestParse(
    className,
    "TestParseGnomenGedankenkontrollkappe",
    "gnomen_gedankenkontrollkappe",
    "Ihr seid von Gnomen-Gedankenkontrollkappe betroffen.",
    mod.testHelper.eventTypeSpellPeriodicSelfDamage
  )
end

function me.TestParseEnemyAvoidImmuneGezeitenGluecksbringer()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneGezeitenGluecksbringer",
    "gezeiten_gluecksbringer",
    "Gezeiten-Glücksbringer war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistGezeitenGluecksbringer()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistGezeitenGluecksbringer",
    "gezeiten_gluecksbringer",
    "Ihr habt es mit Gezeiten-Glücksbringer versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseEnemyAvoidImmuneTollkuehnesStuermen()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneTollkuehnesStuermen",
    "tollkuehnes_stuermen",
    "Tollkühnes Stürmen war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidImmuneNetOMatik()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidImmuneNetOMatik",
    "net_o_matik",
    "Net-o-Matik war ein Fehlschlag. $player$ ist immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseEnemyAvoidResistNetOMatik()
  mod.testHelper.TestParseEnemyAvoid(
    className,
    "TestParseEnemyAvoidResistNetOMatik",
    "net_o_matik",
    "Ihr habt es mit Net-o-Matik versucht, aber $player$ hat widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnSelf,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneGezeitenGluecksbringer()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneGezeitenGluecksbringer",
    "gezeiten_gluecksbringer",
    "$player$ versucht es mit Gezeiten-Glücksbringer... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistGezeitenGluecksbringer()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistGezeitenGluecksbringer",
    "gezeiten_gluecksbringer",
    "$player$ versucht es mit Gezeiten-Glücksbringer... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end

function me.TestParseSelfAvoidImmuneTollkuehnesStuermen()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneTollkuehnesStuermen",
    "tollkuehnes_stuermen",
    "$player$ versucht es mit Tollkühnes Stürmen... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidImmuneNetOMatik()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidImmuneNetOMatik",
    "net_o_matik",
    "$player$ versucht es mit Net-o-Matik... ein Fehlschlag. Ihr seid immun.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.IMMUNE
  )
end

function me.TestParseSelfAvoidResistNetOMatik()
  mod.testHelper.TestParseSelfAvoid(
    className,
    "TestParseSelfAvoidResistNetOMatik",
    "net_o_matik",
    "$player$ versucht es mit Net-o-Matik... widerstanden.",
    mod.testHelper.eventTypeSpellDamageShieldsOnOthers,
    PVPW_CONSTANTS.AVOID_TYPES.RESIST
  )
end
