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

local mod = pvpw
local me = {}
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

--[[
  Spellmap for spells that are either resisted by an enemy player or resisted by
  the player himself

  ["category"] {
    e.g warrior, misc etc.
    ["spell_name"] = {
      ["name"] = "Spell Name",
        {string} spellname in ingame format
      ["soundFileName"] = "",
        {string} part of the actual sound filename
      ["dodge"] = true,
        {boolean} if set to true means the spell can be dodged otherwise not
      ["parry"] = true,
        {boolean} if set to true means the spell can be parried otherwise not
      ["immune"] = true,
        {boolean} if set to true means the spell can fail if the target is immune.
        E.g. using divine shield
      ["miss"] = true,
        {boolean} if set to true means the spell can be missed otherwise not
      ["block"] = true,
        {boolean} if set to true means the spell can be blocked otherwise not
      ["resist"] = true,
        {boolean} if set to true means the spell can be resisted otherwise not
      ["self_avoid"] = true,
        {boolean} whether tracking of player avoid spell is enabled or not. Certain
        events can only be detected one way or the other. If a your pet is casting
        a spell the addon will not be able to detect that resist because it only
        checks for player resisted spell
      ["enemy_avoid"] = true
        {boolean} whether tracking of enemy avoid spell is enabled or not. Certain
        events can only be detected one way or the other. If a your pet is casting
        a spell the addon will not be able to detect that resist because it only
        checks for player resisted spell
    }
  }
]]--
local spellAvoidMap

if (GetLocale() == "deDE") then
  spellAvoidMap = {
    ["rogue"] = {
      ["tritt"] = {
        ["name"] = "Tritt",
        ["spellId"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["soundFileName"] = "tritt",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["fieser_trick"] = {
        ["name"] = "Fieser Trick",
        ["spellId"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["soundFileName"] = "fieser_trick",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["solarplexus"] = {
        ["name"] = "Solarplexus",
        ["spellId"] = 11286,
        ["spellIcon"] = "ability_gouge",
        ["soundFileName"] = "solarplexus",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["riposte"] = {
        ["name"] = "Riposte",
        ["spellId"] = 14251,
        ["spellIcon"] = "ability_warrior_challange",
        ["soundFileName"] = "riposte",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["nierenhieb"] = {
        ["name"] = "Nierenhieb",
        ["spellId"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["soundFileName"] = "nierenhieb",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blenden"] = {
        ["name"] = "Blenden",
        ["spellId"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["soundFileName"] = "blenden",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["geisterhafter_stoss"] = {
        ["name"] = "Geisterhafter Stoß",
        ["spellId"] = 14278,
        ["spellIcon"] = "spell_shadow_curse",
        ["soundFileName"] = "geisterhafter_stoss",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["kopfnuss"] = {
        ["name"] = "Kopfnuss",
        ["spellId"] = 11297, -- rank 3
        ["spellIcon"] = "ability_sap",
        ["soundFileName"] = "kopfnuss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["konzentration"] = {
        ["name"] = "Konzentration",
        ["spellId"] = 14183,
        ["spellIcon"] = "spell_shadow_possession",
        ["soundFileName"] = "konzentration",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["ablenken"] = {
        ["name"] = "Ablenken",
        ["spellId"] = 1725,
        ["spellIcon"] = "ability_rogue_distract",
        ["soundFileName"] = "ablenken",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["ruestung_schwaechen"] = {
        ["name"] = "Rüstung schwächen",
        ["spellId"] = 11198, -- rank 5
        ["spellIcon"] = "ability_warrior_riposte",
        ["soundFileName"] = "ruestung_schwaechen",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["erdrosseln"] = {
        ["name"] = "Erdrosseln",
        ["spellId"] = 11290, -- rank 6
        ["spellIcon"] = "ability_rogue_garrote",
        ["soundFileName"] = "erdrosseln",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blutung"] = {
        ["name"] = "Blutung",
        ["spellId"] = 11275, -- rank 6
        ["spellIcon"] = "ability_rogue_rupture",
        ["soundFileName"] = "blutung",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["warrior"] = {
      ["betaeubung_abfangen"] = {
        ["name"] = "Betäubung abfangen",
        ["spellId"] = 7922,
        ["spellIcon"] = "ability_warrior_charge",
        ["soundFileName"] = "abfangen",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["kniesehne"] = {
        ["name"] = "Kniesehne",
        ["spellId"] = 7373, -- rank 3
        ["spellIcon"] = "ability_shockwave",
        ["soundFileName"] = "kniesehne",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["toedlicher_stoss"] = {
        ["name"] = "Tödlicher Stoß",
        ["spellId"] = 21553, -- rank 4
        ["spellIcon"] = "ability_warrior_savageblow",
        ["soundFileName"] = "toedlicher_stoss",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["ueberwaeltigen"] = {
        ["name"] = "Überwältigen",
        ["spellId"] = 11585, -- rank 4
        ["spellIcon"] = "ability_meleedamage",
        ["soundFileName"] = "ueberwaeltigen",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blutdurst"] = {
        ["name"] = "Blutdurst",
        ["spellId"] = 23894, -- rank 4
        ["spellIcon"] = "spell_nature_bloodlust",
        ["soundFileName"] = "blutdurst",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["sturmangriffsbetaeubung"] = {
        ["name"] = "Sturmangriffsbetäubung",
        ["spellId"] = 20615,
        ["spellIcon"] = "ability_rogue_sprint",
        ["soundFileName"] = "sturmangriff",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["drohruf"] = {
        ["name"] = "Drohruf",
        ["spellId"] = 5246,
        ["spellIcon"] = "ability_golemthunderclap",
        ["soundFileName"] = "drohruf",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["zuschlagen"] = {
        ["name"] = "Zuschlagen",
        ["spellId"] = 6554, -- rank 2
        ["spellIcon"] = "inv_gauntlets_04",
        ["soundFileName"] = "zuschlagen",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["erschuetternder_schlag"] = {
        ["name"] = "Erschütternder Schlag",
        ["spellId"] = 12809,
        ["spellIcon"] = "ability_thunderbolt",
        ["soundFileName"] = "erschuetternder_schlag",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["entwaffnen"] = {
        ["name"] = "Entwaffnen",
        ["spellId"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["soundFileName"] = "entwaffnen",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schildhieb"] = {
        ["name"] = "Schildhieb",
        ["spellId"] = 1672, -- rank 3
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["soundFileName"] = "schildhieb",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schildschlag"] = {
        ["name"] = "Schildschlag",
        ["spellId"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["soundFileName"] = "schildschlag",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["mage"] = {
      --[[
        mage counterspell is kind of special

        If a player resists the silence the full spellname will be
        Counterspell - Silenced
        Your Counterspell - Silenced was resisted by $player$.

        However if a player is immune to it the name is simply Counterspell
        Your Counterspell failed. $player$ is immune.

        Becaus of that two spells exist in this map one for Counterspell and one for
        Counterspell - Silenced
      ]]--
      ["gegenzauber_zum_schweigen_gebracht"] = {
        ["name"] = "Gegenzauber - zum Schweigen gebracht",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "gegenzauber",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = false,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["gegenzauber"] = {
        ["name"] = "Gegenzauber",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "gegenzauber",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["verwandlung"] = {
        ["name"] = "Verwandlung",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["soundFileName"] = "verwandlung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["verwandlung_kuh"] = {
        ["name"] = "Verwandlung: Kuh",
        ["spellId"] = 28270,
        ["spellIcon"] = "spell_nature_polymorph_cow",
        ["soundFileName"] = "verwandlung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["verwandlung_schwein"] = {
        ["name"] = "Verwandlung: Schwein",
        ["spellId"] = 28272,
        ["spellIcon"] = "spell_magic_polymorphpig",
        ["soundFileName"] = "verwandlung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["verwandlung_kroete"] = {
        ["name"] = "Verwandlung: Kröte",
        ["spellId"] = 28271,
        ["spellIcon"] = "ability_hunter_pet_turtle",
        ["soundFileName"] = "verwandlung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["kaeltekegel"] = {
        ["name"] = "Kältekegel",
        ["spellId"] = 10161, -- rank 5
        ["spellIcon"] = "spell_frost_glacier",
        ["soundFileName"] = "kaeltekegel",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frostnova"] = {
        ["name"] = "Frostnova",
        ["spellId"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["soundFileName"] = "frostnova",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["warlock"] = {
      ["fluch_der_sprachen"] = {
        ["name"] = "Fluch der Sprachen",
        ["spellId"] = 11719, -- rank 2
        ["spellIcon"] = "spell_shadow_curseoftounges",
        ["soundFileName"] = "fluch_der_sprachen",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["todesmantel"] = {
        ["name"] = "Todesmantel",
        ["spellId"] = 17926, -- rank 3
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["soundFileName"] = "todesmantel",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["furcht"] = {
        ["name"] = "Furcht",
        ["spellId"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["soundFileName"] = "furcht",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schreckensgeheul"] = {
        ["name"] = "Schreckensgeheul",
        ["spellId"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["soundFileName"] = "schreckensgeheul",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schattenbrand"] = {
        ["name"] = "Schattenbrand",
        ["spellId"] = 18871, -- rank 6
        ["spellIcon"] = "spell_shadow_scourgebuild",
        ["soundFileName"] = "schattenbrand",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["zaubersperre"] = {
        ["name"] = "Zaubersperre",
        ["spellId"] = 19647,
        ["spellIcon"] = "spell_shadow_mindrot",
        ["soundFileName"] = "zaubersperre",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = false
      },
      ["verfuehrung"] = {
        ["name"] = "Verführung",
        ["spellId"] = 6358,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["soundFileName"] = "verfuehrung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = false
      }
    },
    ["hunter"] = {
      ["gezielter_schuss"] = {
        ["name"] = "Gezielter Schuss",
        ["spellId"] = 20904, -- rank 6
        ["spellIcon"] = "inv_spear_07",
        ["soundFileName"] = "gezielter_schuss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["erschuetternder_schuss"] = {
        ["name"] = "Erschütternder Schuss",
        ["spellId"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["soundFileName"] = "erschuetternder_schuss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["streuschuss"] = {
        ["name"] = "Streuschuss",
        ["spellId"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["soundFileName"] = "streuschuss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schlangenbiss"] = {
        ["name"] = "Schlangenbiss",
        ["spellId"] = 13555, -- rank 8
        ["spellIcon"] = "ability_hunter_quickshot",
        ["soundFileName"] = "schlangenbiss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["vipernbiss"] = {
        ["name"] = "Vipernbiss",
        ["spellId"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["soundFileName"] = "vipernbiss",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["eiskaeltefalle"] = {
        ["name"] = "Eiskältefalle",
        ["spellId"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["soundFileName"] = "eiskaeltefalle",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["zurechtstutzen"] = {
        ["name"] = "Zurechtstutzen",
        ["spellId"] = 14268, -- rank 3
        ["spellIcon"] = "ability_rogue_trip",
        ["soundFileName"] = "zurechtstutzen",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["paladin"] = {
      ["hammer_des_zorns"] = {
        ["name"] = "Hammer des Zorns",
        ["spellId"] = 24239, -- rank 3
        ["spellIcon"] = "ability_thunderclap",
        ["soundFileName"] = "hammer_des_zorns",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hammer_der_gerechtigkeit"] = {
        ["name"] = "Hammer der Gerechtigkeit",
        ["spellId"] = 10308, -- rank 4
        ["spellIcon"] = "spell_holy_sealofmight",
        ["soundFileName"] = "hammer_der_gerechtigkeit",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["priest"] = {
      ["verschlingende_seuche"] = {
        ["name"] = "Verschlingende Seuche",
        ["spellId"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["soundFileName"] = "verschlingende_seuche",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blackout"] = {
        ["name"] = "Blackout",
        ["spellId"] = 15326, -- rank 5 (skillpoints)
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["soundFileName"] = "blackout",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["manabrand"] = {
        ["name"] = "Manabrand",
        ["spellId"] = 10876, -- rank 5
        ["spellIcon"] = "spell_shadow_manaburn",
        ["soundFileName"] = "manabrand",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["gedankenkontrolle"] = {
        ["name"] = "Gedankenkontrolle",
        ["spellId"] = 10912, -- rank 3
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["soundFileName"] = "gedankenkontrolle",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["psychischer_schrei"] = {
        ["name"] = "Psychischer Schrei",
        ["spellId"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["soundFileName"] = "psychischer_schrei",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["schattenwort_schmerz"] = {
        ["name"] = "Schattenwort: Schmerz",
        ["spellId"] = 10894, -- rank 8
        ["spellIcon"] = "spell_shadow_shadowwordpain",
        ["soundFileName"] = "schattenwort_schmerz",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["stille"] = {
        ["name"] = "Stille",
        ["spellId"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["soundFileName"] = "stille",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["vampirumarmung"] = {
        ["name"] = "Vampirumarmung",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["soundFileName"] = "vampirumarmung",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["druid"] = {
      ["wucherwurzeln"] = {
        ["name"] = "Wucherwurzeln",
        ["spellId"] = 19970, -- rank 6
        ["spellIcon"] = "spell_nature_stranglevines",
        ["soundFileName"] = "wucherwurzeln",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["feenfeuer"] = {
        ["name"] = "Feenfeuer",
        ["spellId"] = 9907, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "feenfeuer",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["feenfeuer_tiergestalt"] = {
        ["name"] = "Feenfeuer (Tiergestalt)",
        ["spellId"] = 17392, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "feenfeuer",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hieb"] = {
        ["name"] = "Hieb",
        ["spellId"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["soundFileName"] = "hieb",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["wilde_attacke"] = {
        ["name"] = "Wilde Attacke",
        ["spellId"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["soundFileName"] = "wilde_attacke",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["shaman"] = {
      ["erdschock"] = {
        ["name"] = "Erdschock",
        ["spellId"] = 10414, -- rank 7
        ["spellIcon"] = "spell_nature_earthshock",
        ["soundFileName"] = "erdschock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["flammenschock"] = {
        ["name"] = "Flammenschock",
        ["spellId"] = 29228, -- rank 6
        ["spellIcon"] = "spell_fire_flameshock",
        ["soundFileName"] = "flammenschock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frostschock"] = {
        ["name"] = "Frostschock",
        ["spellId"] = 10473, -- rank 4
        ["spellIcon"] = "spell_frost_frostshock",
        ["soundFileName"] = "frostschock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["racials"] = {
      ["kriegsdonner"] = {
        ["name"] = "Kriegsdonner",
        ["spellId"] = 20549,
        ["spellIcon"] = "ability_warstomp",
        ["soundFileName"] = "kriegsdonner",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["items"] = {
      ["gezeiten_gluecksbringer"] = {
        ["name"] = "Gezeiten-Glücksbringer",
        ["itemId"] = 1404,
        ["spellId"] = 835,
        ["spellIcon"] = "inv_misc_rune_01",
        ["soundFileName"] = "gezeiten_gluecksbringer",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["tollkuehnes_stuermen"] = {
        ["name"] = "Tollkühnes Stürmen",
        ["itemId"] = 10588,
        ["spellId"] = 22641,
        ["spellIcon"] = "spell_nature_astralrecal",
        ["soundFileName"] = "raketenhelm",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["net_o_matik"] = {
        ["name"] = "Net-o-Matik",
        ["itemId"] = 10720,
        ["spellId"] = 13120,
        ["spellIcon"] = "inv_misc_net_01",
        ["soundFileName"] = "net_o_matik",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["misc"] = {
      ["thoriumgranate"] = {
        ["name"] = "Thoriumgranate",
        ["itemId"] = 15993,
        ["spellId"] = 19769,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["soundFileName"] = "granate",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["eisengranate"] = {
        ["name"] = "Eisengranate",
        ["itemId"] = 4390,
        ["spellId"] = 4068,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["soundFileName"] = "granate",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    }
  }
else
  spellAvoidMap = {
    ["rogue"] = {
      ["kick"] = {
        ["name"] = "Kick",
        ["spellId"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["soundFileName"] = "kick",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["cheap_shot"] = {
        ["name"] = "Cheap Shot",
        ["spellId"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["soundFileName"] = "cheap_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["gouge"] = {
        ["name"] = "Gouge",
        ["spellId"] = 11286,
        ["spellIcon"] = "ability_gouge",
        ["soundFileName"] = "gouge",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["riposte"] = {
        ["name"] = "Riposte",
        ["spellId"] = 14251,
        ["spellIcon"] = "ability_warrior_challange",
        ["soundFileName"] = "riposte",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["kidney_shot"] = {
        ["name"] = "Kidney Shot",
        ["spellId"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["soundFileName"] = "kidney_shot",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blind"] = {
        ["name"] = "Blind",
        ["spellId"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["soundFileName"] = "blind",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["ghostly_strike"] = {
        ["name"] = "Ghostly Strike",
        ["spellId"] = 14278,
        ["spellIcon"] = "spell_shadow_curse",
        ["soundFileName"] = "ghostly_strike",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["sap"] = {
        ["name"] = "Sap",
        ["spellId"] = 11297, -- rank 3
        ["spellIcon"] = "ability_sap",
        ["soundFileName"] = "sap",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["premeditation"] = {
        ["name"] = "Premeditation",
        ["spellId"] = 14183,
        ["spellIcon"] = "spell_shadow_possession",
        ["soundFileName"] = "premeditation",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["distract"] = {
        ["name"] = "Distract",
        ["spellId"] = 1725,
        ["spellIcon"] = "ability_rogue_distract",
        ["soundFileName"] = "distract",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["expose_armor"] = {
        ["name"] = "Expose Armor",
        ["spellId"] = 11198, -- rank 5
        ["spellIcon"] = "ability_warrior_riposte",
        ["soundFileName"] = "expose_armor",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["garrote"] = {
        ["name"] = "Garrote",
        ["spellId"] = 11290, -- rank 6
        ["spellIcon"] = "ability_rogue_garrote",
        ["soundFileName"] = "garrote",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["rupture"] = {
        ["name"] = "Rupture",
        ["spellId"] = 11275, -- rank 6
        ["spellIcon"] = "ability_rogue_rupture",
        ["soundFileName"] = "rupture",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["warrior"] = {
      ["charge_stun"] = {
        ["name"] = "Charge Stun",
        ["spellId"] = 7922,
        ["spellIcon"] = "ability_warrior_charge",
        ["soundFileName"] = "charge",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hamstring"] = {
        ["name"] = "Hamstring",
        ["spellId"] = 7373, -- rank 3
        ["spellIcon"] = "ability_shockwave",
        ["soundFileName"] = "hamstring",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mortal_strike"] = {
        ["name"] = "Mortal Strike",
        ["spellId"] = 21553, -- rank 4
        ["spellIcon"] = "ability_warrior_savageblow",
        ["soundFileName"] = "mortal_strike",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["overpower"] = {
        ["name"] = "Overpower",
        ["spellId"] = 11585, -- rank 4
        ["spellIcon"] = "ability_meleedamage",
        ["soundFileName"] = "overpower",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["bloodthirst"] = {
        ["name"] = "Bloodthirst",
        ["spellId"] = 23894, -- rank 4
        ["spellIcon"] = "spell_nature_bloodlust",
        ["soundFileName"] = "bloodthirst",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["intercept_stun"] = {
        ["name"] = "Intercept Stun",
        ["spellId"] = 20615,
        ["spellIcon"] = "ability_rogue_sprint",
        ["soundFileName"] = "intercept",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["intimidating_shout"] = {
        ["name"] = "Intimidating Shout",
        ["spellId"] = 5246,
        ["spellIcon"] = "ability_golemthunderclap",
        ["soundFileName"] = "intimidating_shout",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["pummel"] = {
        ["name"] = "Pummel",
        ["spellId"] = 6554, -- rank 2
        ["spellIcon"] = "inv_gauntlets_04",
        ["soundFileName"] = "pummel",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["concussion_blow"] = {
        ["name"] = "Concussion Blow",
        ["spellId"] = 12809,
        ["spellIcon"] = "ability_thunderbolt",
        ["soundFileName"] = "concussion_blow",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["disarm"] = {
        ["name"] = "Disarm",
        ["spellId"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["soundFileName"] = "disarm",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["shield_bash"] = {
        ["name"] = "Shield Bash",
        ["spellId"] = 1672, -- rank 3
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["soundFileName"] = "shield_bash",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["shield_slam"] = {
        ["name"] = "Shield Slam",
        ["spellId"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["soundFileName"] = "shield_slam",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["mage"] = {
      --[[
        mage counterspell is kind of special

        If a player resists the silence the full spellname will be
        Counterspell - Silenced
        Your Counterspell - Silenced was resisted by $player$.

        However if a player is immune to it the name is simply Counterspell
        Your Counterspell failed. $player$ is immune.

        Becaus of that two spells exist in this map one for Counterspell and one for
        Counterspell - Silenced
      ]]--
      ["counterspell_silenced"] = {
        ["name"] = "Counterspell - Silenced",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = false,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["counterspell"] = {
        ["name"] = "Counterspell",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph"] = {
        ["name"] = "Polymorph",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph_cow"] = {
        ["name"] = "Polymorph: Cow",
        ["spellId"] = 28270,
        ["spellIcon"] = "spell_nature_polymorph_cow",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph_pig"] = {
        ["name"] = "Polymorph: Pig",
        ["spellId"] = 28272,
        ["spellIcon"] = "spell_magic_polymorphpig",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph_turtle"] = {
        ["name"] = "Polymorph: Turtle",
        ["spellId"] = 28271,
        ["spellIcon"] = "ability_hunter_pet_turtle",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["cone_of_cold"] = {
        ["name"] = "Cone of Cold",
        ["spellId"] = 10161, -- rank 5
        ["spellIcon"] = "spell_frost_glacier",
        ["soundFileName"] = "cone_of_cold",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frost_nova"] = {
        ["name"] = "Frost Nova",
        ["spellId"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["soundFileName"] = "frost_nova",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["warlock"] = {
      ["curse_of_tongues"] = {
        ["name"] = "Curse of Tongues",
        ["spellId"] = 11719, -- rank 2
        ["spellIcon"] = "spell_shadow_curseoftounges",
        ["soundFileName"] = "curse_of_tongues",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["death_coil"] = {
        ["name"] = "Death Coil",
        ["spellId"] = 17926, -- rank 3
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["soundFileName"] = "death_coil",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["fear"] = {
        ["name"] = "Fear",
        ["spellId"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["soundFileName"] = "fear",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["howl_of_terror"] = {
        ["name"] = "Howl of Terror",
        ["spellId"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["soundFileName"] = "howl_of_terror",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["shadowburn"] = {
        ["name"] = "Shadowburn",
        ["spellId"] = 18871, -- rank 6
        ["spellIcon"] = "spell_shadow_scourgebuild",
        ["soundFileName"] = "shadowburn",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["spell_lock"] = {
        ["name"] = "Spell Lock",
        ["spellId"] = 19647,
        ["spellIcon"] = "spell_shadow_mindrot",
        ["soundFileName"] = "spell_lock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = false
      },
      ["seduction"] = {
        ["name"] = "Seduction",
        ["spellId"] = 6358,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["soundFileName"] = "seduction",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = false
      }
    },
    ["hunter"] = {
      ["aimed_shot"] = {
        ["name"] = "Aimed Shot",
        ["spellId"] = 20904, -- rank 6
        ["spellIcon"] = "inv_spear_07",
        ["soundFileName"] = "aimed_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["concussive_shot"] = {
        ["name"] = "Concussive Shot",
        ["spellId"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["soundFileName"] = "concussive_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["scatter_shot"] = {
        ["name"] = "Scatter Shot",
        ["spellId"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["soundFileName"] = "scatter_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["serpent_sting"] = {
        ["name"] = "Serpent Sting",
        ["spellId"] = 13555, -- rank 8
        ["spellIcon"] = "ability_hunter_quickshot",
        ["soundFileName"] = "serpent_sting",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["viper_sting"] = {
        ["name"] = "Viper Sting",
        ["spellId"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["soundFileName"] = "viper_sting",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["freezing_trap"] = {
        ["name"] = "Freezing Trap",
        ["spellId"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["soundFileName"] = "freezing_trap",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["wing_clip"] = {
        ["name"] = "Wing Clip",
        ["spellId"] = 14268, -- rank 3
        ["spellIcon"] = "ability_rogue_trip",
        ["soundFileName"] = "wing_clip",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["paladin"] = {
      ["hammer_of_wrath"] = {
        ["name"] = "Hammer of Wrath",
        ["spellId"] = 24239, -- rank 3
        ["spellIcon"] = "ability_thunderclap",
        ["soundFileName"] = "hammer_of_wrath",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hammer_of_justice"] = {
        ["name"] = "Hammer of Justice",
        ["spellId"] = 10308, -- rank 4
        ["spellIcon"] = "spell_holy_sealofmight",
        ["soundFileName"] = "hammer_of_justice",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["priest"] = {
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["spellId"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["soundFileName"] = "devouring_plague",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blackout"] = {
        ["name"] = "Blackout",
        ["spellId"] = 15326, -- rank 5 (skillpoints)
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["soundFileName"] = "blackout",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mana_burn"] = {
        ["name"] = "Mana Burn",
        ["spellId"] = 10876, -- rank 5
        ["spellIcon"] = "spell_shadow_manaburn",
        ["soundFileName"] = "mana_burn",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mind_control"] = {
        ["name"] = "Mind Control",
        ["spellId"] = 10912, -- rank 3
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["soundFileName"] = "mind_control",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["psychic_scream"] = {
        ["name"] = "Psychic Scream",
        ["spellId"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["soundFileName"] = "psychic_scream",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["shadow_word_pain"] = {
        ["name"] = "Shadow Word: Pain",
        ["spellId"] = 10894, -- rank 8
        ["spellIcon"] = "spell_shadow_shadowwordpain",
        ["soundFileName"] = "shadow_word_pain",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["silence"] = {
        ["name"] = "Silence",
        ["spellId"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["vampiric_embrace"] = {
        ["name"] = "Vampiric Embrace",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["soundFileName"] = "vampiric_embrace",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["druid"] = {
      ["entangling_roots"] = {
        ["name"] = "Entangling Roots",
        ["spellId"] = 19970, -- rank 6
        ["spellIcon"] = "spell_nature_stranglevines",
        ["soundFileName"] = "entangling_roots",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["faerie_fire"] = {
        ["name"] = "Faerie Fire",
        ["spellId"] = 9907, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "faerie_fire",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["faerie_fire_feral"] = {
        ["name"] = "Farie Fire (Feral)",
        ["spellId"] = 17392, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "faerie_fire",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["bash"] = {
        ["name"] = "Bash",
        ["spellId"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["soundFileName"] = "bash",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["feral_charge_effect"] = {
        ["name"] = "Feral Charge Effect",
        ["spellId"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["soundFileName"] = "feral_charge",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["shaman"] = {
      ["earth_shock"] = {
        ["name"] = "Earth Shock",
        ["spellId"] = 10414, -- rank 7
        ["spellIcon"] = "spell_nature_earthshock",
        ["soundFileName"] = "earth_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["flame_shock"] = {
        ["name"] = "Flame Shock",
        ["spellId"] = 29228, -- rank 6
        ["spellIcon"] = "spell_fire_flameshock",
        ["soundFileName"] = "flame_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frost_shock"] = {
        ["name"] = "Frost Shock",
        ["spellId"] = 10473, -- rank 4
        ["spellIcon"] = "spell_frost_frostshock",
        ["soundFileName"] = "frost_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["racials"] = {
      ["war_stomp"] = {
        ["name"] = "War Stomp",
        ["spellId"] = 20549,
        ["spellIcon"] = "ability_warstomp",
        ["soundFileName"] = "war_stomp",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["items"] = {
      ["tidal_charm"] = {
        ["name"] = "Tidal Charm",
        ["itemId"] = 1404,
        ["spellId"] = 835,
        ["spellIcon"] = "inv_misc_rune_01",
        ["soundFileName"] = "tidal_charm",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["reckless_charge"] = {
        ["name"] = "Reckless Charge",
        ["itemId"] = 10588,
        ["spellId"] = 22641,
        ["spellIcon"] = "spell_nature_astralrecal",
        ["soundFileName"] = "rocket_helmet",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["net_o_matic"] = {
        ["name"] = "Net-o-Matic",
        ["itemId"] = 10720,
        ["spellId"] = 13120,
        ["spellIcon"] = "inv_misc_net_01",
        ["soundFileName"] = "net_o_matic",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["misc"] = {
      ["thorium_grenade"] = {
        ["name"] = "Thorium Grenade",
        ["itemId"] = 15993,
        ["spellId"] = 19769,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["soundFileName"] = "grenade",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["iron_grenade"] = {
        ["name"] = "Iron Grenade",
        ["itemId"] = 4390,
        ["spellId"] = 4068,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["soundFileName"] = "grenade",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    }
  }
end

--[[
  Retrieve a spell from the spellMap by name

  @param {string} name
  @return ({string} {table}) | nil
]]--
function me.SearchByName(name)
  if not name then return nil end

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellAvoidMap", spellName))

  for class, value in pairs(spellAvoidMap) do
    for key, value in pairs(spellAvoidMap[class]) do
      if key == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellAvoidMap", spellName))

        local spell = mod.common.Clone(spellAvoidMap[class][key])
        spell.normalizedSpellName = key -- add normalizedSpellName that would get lost otherwise

        return class, spell
      end
    end
  end

  return nil
end

--[[
  Get map for a certain category

  @param {string} category
  @return {table | nil}
    Map for the passed category
]]--
function me.GetAllForCategory(category)
  if not category then return nil end

  return mod.common.Clone(spellAvoidMap[category])
end
