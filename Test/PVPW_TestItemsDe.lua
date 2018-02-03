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

  me.RunAll()
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

  if not playManual then
    mod.testReporter.PlayTestQueueWithDelay()
  end

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
    "immunitaet_gegen_unbeweglichkleit"
  )
end

function me.TestSoundDownImmunitaetGegenUnbeweglichkeit()
  mod.testHelper.TestSoundDown(
    className,
    "TestSoundDownImmunitaetGegenUnbeweglichkeit",
    "immunitaet_gegen_unbeweglichkleit"
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
