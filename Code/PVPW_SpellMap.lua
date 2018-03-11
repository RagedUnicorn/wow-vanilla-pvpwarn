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

local mod = pvpw
local me = {}
mod.spellMap = me

me.tag = "SpellMap"

--[[
  ["category"] = {
    e.g warrior, misc etc.
    ["spell_name"] = {
      ["name"] = "Spell Name",
        {string} spellname in ingame format
      ["soundFileName"] = "",
        {string} name of the soundfile
      ["itemID"] = 0000,
        {number} optional item id
      ["spellID"] = 0000,
        {number} id of the spell
      ["spellIcon"] = "some_icon",
        {string} asset name of the icon
      ["hasFade"] = false,
        {boolean} if set to true means there is a sound file to announce Aura down/fade
      ["canCrit"] = false,
        {boolean} optional field, default false if field is missing
      ["active"] = false,
        -- {boolean} Whether the spell is active or inactive
      ["ignoreEvents"] = {
        "CHAT_MSG_SPELL_AURA_GONE_OTHER",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS".
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
      }
        {table} marks events that are ignored for this spell

        Ignoring events:
          CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
            -- helps ignoring the periodic damage from dots
          CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF
            -- helps ignoring heal from debug e.g. from Devouring Plague
          CHAT_MSG_SPELL_AURA_GONE_OTHER
            - helps to ignore the fading of the debuff
          CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS
            - helps ignoring bloodrage ticks
    }
  }
]]--
local spellMap

if (GetLocale() == "deDE") then
  spellMap = {
    ["warrior"] = {
      ["berserkerwut"] = {
        ["name"] = "Berserkerwut",
        ["soundFileName"] = "berserkerwut",
        ["spellID"] = 18499,
        ["spellIcon"] = "spell_nature_ancestralguardian",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["tollkuehnheit"] = {
        ["name"] = "Tollkühnheit",
        ["soundFileName"] = "tollkuehnheit",
        ["spellID"] = 1719,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["todeswunsch"] = {
        ["name"] = "Todeswunsch",
        ["soundFileName"] = "todeswunsch",
        ["spellID"] = 12328,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schildwall"] = {
        ["name"] = "Schildwall",
        ["soundFileName"] = "schildwall",
        ["spellID"] = 871,
        ["spellIcon"] = "ability_warrior_shieldwall",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["kampfhaltung"] = {
        ["name"] = "Kampfhaltung",
        ["soundFileName"] = "kampfhaltung",
        ["spellID"] = 2457,
        ["spellIcon"] = "ability_warrior_offensivestance",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["berserkerhaltung"] = {
        ["name"] = "Berserkerhaltung",
        ["soundFileName"] = "berserkerhaltung",
        ["spellID"] = 2458,
        ["spellIcon"] = "ability_racial_avatar",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["verteidigungshaltung"] = {
        ["name"] = "Verteidigungshaltung",
        ["soundFileName"] = "verteidigungshaltung",
        ["spellID"] = 71,
        ["spellIcon"] = "ability_warrior_defensivestance",
        ["hasFade"] = false,
        ["active"] = true
      },
      -- cannot detect intercept itself, only the stun
      ["sturmangriffsbetaeubung"] = {
        ["name"] = "Sturmangriffsbetäubung",
        ["soundFileName"] = "sturmangriff",
        ["spellID"] = 20615,
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["letztes_gefecht"] = {
        ["name"] = "Letztes Gefecht",
        ["soundFileName"] = "letztes_gefecht",
        ["spellID"] = 12975,
        ["spellIcon"] = "spell_holy_ashestoashes",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["entwaffnen"] = {
        ["name"] = "Entwaffnen",
        ["soundFileName"] = "entwaffnen",
        ["spellID"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["erschuetternder_schlag"] = {
        ["name"] = "Erschütternder Schlag",
        ["soundFileName"] = "erschuetternder_schlag",
        ["spellID"] = 12809,
        ["spellIcon"] = "ability_thunderbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["blutrausch"] = {
        ["name"] = "Blutrausch",
        ["soundFileName"] = "blutrausch",
        ["spellID"] = 2687,
        ["spellIcon"] = "ability_racial_bloodrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
        }
      },
      ["zuschlagen"] = {
        ["name"] = "Zuschlagen",
        ["soundFileName"] = "zuschlagen",
        ["spellID"] = 6552,
        ["spellIcon"] = "inv_gauntlets_04",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      -- cannot detect charge itself, only the stun
      ["betaeubung_abfangen"] = {
        ["name"] = "Betäubung abfangen",
        ["soundFileName"] = "abfangen",
        ["spellID"] = 7922,
        ["spellIcon"] = "ability_warrior_charge",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["drohruf"] = {
        ["name"] = "Drohruf",
        ["soundFileName"] = "drohruf",
        ["spellID"] = 29544,
        ["spellIcon"] = "ability_golemthunderclap",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["schildblock"] = {
        ["name"] = "Schildblock",
        ["soundFileName"] = "schildblock",
        ["spellID"] = 2565,
        ["spellIcon"] = "ability_defend",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schildhieb"] = {
        ["name"] = "Schildhieb",
        ["soundFileName"] = "schildhieb",
        ["spellID"] = 1672,
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["hasFade"] = false,
        ["active"] = true
      },
      -- skilled shield bash has a silence effect
      ["schildhieb_zum_schweigen_gebracht"] = {
        ["name"] = "Schildhieb - zum Schweigen gebracht",
        ["soundFileName"] = "schildhieb_schweigen",
        ["spellID"] = 18498,
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["schildschlag"] = {
        ["name"] = "Schildschlag",
        ["soundFileName"] = "schildschlag",
        ["spellID"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["hasFade"] = false,
        ["active"] = true
      }
    },
    ["priest"] = {
      ["psychischer_schrei"] = {
        ["name"] = "Psychischer Schrei",
        ["soundFileName"] = "psychischer_schrei",
        ["spellID"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["stille"] = {
        ["name"] = "Stille",
        ["soundFileName"] = "stille",
        ["spellID"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["seele_der_macht"] = {
        ["name"] = "Seele der Macht",
        ["soundFileName"] = "seele_der_macht",
        ["spellID"] = 10060,
        ["spellIcon"] = "spell_holy_powerinfusion",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["inneres_feuer"] = {
        ["name"] = "Inneres Feuer",
        ["soundFileName"] = "inneres_feuer",
        ["spellID"] = 10952, -- rank 6
        ["spellIcon"] = "spell_holy_innerfire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["vampirumarmung"] = {
        ["name"] = "Vampirumarmung",
        ["soundFileName"] = "Vampirumarmung",
        ["spellID"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verzweifeltes_gebet"] = {
        ["name"] = "Verzweifeltes Gebet",
        ["soundFileName"] = "verzweifeltes_gebet",
        ["spellID"] = 19243, -- rank 7
        ["spellIcon"] = "spell_holy_restoration",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["verschlingende_seuche"] = {
        ["name"] = "Verschlingende Seuche",
        ["soundFileName"] = "verschlingende_seuche",
        ["spellID"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
        }
      },
      ["beruehrung_der_schwaeche"] = {
        ["name"] = "Berührung der Schwäche",
        ["soundFileName"] = "beruehrung_der_schwaeche",
        ["spellID"] = 19266, -- rank 6
        ["spellIcon"] = "spell_shadow_deadofnight",
        ["hasFade"] = true,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["furchtzauberschutz"] = {
        ["name"] = "Furchtzauberschutz",
        ["soundFileName"] = "furchtzauberschutz",
        ["spellID"] = 6346,
        ["spellIcon"] = "spell_holy_excorcism",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["elunes_anmut"] = {
        ["name"] = "Elunes Anmut",
        ["soundFileName"] = "elunes_anmut",
        ["spellID"] = 19293, -- rank 5
        ["spellIcon"] = "spell_holy_elunesgrace",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["sternensplitter"] = {
        ["name"] = "Sternensplitter",
        ["soundFileName"] = "sternensplitter",
        ["spellID"] = 19305, -- rank 7
        ["spellIcon"] = "spell_arcane_starfire",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verhexung_der_schwaeche"] = {
        ["name"] = "Verhexung der Schwäche",
        ["soundFileName"] = "verhexung_der_schwaeche",
        ["spellID"] = 19285, -- rank 6
        ["spellIcon"] = "spell_shadow_fingerofdeath",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["rogue"] = {
      ["blenden"] = {
        ["name"] = "Blenden",
        ["soundFileName"] = "blenden",
        ["spellID"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["tritt"] = {
        ["name"] = "Tritt",
        ["soundFileName"] = "tritt",
        ["spellID"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["sprinten"] = {
        ["name"] = "Sprinten",
        ["soundFileName"] = "sprinten",
        ["spellID"] = 11305, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["entrinnen"] = {
        ["name"] = "Entrinnen",
        ["soundFileName"] = "entrinnen",
        ["spellID"] = 5277,
        ["spellIcon"] = "spell_shadow_shadowward",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["nierenhieb"] = {
        ["name"] = "Nierenhieb",
        ["soundFileName"] = "nierenhieb",
        ["spellID"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fieser_trick"] = {
        ["name"] = "Fieser Trick",
        ["soundFileName"] = "fieser_trick",
        ["spellID"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["adrenalinrausch"] = {
        ["name"] = "Adrenalinrausch",
        ["soundFileName"] = "adrenalinrausch",
        ["spellID"] = 13750,
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["klingenwirbel"] = {
        ["name"] = "Klingenwirbel",
        ["soundFileName"] = "klingenwirbel",
        ["spellID"] = 13877,
        ["spellIcon"] = "ability_warrior_punishingblow",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["kaltbluetigkeit"] = {
        ["name"] = "Kaltblütigkeit",
        ["soundFileName"] = "kaltbluetigkeit",
        ["spellID"] = 14177,
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true
      }
    },
    ["mage"] = {
      ["eisblock"] = {
        ["name"] = "Eisblock",
        ["soundFileName"] = "eisblock",
        ["spellID"] = 11958,
        ["spellIcon"] = "spell_frost_frost",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["verwandlung"] = {
        ["name"] = "Verwandlung",
        ["soundFileName"] = "verwandlung",
        ["spellID"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verwandlung_kuh"] = {
        ["name"] = "Verwandlung: Kuh",
        ["soundFileName"] = "verwandlung",
        ["spellID"] = 28270,
        ["spellIcon"] = "spell_nature_polymorph_cow",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verwandlung_schwein"] = {
        ["name"] = "Verwandlung: Schwein",
        ["soundFileName"] = "verwandlung",
        ["spellID"] = 28272,
        ["spellIcon"] = "spell_magic_polymorphpig",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verwandlung_kroete"] = {
        ["name"] = "Verwandlung: Kröte",
        ["soundFileName"] = "verwandlung",
        ["spellID"] = 28271,
        ["spellIcon"] = "ability_hunter_pet_turtle",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["blinzeln"] = {
        ["name"] = "Blinzeln",
        ["soundFileName"] = "blinzeln",
        ["spellID"] = 1953,
        ["spellIcon"] = "spell_arcane_blink",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["feuerzauberschutz"] = {
        ["name"] = "Feuerzauberschutz",
        ["soundFileName"] = "feuerzauberschutz",
        ["spellID"] = 10226, -- rank 5
        ["spellIcon"] = "spell_fire_firearmor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frostzauberschutz"] = {
        ["name"] = "Frostzauberschutz",
        ["soundFileName"] = "frostzauberschutz",
        ["spellID"] = 28609, -- rank 5
        ["spellIcon"] = "spell_frost_frostward",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gegenzauber_zum_schweigen_gebracht"] = {
        ["name"] = "Gegenzauber - zum Schweigen gebracht",
        ["soundFileName"] = "gegenzauber",
        ["spellID"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["manaschild"] = {
        ["name"] = "Manaschild",
        ["soundFileName"] = "manaschild",
        ["spellID"] = 10193, -- rank 6
        ["spellIcon"] = "spell_shadow_detectlesserinvisibility",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["eisbarriere"] = {
        ["name"] = "Eisbarriere",
        ["soundFileName"] = "eisbarriere",
        ["spellID"] = 13033, -- rank 4
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frostnova"] = {
        ["name"] = "Frostnova",
        ["soundFileName"] = "frostnova",
        ["spellID"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["arkane_macht"] = {
        ["name"] = "Arkane Macht",
        ["soundFileName"] = "arkane_macht",
        ["spellID"] = 12042,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hervorrufung"] = {
        ["name"] = "Hervorrufung",
        ["soundFileName"] = "hervorrufung",
        ["spellID"] = 12051,
        ["spellIcon"] = "spell_nature_purge",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["geistesgegenwart"] = {
        ["name"] = "Geistesgegenwart",
        ["soundFileName"] = "geistesgegenwart",
        ["spellID"] = 12043,
        ["spellIcon"] = "spell_nature_enchantarmor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["verbrennung"] = {
        ["name"] = "Verbrennung",
        ["soundFileName"] = "verbrennung",
        ["spellID"] = 11129,
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["druckwelle"] = {
        ["name"] = "Druckwelle",
        ["soundFileName"] = "druckwelle",
        ["spellID"] = 13021, -- rank 5
        ["spellIcon"] = "spell_holy_excorcism_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["hunter"] = {
      ["erschuetternder_schuss"] = {
        ["name"] = "Erschütternder Schuss",
        ["soundFileName"] = "erschuetternder_schuss",
        ["spellID"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["verbesserter_erschuetternder_schuss"] = {
        ["name"] = "Verbesserter erschütternder Schuss",
        ["soundFileName"] = "erschuetternder_schuss",
        ["spellID"] = 19410,
        ["spellIcon"] = "spell_frost_stun",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["aspekt_des_affen"] = {
        ["name"] = "Aspekt des Affen",
        ["soundFileName"] = "aspekt_des_affen",
        ["spellID"] = 13163,
        ["spellIcon"] = "ability_hunter_aspectofthemonkey",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["aspekt_des_falken"] = {
        ["name"] = "Aspekt des Falken",
        ["soundFileName"] = "aspekt_des_falken",
        ["spellID"] = 25296, -- rank 7
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["schnellfeuer"] = {
        ["name"] = "Schnellfeuer",
        ["soundFileName"] = "schnellfeuer",
        ["spellID"] = 3045,
        ["spellIcon"] = "ability_hunter_runningshot",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["abschreckung"] = {
        ["name"] = "Abschreckung",
        ["soundFileName"] = "abschreckung",
        ["spellID"] = 19263,
        ["spellIcon"] = "ability_whirlwind",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["sprengfalle"] = {
        ["name"] = "Sprengfalle",
        ["soundFileName"] = "sprengfalle",
        ["spellID"] = 14317, -- rank 3
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["eiskaeltefalle"] = {
        ["name"] = "Eiskältefalle",
        ["soundFileName"] = "eiskaeltefalle",
        ["spellID"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["feuerbrandfalle"] = {
        ["name"] = "Feuerbrandfalle",
        ["soundFileName"] = "feuerbrandfalle",
        ["spellID"] = 14305, -- rank 5
        ["spellIcon"] = "spell_fire_flameshock",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["frostfalle"] = {
        ["name"] = "Frostfalle",
        ["soundFileName"] = "frostfalle",
        ["spellID"] = 13809,
        ["spellIcon"] = "spell_frost_freezingbreath",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["stich_des_fluegeldrachen"] = {
        ["name"] = "Stich des Flügeldrachen",
        ["soundFileName"] = "stich_des_fluegeldrachen",
        ["spellID"] = 24135,
        ["spellIcon"] = "inv_spear_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
           -- TODO this might be a private server bug. Should a target really get a buff
           -- that he can dismiss by right clicking? Shouldn't he get a debuff?!
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
        }
      },
      ["vipernbiss"] = {
        ["name"] = "Vipernbiss",
        ["soundFileName"] = "vipernbiss",
        ["spellID"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["streuschuss"] = {
        ["name"] = "Streuschuss",
        ["soundFileName"] = "streuschuss",
        ["spellID"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["leuchtfeuer"] = {
        ["name"] = "Leuchtfeuer",
        ["soundFileName"] = "leuchtfeuer",
        ["spellID"] = 1543,
        ["spellIcon"] = "spell_fire_flare",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["wildtier_aengstigen"] = {
        ["name"] = "Wildtier ängstigen",
        ["soundFileName"] = "wildtier_aengstigen",
        ["spellID"] = 14327,
        ["spellIcon"] = "ability_druid_cower",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["einschuechterung"] = {
        ["name"] = "Einschüchterung",
        ["soundFileName"] = "einschuechterung",
        ["spellID"] = 24394,
        ["spellIcon"] = "ability_devour",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["zorn_des_wildtiers"] = {
        ["name"] = "Zorn des Wildtiers",
        ["soundFileName"] = "zorn_des_wildtiers",
        ["spellID"] = 19574,
        ["spellIcon"] = "ability_druid_ferociousbite",
        ["hasFade"] = true,
        ["active"] = true
      }
      --[[,
      -- not trackable in the combat log
      ["totstellen"] = {
        ["name"] = "Totstellen",
        ["soundFileName"] = "totstellen",
        ["spellID"] = 5384,
        ["spellIcon"] = "ability_rogue_feigndeath",
        ["active"] = true
      }]]--
    },
    ["warlock"] = {
      ["furcht"] = {
        ["name"] = "Furcht",
        ["soundFileName"] = "furcht",
        ["spellID"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["teufelsbeherschung"] = {
        ["name"] = "Teufelsbeherschung",
        ["soundFileName"] = "teufelsbeherschung",
        ["spellID"] = 18708,
        ["spellIcon"] = "spell_nature_removecurse",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schattenbrand"] = {
        ["name"] = "Schattenbrand",
        ["soundFileName"] = "schattenbrand",
        ["spellID"] = 18871, -- rank 6
        ["spellIcon"] = "spell_shadow_scourgebuild",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["schattenzauberschutz"] = {
        ["name"] = "Schattenzauberschutz",
        ["soundFileName"] = "schattenzauberschutz",
        ["spellID"] = 28610, -- rank 4
        ["spellIcon"] = "spell_shadow_antishadow",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schreckensgeheul"] = {
        ["name"] = "Schreckensgeheul",
        ["soundFileName"] = "schreckensgeheul",
        ["spellID"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["zauberstein"] = {
        ["name"] = "Zauberstein",
        ["soundFileName"] = "zauberstein",
        ["spellID"] = 128,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["erheblicher_zauberstein"] = {
        ["name"] = "Erheblicher Zauberstein",
        ["soundFileName"] = "erheblicher_zauberstein",
        ["spellID"] = 17729,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["grosser_zauberstein"] = {
        ["name"] = "Großer Zauberstein",
        ["soundFileName"] = "grosser_zauberstein",
        ["spellID"] = 17730,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["todesmantel"] = {
        ["name"] = "Todesmantel",
        ["soundFileName"] = "todesmantel",
        ["spellID"] = 17926,
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fluch_verstaerken"] = {
        ["name"] = "Fluch verstärken",
        ["soundFileName"] = "fluch_verstaerken",
        ["spellID"] = 18288,
        ["spellIcon"] = "spell_shadow_contagion",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schwacher_gesundheitsstein"] = {
        ["name"] = "Schwacher Gesundheitsstein",
        ["soundFileName"] = "schwacher_gesundheitsstein",
        ["spellID"] = 6262,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["geringer_gesundheitsstein"] = {
        ["name"] = "Geringer Gesundheitsstein",
        ["soundFileName"] = "geringer_gesundheitsstein",
        ["spellID"] = 6263,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["grosser_gesundheitsstein"] = {
        ["name"] = "Großer Gesundheitsstein",
        ["soundFileName"] = "grosser_gesundheitsstein",
        ["spellID"] = 5723,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["erheblicher_gesundheitsstein"] = {
        ["name"] = "Erheblicher Gesundheitsstein",
        ["soundFileName"] = "erheblicher_gesundheitsstein",
        ["spellID"] = 11732,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["fluch_der_erschoepfung"] = {
        ["name"] = "Fluch der Erschöpfung",
        ["soundFileName"] = "fluch_der_erschoepfung",
        ["spellID"] = 18223,
        ["spellIcon"] = "spell_shadow_grimward",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fluch_der_sprachen"] = {
        ["name"] = "Fluch der Sprachen",
        ["soundFileName"] = "fluch_der_sprachen",
        ["spellID"] = 11719, -- rank 2
        ["spellIcon"] = "spell_shadow_curseoftounges",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      -- soulstone buff effect (name does not depend on the rank)
      ["seelenstein_auferstehung"] = {
        ["name"] = "Seelenstein-Auferstehung",
        ["soundFileName"] = "seelenstein",
        ["spellID"] = 20764, -- greater soulstone
        ["spellIcon"] = "spell_shadow_soulgem",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["zaubersperre"] = {
        ["name"] = "Zaubersperre",
        ["soundFileName"] = "zaubersperre",
        ["spellID"] = 19647,
        ["spellIcon"] = "spell_shadow_mindrot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      -- triggers twice because both the owner and the pet receive the buff
      ["seelenverbindung"] = {
        ["name"] = "Seelenverbindung",
        ["soundFileName"] = "seelenverbindung",
        ["spellID"] = 19028,
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["verfuehrung"] = {
        ["name"] = "Verführung",
        ["soundFileName"] = "verfuehrung",
        ["spellID"] = 6358,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["paladin"] = {
      ["aura_der_hingabe"] = {
        ["name"] = "Aura der Hingabe",
        ["soundFileName"] = "aura_der_hingabe",
        ["spellID"] = 10293, -- rank 7
        ["spellIcon"] = "spell_holy_devotionaura",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["aura_der_vergeltung"] = {
        ["name"] = "Aura der Vergeltung",
        ["soundFileName"] = "aura_der_vergeltung",
        ["spellID"] = 10301, -- rank 5
        ["spellIcon"] = "spell_holy_auraoflight",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["aura_der_konzentration"] = {
        ["name"] = "Aura der Konzentration",
        ["soundFileName"] = "aura_der_konzentration",
        ["spellID"] = 19746,
        ["spellIcon"] = "spell_holy_mindsooth",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["aura_des_schattenwiderstands"] = {
        ["name"] = "Aura des Schattenwiderstands",
        ["soundFileName"] = "aura_des_schattenwiderstands",
        ["spellID"] = 19896,
        ["spellIcon"] = "spell_shadow_sealofkings",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["aura_des_frostwiderstands"] = {
        ["name"] = "Aura des Frostwiderstands",
        ["soundFileName"] = "aura_des_frostwiderstands",
        ["spellID"] = 19898, -- rank 3
        ["spellIcon"] = "spell_frost_wizardmark",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["aura_des_feuerwiderstands"] = {
        ["name"] = "Aura des Feuerwiderstands",
        ["soundFileName"] = "aura_des_feuerwiderstands",
        ["spellID"] = 19900, -- rank 3
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hammer_des_zorns"] = {
        ["name"] = "Hammer des Zorns",
        ["soundFileName"] = "hammer_des_zorns",
        ["spellID"] = 24239, -- rank 3
        ["spellIcon"] = "ability_thunderclap",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["segen_des_schutzes"] = {
        ["name"] = "Segen des Schutzes",
        ["soundFileName"] = "segen_des_schutzes",
        ["spellID"] = 10278, -- rank 3
        ["spellIcon"] = "spell_holy_sealofprotection",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["segen_der_freiheit"] = {
        ["name"] = "Segen der Freiheit",
        ["soundFileName"] = "segen_der_freiheit",
        ["spellID"] = 1044,
        ["spellIcon"] = "spell_holy_sealofvalor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["segen_der_opferung"] = {
        ["name"] = "Segen der Opferung",
        ["soundFileName"] = "segen_der_opferung",
        ["spellID"] = 20729,
        ["spellIcon"] = "spell_holy_sealofsacrifice",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hammer_der_gerechtigkeit"] = {
        ["name"] = "Hammer der Gerechtigkeit",
        ["soundFileName"] = "hammer_der_gerechtigkeit",
        ["spellID"] = 10308,
        ["spellIcon"] = "spell_holy_sealofmight",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["busse"] = {
        ["name"] = "Buße",
        ["soundFileName"] = "busse",
        ["spellID"] = 20066,
        ["spellIcon"] = "spell_holy_prayerofhealing",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["handauflegung"] = {
        ["name"] = "Handauflegung",
        ["soundFileName"] = "handauflegung",
        ["spellID"] = 10310, -- rank 3
        ["spellIcon"] = "spell_holy_layonhands",
        ["hasFade"] = true,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["gottesschild"] = {
        ["name"] = "Gottesschild",
        ["soundFileName"] = "gottesschild",
        ["spellID"] = 642, -- rank 2
        ["spellIcon"] = "spell_holy_divineintervention",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["goettliche_gunst"] = {
        ["name"] = "Göttliche Gunst",
        ["soundFileName"] = "goettliche_gunst",
        ["spellID"] = 20216,
        ["spellIcon"] = "spell_holy_heal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["vorahnung"] = {
        ["name"] = "Vorahnung",
        ["soundFileName"] = "vorahnung",
        ["spellID"] = 25771,
        ["spellIcon"] = "spell_holy_removecurse",
        ["hasFade"] = true,
        ["active"] = true
      }
    },
    ["druid"] = {
      ["baumrinde"] = {
        ["name"] = "Baumrinde",
        ["soundFileName"] = "baumrinde",
        ["spellID"] = 22812,
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["griff_der_natur"] = {
        ["name"] = "Griff der Natur",
        ["soundFileName"] = "griff_der_natur",
        ["spellID"] = 17329, -- rank 6
        ["spellIcon"] = "spell_nature_natureswrath",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hieb"] = {
        ["name"] = "Hieb",
        ["soundFileName"] = "hieb",
        ["spellID"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["wilde_attacke"] = {
        ["name"] = "Wilde Attacke",
        ["soundFileName"] = "wilde_attacke",
        ["spellID"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["rasende_regeneration"] = {
        ["name"] = "Rasende Regeneration",
        ["soundFileName"] = "rasende_regeneration",
        ["spellID"] = 22896, -- rank 3
        ["spellIcon"] = "ability_bullrush",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["vergiftung_aufheben"] = {
        ["name"] = "Vergiftung aufheben",
        ["soundFileName"] = "vergiftung_aufheben",
        ["spellID"] = 2893,
        ["spellIcon"] = "spell_nature_nullifypoison_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["anregen"] = {
        ["name"] = "Anregen",
        ["soundFileName"] = "anregen",
        ["spellID"] = 29166,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schnelligkeit_der_natur"] = {
        ["name"] = "Schnelligkeit der Natur",
        ["soundFileName"] = "schnelligkeit_der_natur",
        ["spellID"] = 17116,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["feenfeuer"] = {
        ["name"] = "Feenfeuer",
        ["soundFileName"] = "feenfeuer",
        ["spellID"] = 9907,
        ["spellIcon"] = "spell_nature_faeriefire",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["shaman"] = {
      ["elementarbeherrschung"] = {
        ["name"] = "Elementarbeherrschung",
        ["soundFileName"] = "elementarbeherrschung",
        ["spellID"] = 16166,
        ["spellIcon"] = "spell_nature_wispheal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schnelligkeit_der_natur"] = {
        ["name"] = "Schnelligkeit der Natur",
        ["soundFileName"] = "schnelligkeit_der_natur",
        ["spellID"] = 16188,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["totem_des_erdstosses"] = {
        ["name"] = "Totem des Erdstoßes",
        ["soundFileName"] = "totem_des_erdstosses",
        ["spellID"] = 8143,
        ["spellIcon"] = "spell_nature_tremortotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_giftreinigung"] = {
        ["name"] = "Totem der Giftreinigung",
        ["soundFileName"] = "totem_der_giftreinigung",
        ["spellID"] = 8166,
        ["spellIcon"] = "spell_nature_poisoncleansingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_erdung"] = {
        ["name"] = "Totem der Erdung",
        ["soundFileName"] = "totem_der_erdung",
        ["spellID"] = 8177,
        ["spellIcon"] = "spell_nature_groundingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_des_feuerwiderstands"] = {
        ["name"] = "Totem des Feuerwiderstands",
        ["soundFileName"] = "totem_des_feuerwiderstands",
        ["spellID"] = 10538, -- rank 3
        ["spellIcon"] = "spell_fireresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_flammenzunge"] = {
        ["name"] = "Totem der Flammenzunge",
        ["soundFileName"] = "totem_der_flammenzunge",
        ["spellID"] = 16387, -- rank 4
        ["spellIcon"] = "spell_nature_guardianward",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_luftgleichen_anmut"] = {
        ["name"] = "Totem der luftgleichen Anmut",
        ["soundFileName"] = "totem_der_luftgleichen_anmut",
        ["spellID"] = 25359, -- rank 3
        ["spellIcon"] = "spell_nature_invisibilitytotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_des_naturwiderstands"] = {
        ["name"] = "Totem des Naturwiderstands",
        ["soundFileName"] = "totem_des_naturwiderstands",
        ["spellID"] = 10601, -- rank 3
        ["spellIcon"] = "spell_nature_natureresistancetotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_steinhaut"] = {
        ["name"] = "Totem der Steinhaut",
        ["soundFileName"] = "totem_der_steinhaut",
        ["spellID"] = 10408, -- rank 6
        ["spellIcon"] = "spell_nature_stoneskintotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_erdstaerke"] = {
        ["name"] = "Totem der Erdstärke",
        ["soundFileName"] = "totem_der_erdstaerke",
        ["spellID"] = 25361, -- rank 5
        ["spellIcon"] = "spell_nature_earthbindtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_des_windzorns"] = {
        ["name"] = "Totem des Windzorns",
        ["soundFileName"] = "totem_des_windzorns",
        ["spellID"] = 10610, -- rank 3
        ["spellIcon"] = "spell_nature_windfury",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_windmauer"] = {
        ["name"] = "Totem der Windmauer",
        ["soundFileName"] = "totem_der_windmauer",
        ["spellID"] = 15112, -- rank 3
        ["spellIcon"] = "spell_nature_earthbind",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_erdbindung"] = {
        ["name"] = "Totem der Erdbindung",
        ["soundFileName"] = "totem_der_erdbindung",
        ["spellID"] = 2484,
        ["spellIcon"] = "spell_nature_strengthofearthtotem02",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_feuernova"] = {
        ["name"] = "Totem der Feuernova",
        ["soundFileName"] = "totem_der_feuernova",
        ["spellID"] = 11315, -- rank 5
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_gluehenden_magma"] = {
        ["name"] = "Totem der glühenden Magma",
        ["soundFileName"] = "totem_der_gluehenden_magma",
        ["spellID"] = 10587, -- rank 4
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_verbrennung"] = {
        ["name"] = "Totem der Verbrennung",
        ["soundFileName"] = "totem_der_verbrennung",
        ["spellID"] = 10438, -- rank 6
        ["spellIcon"] = "spell_fire_searingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_steinklaue"] = {
        ["name"] = "Totem der Steinklaue",
        ["soundFileName"] = "totem_der_steinklaue",
        ["spellID"] = 10428, -- rank 6
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_des_frostwiderstands"] = {
        ["name"] = "Totem des Frostwiderstands",
        ["soundFileName"] = "totem_des_frostwiderstands",
        ["spellID"] = 10479, -- rank 3
        ["spellIcon"] = "spell_frostresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_des_heilenden_flusses"] = {
        ["name"] = "Totem des heilenden Flusses",
        ["soundFileName"] = "totem_des_heilenden_flusses",
        ["spellID"] = 10463, -- rank 5
        ["spellIcon"] = "inv_spear_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_krankheitsreinigung"] = {
        ["name"] = "Totem der Krankheitsreinigung",
        ["soundFileName"] = "totem_der_krankheitsreinigung",
        ["spellID"] = 8170,
        ["spellIcon"] = "spell_nature_diseasecleansingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_manaquelle"] = {
        ["name"] = "Totem der Manaquelle",
        ["soundFileName"] = "totem_der_manaquelle",
        ["spellID"] = 10497, -- rank 4
        ["spellIcon"] = "spell_nature_manaregentotem",
        ["active"] = true
      },
      ["totem_der_manaflut"] = {
        ["name"] = "Totem der Manaflut",
        ["soundFileName"] = "totem_der_manaflut",
        ["spellID"] = 17359, -- rank 3
        ["spellIcon"] = "spell_frost_summonwaterelemental",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["totem_der_beruhigenden_winde"] = {
        ["name"] = "Totem der beruhigenden Winde",
        ["soundFileName"] = "totem_der_beruhigenden_winde",
        ["spellID"] = 25908,
        ["spellIcon"] = "spell_nature_brilliance",
        ["hasFade"] = false,
        ["active"] = true
      }
    },
    ["racials"] = {
      ["wachsamkeit"] = {
        ["name"] = "Wachsamkeit",
        ["soundFileName"] = "wachsamkeit",
        ["spellID"] = 20600,
        ["spellIcon"] = "spell_nature_sleep",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["wille_der_verlassenen"] = {
        ["name"] = "Wille der Verlassenen",
        ["soundFileName"] = "wille_der_verlassenen",
        ["spellID"] = 7744,
        ["spellIcon"] = "spell_shadow_raisedead",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["steingestalt"] = {
        ["name"] = "Steingestalt",
        ["soundFileName"] = "steingestalt",
        ["spellID"] = 20594,
        ["spellIcon"] = "spell_shadow_unholystrength",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["entfesselungskuenstler"] = {
        ["name"] = "Entfesselungskünstler",
        ["soundFileName"] = "entfesselungskuenstler",
        ["spellID"] = 20589,
        ["spellIcon"] = "ability_rogue_trip",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["kriegsdonner"] = {
        ["name"] = "Kriegsdonner",
        ["soundFileName"] = "kriegsdonner",
        ["spellID"] = 20549,
        ["spellIcon"] = "ability_warstomp",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["berserker"] = {
        ["name"] = "Berserker",
        ["soundFileName"] = "berserker",
        ["spellID"] = 26296, -- depending on mana, rage, energy
        ["spellIcon"] = "racial_troll_berserk",
        ["hasFade"] = true,
        ["active"] = true
      },
      --[[
        Only the fading of shadowmeld actually shows up in the combat log
      ]]--
      ["schattenhaftigkeit"] = {
        ["name"] = "Schattenhaftigkeit",
        ["soundFileName"] = "schattenhaftigkeit",
        ["spellID"] = 20580,
        ["spellIcon"] = "ability_ambush",
        ["hasFade"] = true,
        ["active"] = true
      },
      --[[ blood fury is not showing in combat log or any event
      ["kochendes_blut"] = {
        ["name"] = "Kochendes Blut",
        ["soundFileName"] = "",
        ["spellID"] = 20572,
        ["spellIcon"] = "racial_orc_berserkerstrength",
        ["hasFade"] = false,
        ["active"] = true
      }
      --]]
    },
    ["items"] = {
      ["koerperlicher_schutz"] = {
        ["name"] = "Körperlicher Schutz",
        ["soundFileName"] = "koerperlicher_schutz",
        ["itemID"] = 19024,
        ["spellID"] = 23506,
        ["spellIcon"] = "inv_misc_armorkit_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["sproede_ruestung"] = {
        ["name"] = "Spröde Rüstung",
        ["soundFileName"] = "sproede_ruestung",
        ["itemID"] = 19948,
        ["spellID"] = 24590,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["panzer_des_wuehlers"] = {
        ["name"] = "Panzer des Wühlers",
        ["soundFileName"] = "panzer_des_wuehlers",
        ["itemID"] = 23558,
        ["spellID"] = 29506,
        ["spellIcon"] = "inv_shield_23",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["ephemere_macht"] = {
        ["name"] = "Ephemere Macht",
        ["soundFileName"] = "ephemere_macht",
        ["itemID"] = 18820,
        ["spellID"] = 23271,
        ["spellIcon"] = "inv_misc_stonetablet_11",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["essenz_saphirons"] = {
        ["name"] = "Essenz Saphirons",
        ["soundFileName"] = "essenz_saphirons",
        ["itemID"] = 23046,
        ["spellID"] = 28779,
        ["spellIcon"] = "inv_trinket_naxxramas06",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["feuerreflektor"] = {
        ["name"] = "Feuerreflektor",
        ["soundFileName"] = "feuerreflektor",
        ["itemID"] = 18638,
        ["spellID"] = 23097,
        ["spellIcon"] = "inv_misc_enggizmos_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["fliehen"] = {
        ["name"] = "Fliehen",
        ["soundFileName"] = "fliehen",
        ["itemID"] = 4984,
        ["spellID"] = 5024,
        ["spellIcon"] = "inv_misc_bone_elfskull_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frostreflektor"] = {
        ["name"] = "Frostreflektor",
        ["soundFileName"] = "frostreflektor",
        ["itemID"] = 18634,
        ["spellID"] = 23131,
        ["spellIcon"] = "inv_misc_enggizmos_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["geschenk_des_lebens"] = {
        ["name"] = "Geschenk des Lebens",
        ["soundFileName"] = "geschenk_des_lebens",
        ["itemID"] = 19341,
        ["spellID"] = 23725,
        ["spellIcon"] = "inv_misc_gem_pearl_05",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["immunitaet_gegen_unbeweglichkeit"] = {
        ["name"] = "Immunität gegen Unbeweglichkeit",
        ["soundFileName"] = "immunitaet_gegen_unbeweglichkeit",
        ["itemID"] = 4328,
        ["spellID"] = 9774,
        ["spellIcon"] = "inv_belt_25",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gedankensprung"] = {
        ["name"] = "Gedankensprung",
        ["soundFileName"] = "gedankensprung",
        ["itemID"] = 19339,
        ["spellID"] = 23723,
        ["spellIcon"] = "spell_nature_wispheal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["tollkuehnes_stuermen"] = {
        ["name"] = "Tollkühnes Stürmen",
        ["soundFileName"] = "raketenhelm",
        ["itemID"] = 10588,
        ["spellID"] = 22641,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["ruhelose_staerke"] = {
        ["name"] = "Ruhelose Stärke",
        ["soundFileName"] = "ruhelose_staerke",
        ["itemID"] = 19949,
        ["spellID"] = 24661,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gnomen_raketenstiefel"] = {
        ["name"] = "Gnomen-Raketenstiefel",
        ["soundFileName"] = "gnomen_raketenstiefel",
        ["itemID"] = 10724,
        ["spellID"] = 13141,
        ["spellIcon"] = "inv_boots_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["goblin_raketenstiefel"] = {
        ["name"] = "Goblin-Raketenstiefel",
        ["soundFileName"] = "goblin_raketenstiefel",
        ["itemID"] = 7189,
        ["spellID"] = 8892,
        ["spellIcon"] = "inv_gizmo_rocketboot_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["schattenreflektor"] = {
        ["name"] = "Schattenreflektor",
        ["soundFileName"] = "schattenreflektor",
        ["itemID"] = 18639,
        ["spellID"] = 23132,
        ["spellIcon"] = "inv_misc_enggizmos_16",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["wappen_des_schlaechters"] = {
        ["name"] = "Wappen des Schlächters",
        ["soundFileName"] = "wappen_des_schlaechters",
        ["itemID"] = 23041,
        ["spellID"] = 28777,
        ["spellIcon"] = "inv_trinket_naxxramas03",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["instabile_macht"] = {
        ["name"] = "Instabile Macht",
        ["soundFileName"] = "instabile_macht",
        ["itemID"] = 19950,
        ["spellID"] = 24658,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gifttotem"] = {
        ["name"] = "Gifttotem",
        ["soundFileName"] = "gifttotem",
        ["itemID"] = 19342,
        ["spellID"] = 23726,
        ["spellIcon"] = "inv_misc_idol_03",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gezeiten_gluecksbringer"] = {
        ["name"] = "Gezeiten-Glücksbringer",
        ["soundFileName"] = "gezeiten_gluecksbringer",
        ["itemID"] = 1404,
        ["spellID"] = 835,
        ["spellIcon"] = "inv_misc_rune_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["erdstoss"] = {
        ["name"] = "Erdstoß",
        ["soundFileName"] = "erdstoss",
        ["itemID"] = 21180,
        ["spellID"] = 25891,
        ["spellIcon"] = "spell_nature_abolishmagic",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["net_o_matik"] = {
        ["name"] = "Net-o-Matik",
        ["soundFileName"] = "net_o_matik",
        ["itemID"] = 10720,
        ["spellID"] = 13120,
        ["spellIcon"] = "ability_ensnare",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["gnomen_gedankenkontrollkappe"] = {
        ["name"] = "Gnomen-Gedankenkontrollkappe",
        ["soundFileName"] = "gedankenkontrollkappe",
        ["itemID"] = 10726,
        ["spellID"] = 13180,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        -- optional to ignore those events because the target will be friendly and automatically ignored
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["misc"] = {
      ["energie_wiederherstellen"] = {
        ["name"] = "Disteltee",
        ["soundFileName"] = "disteltee",
        ["itemID"] = 7676,
        ["spellID"] = 9512,
        ["spellIcon"] = "inv_drink_milk_05",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["regeneration"] = {
        ["name"] = "Regenerationstrank",
        ["soundFileName"] = "regeneration",
        ["itemID"] = 9030,
        ["spellID"] = 11359,
        ["spellIcon"] = "inv_potion_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["erste_hilfe"] = {
        ["name"] = "Erste Hilfe",
        ["soundFileName"] = "erste_hilfe",
        ["itemID"] = 14530, -- depending on what bandage was used
        ["spellID"] = 18610, -- rank 10
        ["spellIcon"] = "inv_misc_bandage_12",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["unverwundbarkeit"] = {
        ["name"] = "Unverwundbarkeit",
        ["soundFileName"] = "unverwundbarkeit",
        ["itemID"] = 3387,
        ["spellID"] = 3169,
        ["spellIcon"] = "inv_potion_62",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["freie_aktion"] = {
        ["name"] = "Freie Aktion",
        ["soundFileName"] = "freie_aktion",
        ["itemID"] = 5634,
        ["spellID"] = 6615,
        ["spellIcon"] = "inv_potion_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["thoriumgranate"] = {
        ["name"] = "Thoriumgranate",
        ["soundFileName"] = "granate",
        ["itemID"] = 15993,
        ["spellID"] = 19769,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["eisengranate"] = {
        ["name"] = "Eisengranate",
        ["soundFileName"] = "granate",
        ["itemID"] = 4390,
        ["spellID"] = 4068,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["schattenschutz"] = {
        ["name"] = "Schattenschutztrank",
        ["soundFileName"] = "schattenschutz",
        ["itemID"] = 13459,
        ["spellID"] = 17548,
        ["spellIcon"] = "inv_potion_23",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frostschutz"] = {
        ["name"] = "Frostschutztrank",
        ["soundFileName"] = "frostschutz",
        ["itemID"] = 13456,
        ["spellID"] = 17544,
        ["spellIcon"] = "inv_potion_20",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["feuerschutz"] = {
        ["name"] = "Feuerschutztrank",
        ["soundFileName"] = "feuerschutz",
        ["itemID"] = 13457,
        ["spellID"] = 17543,
        ["spellIcon"] = "inv_potion_24",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["naturschutz"] = {
        ["name"] = "Naturschutztrank",
        ["soundFileName"] = "naturschutz",
        ["itemID"] = 13458,
        ["spellID"] = 17546,
        ["spellIcon"] = "inv_potion_22",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["arkanschutz"] = {
        ["name"] = "Arkanschutztrank",
        ["soundFileName"] = "arkanschutz",
        ["itemID"] = 13461,
        ["spellID"] = 17549,
        ["spellIcon"] = "inv_potion_83",
        ["hasFade"] = true,
        ["active"] = true
      }
    }
  }
else
  spellMap = {
    ["warrior"] = {
      ["berserker_rage"] = {
        ["name"] = "Berserker Rage",
        ["soundFileName"] = "berserker_rage",
        ["spellID"] = 18499,
        ["spellIcon"] = "spell_nature_ancestralguardian",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["recklessness"] = {
        ["name"] = "Recklessness",
        ["soundFileName"] = "recklessness",
        ["spellID"] = 1719,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["death_wish"] = {
        ["name"] = "Death Wish",
        ["soundFileName"] = "death_wish",
        ["spellID"] = 12328,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["shield_wall"] = {
        ["name"] = "Shield Wall",
        ["soundFileName"] = "shield_wall",
        ["spellID"] = 871,
        ["spellIcon"] = "ability_warrior_shieldwall",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["battle_stance"] = {
        ["name"] = "Battle Stance",
        ["soundFileName"] = "battle_stance",
        ["spellID"] = 2457,
        ["spellIcon"] = "ability_warrior_offensivestance",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["berserker_stance"] = {
        ["name"] = "Berserker Stance",
        ["soundFileName"] = "berserker_stance",
        ["spellID"] = 2458,
        ["spellIcon"] = "ability_racial_avatar",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["defensive_stance"] = {
        ["name"] = "Defensive Stance",
        ["soundFileName"] = "defensive_stance",
        ["spellID"] = 71,
        ["spellIcon"] = "ability_warrior_defensivestance",
        ["hasFade"] = false,
        ["active"] = true
      },
      -- cannot detect intercept itself, only the stun
      ["intercept_stun"] = {
        ["name"] = "Intercept Stun",
        ["soundFileName"] = "intercept",
        ["spellID"] = 20615,
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["last_stand"] = {
        ["name"] = "Last Stand",
        ["soundFileName"] = "last_stand",
        ["spellID"] = 12975,
        ["spellIcon"] = "spell_holy_ashestoashes",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["disarm"] = {
        ["name"] = "Disarm",
        ["soundFileName"] = "disarm",
        ["spellID"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["concussion_blow"] = {
        ["name"] = "Concussion Blow",
        ["soundFileName"] = "concussion_blow",
        ["spellID"] = 12809,
        ["spellIcon"] = "ability_thunderbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["bloodrage"] = {
        ["name"] = "Bloodrage",
        ["soundFileName"] = "bloodrage",
        ["spellID"] = 2687,
        ["spellIcon"] = "ability_racial_bloodrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
        }
      },
      ["pummel"] = {
        ["name"] = "Pummel",
        ["soundFileName"] = "pummel",
        ["spellID"] = 6552,
        ["spellIcon"] = "inv_gauntlets_04",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      -- cannot detect charge itself, only the stun
      ["charge_stun"] = {
        ["name"] = "Charge Stun",
        ["soundFileName"] = "charge",
        ["spellID"] = 7922,
        ["spellIcon"] = "ability_warrior_charge",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      --[[
        If the player is the main target of the spell the warning will be triggered twice.
        As a bystander it will be announced only once
      ]]--
      ["intimidating_shout"] = {
        ["name"] = "Intimidating Shout",
        ["soundFileName"] = "intimidating_shout",
        ["spellID"] = 29544,
        ["spellIcon"] = "ability_golemthunderclap",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["shield_block"] = {
        ["name"] = "Shield Block",
        ["soundFileName"] = "shield_block",
        ["spellID"] = 2565,
        ["spellIcon"] = "ability_defend",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["shield_bash"] = {
        ["name"] = "Shield Bash",
        ["soundFileName"] = "shield_bash",
        ["spellID"] = 1672,
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["hasFade"] = false,
        ["active"] = true
      },
      -- skilled shield bash has a silence effect
      ["shield_bash_silenced"] = {
        ["name"] = "Shield Bash - Silenced",
        ["soundFileName"] = "shield_bash_silenced",
        ["spellID"] = 18498,
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["shield_slam"] = {
        ["name"] = "Shield Slam",
        ["soundFileName"] = "shield_slam",
        ["spellID"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["hasFade"] = false,
        ["active"] = true
      }
    },
    ["priest"] = {
      ["psychic_scream"] = {
        ["name"] = "Psychic Scream",
        ["soundFileName"] = "psychic_scream",
        ["spellID"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["silence"] = {
        ["name"] = "Silence",
        ["soundFileName"] = "silence",
        ["spellID"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["power_infusion"] = {
        ["name"] = "Power Infusion",
        ["soundFileName"] = "power_infusion",
        ["spellID"] = 10060,
        ["spellIcon"] = "spell_holy_powerinfusion",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["inner_fire"] = {
        ["name"] = "Inner Fire",
        ["soundFileName"] = "inner_fire",
        ["spellID"] = 10952, -- rank 6
        ["spellIcon"] = "spell_holy_innerfire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["vampiric_embrace"] = {
        ["name"] = "Vampiric Embrace",
        ["soundFileName"] = "vampiric_embrace",
        ["spellID"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["desperate_prayer"] = {
        ["name"] = "Desperate Prayer",
        ["soundFileName"] = "desperate_prayer",
        ["spellID"] = 19243, -- rank 7
        ["spellIcon"] = "spell_holy_restoration",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["soundFileName"] = "devouring_plague",
        ["spellID"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
        }
      },
      ["touch_of_weakness"] = {
        ["name"] = "Touch of Weakness",
        ["soundFileName"] = "touch_of_weakness",
        ["spellID"] = 19266, -- rank 6
        ["spellIcon"] = "spell_shadow_deadofnight",
        ["hasFade"] = true,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fear_ward"] = {
        ["name"] = "Fear Ward",
        ["soundFileName"] = "fear_ward",
        ["spellID"] = 6346,
        ["spellIcon"] = "spell_holy_excorcism",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["elunes_grace"] = {
        ["name"] = "Elune's Grace",
        ["soundFileName"] = "elunes_grace",
        ["spellID"] = 19293, -- rank 5
        ["spellIcon"] = "spell_holy_elunesgrace",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["starshards"] = {
        ["name"] = "Starshards",
        ["soundFileName"] = "starshards",
        ["spellID"] = 19305, -- rank 7
        ["spellIcon"] = "spell_arcane_starfire",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["hex_of_weakness"] = {
        ["name"] = "Hex of Weakness",
        ["soundFileName"] = "hex_of_weakness",
        ["spellID"] = 19285, -- rank 6
        ["spellIcon"] = "spell_shadow_fingerofdeath",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["rogue"] = {
      ["blind"] = {
        ["name"] = "Blind",
        ["soundFileName"] = "blind",
        ["spellID"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["kick"] = {
        ["name"] = "Kick",
        ["soundFileName"] = "kick",
        ["spellID"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["sprint"] = {
        ["name"] = "Sprint",
        ["soundFileName"] = "sprint",
        ["spellID"] = 11305, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["evasion"] = {
        ["name"] = "Evasion",
        ["soundFileName"] = "evasion",
        ["spellID"] = 5277,
        ["spellIcon"] = "spell_shadow_shadowward",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["kidney_shot"] = {
        ["name"] = "Kidney Shot",
        ["soundFileName"] = "kidney_shot",
        ["spellID"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["cheap_shot"] = {
        ["name"] = "Cheap Shot",
        ["soundFileName"] = "cheap_shot",
        ["spellID"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["adrenaline_rush"] = {
        ["name"] = "Adrenaline Rush",
        ["soundFileName"] = "adrenaline_rush",
        ["spellID"] = 13750,
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["blade_flurry"] = {
        ["name"] = "Blade Flurry",
        ["soundFileName"] = "blade_flurry",
        ["spellID"] = 13877,
        ["spellIcon"] = "ability_warrior_punishingblow",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["cold_blood"] = {
        ["name"] = "Cold Blood",
        ["soundFileName"] = "cold_blood",
        ["spellID"] = 14177,
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true
      }
    },
    ["mage"] = {
      ["ice_block"] = {
        ["name"] = "Ice Block",
        ["soundFileName"] = "ice_block",
        ["spellID"] = 11958,
        ["spellIcon"] = "spell_frost_frost",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["polymorph"] = {
        ["name"] = "Polymorph",
        ["soundFileName"] = "polymorph",
        ["spellID"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["polymorph_cow"] = {
        ["name"] = "Polymorph: Cow",
        ["soundFileName"] = "polymorph",
        ["spellID"] = 28270,
        ["spellIcon"] = "spell_nature_polymorph_cow",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["polymorph_pig"] = {
        ["name"] = "Polymorph: Pig",
        ["soundFileName"] = "polymorph",
        ["spellID"] = 28272,
        ["spellIcon"] = "spell_magic_polymorphpig",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["polymorph_turtle"] = {
        ["name"] = "Polymorph: Turtle",
        ["soundFileName"] = "polymorph",
        ["spellID"] = 28271,
        ["spellIcon"] = "ability_hunter_pet_turtle",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["blink"] = {
        ["name"] = "Blink",
        ["soundFileName"] = "blink",
        ["spellID"] = 1953,
        ["spellIcon"] = "spell_arcane_blink",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["fire_ward"] = {
        ["name"] = "Fire Ward",
        ["soundFileName"] = "fire_ward",
        ["spellID"] = 10226, -- rank 5
        ["spellIcon"] = "spell_fire_firearmor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frost_ward"] = {
        ["name"] = "Frost Ward",
        ["soundFileName"] = "frost_ward",
        ["spellID"] = 28609, -- rank 5
        ["spellIcon"] = "spell_frost_frostward",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["counterspell_silenced"] = {
        ["name"] = "Counterspell - Silenced",
        ["soundFileName"] = "counterspell",
        ["spellID"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["mana_shield"] = {
        ["name"] = "Mana Shield",
        ["soundFileName"] = "mana_shield",
        ["spellID"] = 10193, -- rank 6
        ["spellIcon"] = "spell_shadow_detectlesserinvisibility",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["ice_barrier"] = {
        ["name"] = "Ice Barrier",
        ["soundFileName"] = "ice_barrier",
        ["spellID"] = 13033, -- rank 4
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frost_nova"] = {
        ["name"] = "Frost Nova",
        ["soundFileName"] = "frost_nova",
        ["spellID"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["arcane_power"] = {
        ["name"] = "Arcane Power",
        ["soundFileName"] = "arcane_power",
        ["spellID"] = 12042,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["evocation"] = {
        ["name"] = "Evocation",
        ["soundFileName"] = "evocation",
        ["spellID"] = 12051,
        ["spellIcon"] = "spell_nature_purge",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["presence_of_mind"] = {
        ["name"] = "Presence of Mind",
        ["soundFileName"] = "presence_of_mind",
        ["spellID"] = 12043,
        ["spellIcon"] = "spell_nature_enchantarmor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["combustion"] = {
        ["name"] = "Combustion",
        ["soundFileName"] = "combustion",
        ["spellID"] = 11129,
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["blast_wave"] = {
        ["name"] = "Blast Wave",
        ["soundFileName"] = "blast_wave",
        ["spellID"] = 13021, -- rank 5
        ["spellIcon"] = "spell_holy_excorcism_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["hunter"] = {
      ["concussive_shot"] = {
        ["name"] = "Concussive Shot",
        ["soundFileName"] = "concussive_shot",
        ["spellID"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["improved_concussive_shot"] = {
        ["name"] = "Improved Concussive Shot",
        ["soundFileName"] = "concussive_shot",
        ["spellID"] = 19410,
        ["spellIcon"] = "spell_frost_stun",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["aspect_of_the_monkey"] = {
        ["name"] = "Aspect of the Monkey",
        ["soundFileName"] = "aspect_of_the_monkey",
        ["spellID"] = 13163,
        ["spellIcon"] = "ability_hunter_aspectofthemonkey",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["aspect_of_the_hawk"] = {
        ["name"] = "Aspect of the Hawk",
        ["soundFileName"] = "aspect_of_the_hawk",
        ["spellID"] = 25296, -- rank 7
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["rapid_fire"] = {
        ["name"] = "Rapid Fire",
        ["soundFileName"] = "rapid_fire",
        ["spellID"] = 3045,
        ["spellIcon"] = "ability_hunter_runningshot",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["deterrence"] = {
        ["name"] = "Deterrence",
        ["soundFileName"] = "deterrence",
        ["spellID"] = 19263,
        ["spellIcon"] = "ability_whirlwind",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["explosive_trap"] = {
        ["name"] = "Explosive Trap",
        ["soundFileName"] = "explosive_trap",
        ["spellID"] = 14317, -- rank 3
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["freezing_trap"] = {
        ["name"] = "Freezing Trap",
        ["soundFileName"] = "freezing_trap",
        ["spellID"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["immolation_trap"] = {
        ["name"] = "Immolation Trap",
        ["soundFileName"] = "immolation_trap",
        ["spellID"] = 14305, -- rank 5
        ["spellIcon"] = "spell_fire_flameshock",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["frost_trap"] = {
        ["name"] = "Frost Trap",
        ["soundFileName"] = "frost_trap",
        ["spellID"] = 13809,
        ["spellIcon"] = "spell_frost_freezingbreath",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["wyvern_sting"] = {
        ["name"] = "Wyvern Sting",
        ["soundFileName"] = "wyvern_sting",
        ["spellID"] = 24135,
        ["spellIcon"] = "inv_spear_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
           -- TODO this might be a private server bug. Should a target really get a buff
           -- that he can dismiss by right clicking? Shouldn't he get a debuff?!
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
        }
      },
      ["viper_sting"] = {
        ["name"] = "Viper Sting",
        ["soundFileName"] = "viper_sting",
        ["spellID"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["scatter_shot"] = {
        ["name"] = "Scatter Shot",
        ["soundFileName"] = "scatter_shot",
        ["spellID"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["flare"] = {
        ["name"] = "Flare",
        ["soundFileName"] = "flare",
        ["spellID"] = 1543,
        ["spellIcon"] = "spell_fire_flare",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["scare_beast"] = {
        ["name"] = "Scare Beast",
        ["soundFileName"] = "scare_beast",
        ["spellID"] = 14327,
        ["spellIcon"] = "ability_druid_cower",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["intimidation"] = {
        ["name"] = "Intimidation",
        ["soundFileName"] = "intimidation",
        ["spellID"] = 24394,
        ["spellIcon"] = "ability_devour",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["bestial_wrath"] = {
        ["name"] = "Bestial Wrath",
        ["soundFileName"] = "bestial_wrath",
        ["spellID"] = 19574,
        ["spellIcon"] = "ability_druid_ferociousbite",
        ["hasFade"] = true,
        ["active"] = true
      }
      --[[,
      -- not trackable in the combat log
      ["feign_death"] = {
        ["name"] = "Feign Death",
        ["soundFileName"] = "feign_death",
        ["spellID"] = 5384,
        ["spellIcon"] = "ability_rogue_feigndeath",
        ["active"] = true
      }]]--
    },
    ["warlock"] = {
      ["fear"] = {
        ["name"] = "Fear",
        ["soundFileName"] = "fear",
        ["spellID"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fel_domination"] = {
        ["name"] = "Fel Domination",
        ["soundFileName"] = "fel_domination",
        ["spellID"] = 18708,
        ["spellIcon"] = "spell_nature_removecurse",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["shadowburn"] = {
        ["name"] = "Shadowburn",
        ["soundFileName"] = "shadowburn",
        ["spellID"] = 18871, -- rank 6
        ["spellIcon"] = "spell_shadow_scourgebuild",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["shadow_ward"] = {
        ["name"] = "Shadow Ward",
        ["soundFileName"] = "shadow_ward",
        ["spellID"] = 28610, -- rank 4
        ["spellIcon"] = "spell_shadow_antishadow",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["howl_of_terror"] = {
        ["name"] = "Howl of Terror",
        ["soundFileName"] = "howl_of_terror",
        ["spellID"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["spellstone"] = {
        ["name"] = "Spellstone",
        ["soundFileName"] = "spellstone",
        ["spellID"] = 128,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["greater_spellstone"] = {
        ["name"] = "Greater Spellstone",
        ["soundFileName"] = "greater_spellstone",
        ["spellID"] = 17729,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["major_spellstone"] = {
        ["name"] = "Major Spellstone",
        ["soundFileName"] = "major_spellstone",
        ["spellID"] = 17730,
        ["spellIcon"] = "inv_misc_gem_sapphire_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["death_coil"] = {
        ["name"] = "Death Coil",
        ["soundFileName"] = "death_coil",
        ["spellID"] = 17926,
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["amplify_curse"] = {
        ["name"] = "Amplify Curse",
        ["soundFileName"] = "amplify_curse",
        ["spellID"] = 18288,
        ["spellIcon"] = "spell_shadow_contagion",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["minor_healthstone"] = {
        ["name"] = "Minor Healthstone",
        ["soundFileName"] = "minor_healthstone",
        ["spellID"] = 6262,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["lesser_healthstone"] = {
        ["name"] = "Lesser Healthstone",
        ["soundFileName"] = "lesser_healthstone",
        ["spellID"] = 6263,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["greater_healthstone"] = {
        ["name"] = "Greater Healthstone",
        ["soundFileName"] = "greater_healthstone",
        ["spellID"] = 5723,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["major_healthstone"] = {
        ["name"] = "Major Healthstone",
        ["soundFileName"] = "major_healthstone",
        ["spellID"] = 11732,
        ["spellIcon"] = "inv_stone_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["curse_of_exhaustion"] = {
        ["name"] = "Curse of Exhaustion",
        ["soundFileName"] = "curse_of_exhaustion",
        ["spellID"] = 18223,
        ["spellIcon"] = "spell_shadow_grimward",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["curse_of_tongues"] = {
        ["name"] = "Curse of Tongues",
        ["soundFileName"] = "curse_of_tongues",
        ["spellID"] = 11719, -- rank 2
        ["spellIcon"] = "spell_shadow_curseoftounges",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      -- soulstone buff effect (name does not depend on the rank)
      ["soulstone_resurrection"] = {
        ["name"] = "Soulstone Resurrection",
        ["soundFileName"] = "soulstone",
        ["spellID"] = 20764, -- greater soulstone
        ["spellIcon"] = "spell_shadow_soulgem",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["spell_lock"] = {
        ["name"] = "Spell Lock",
        ["soundFileName"] = "spell_lock",
        ["spellID"] = 19647,
        ["spellIcon"] = "spell_shadow_mindrot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      -- triggers twice because both the owner and the pet receive the buff
      ["soul_link"] = {
        ["name"] = "Soul Link",
        ["soundFileName"] = "soul_link",
        ["spellID"] = 19028,
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["seduction"] = {
        ["name"] = "Seduction",
        ["soundFileName"] = "seduction",
        ["spellID"] = 6358,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["paladin"] = {
      ["devotion_aura"] = {
        ["name"] = "Devotion Aura",
        ["soundFileName"] = "devotion_aura",
        ["spellID"] = 10293, -- rank 7
        ["spellIcon"] = "spell_holy_devotionaura",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["retribution_aura"] = {
        ["name"] = "Retribution Aura",
        ["soundFileName"] = "retribution_aura",
        ["spellID"] = 10301, -- rank 5
        ["spellIcon"] = "spell_holy_auraoflight",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["concentration_aura"] = {
        ["name"] = "Concentration Aura",
        ["soundFileName"] = "concentration_aura",
        ["spellID"] = 19746,
        ["spellIcon"] = "spell_holy_mindsooth",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["shadow_resistance_aura"] = {
        ["name"] = "Shadow Resistance Aura",
        ["soundFileName"] = "shadow_resistance_aura",
        ["spellID"] = 19896,
        ["spellIcon"] = "spell_shadow_sealofkings",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frost_resistance_aura"] = {
        ["name"] = "Frost Resistance Aura",
        ["soundFileName"] = "frost_resistance_aura",
        ["spellID"] = 19898, -- rank 3
        ["spellIcon"] = "spell_frost_wizardmark",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["fire_resistance_aura"] = {
        ["name"] = "Fire Resistance Aura",
        ["soundFileName"] = "fire_resistance_aura",
        ["spellID"] = 19900, -- rank 3
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hammer_of_wrath"] = {
        ["name"] = "Hammer of Wrath",
        ["soundFileName"] = "hammer_of_wrath",
        ["spellID"] = 24239, -- rank 3
        ["spellIcon"] = "ability_thunderclap",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["blessing_of_protection"] = {
        ["name"] = "Blessing of Protection",
        ["soundFileName"] = "blessing_of_protection",
        ["spellID"] = 10278, -- rank 3
        ["spellIcon"] = "spell_holy_sealofprotection",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["blessing_of_freedom"] = {
        ["name"] = "Blessing of Freedom",
        ["soundFileName"] = "blessing_of_freedom",
        ["spellID"] = 1044,
        ["spellIcon"] = "spell_holy_sealofvalor",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["blessing_of_sacrifice"] = {
        ["name"] = "Blessing of Sacrifice",
        ["soundFileName"] = "blessing_of_sacrifice",
        ["spellID"] = 20729,
        ["spellIcon"] = "spell_holy_sealofsacrifice",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["hammer_of_justice"] = {
        ["name"] = "Hammer of Justice",
        ["soundFileName"] = "hammer_of_justice",
        ["spellID"] = 10308,
        ["spellIcon"] = "spell_holy_sealofmight",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["repentance"] = {
        ["name"] = "Repentance",
        ["soundFileName"] = "repentance",
        ["spellID"] = 20066,
        ["spellIcon"] = "spell_holy_prayerofhealing",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["lay_on_hands"] = {
        ["name"] = "Lay on Hands",
        ["soundFileName"] = "lay_on_hands",
        ["spellID"] = 10310, -- rank 3
        ["spellIcon"] = "spell_holy_layonhands",
        ["hasFade"] = true,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["divine_shield"] = {
        ["name"] = "Divine Shield",
        ["soundFileName"] = "divine_shield",
        ["spellID"] = 642, -- rank 2
        ["spellIcon"] = "spell_holy_divineintervention",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["divine_favor"] = {
        ["name"] = "Divine Favor",
        ["soundFileName"] = "divine_favor",
        ["spellID"] = 20216,
        ["spellIcon"] = "spell_holy_heal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["forbearance"] = {
        ["name"] = "Forbearance",
        ["soundFileName"] = "forbearance",
        ["spellID"] = 25771,
        ["spellIcon"] = "spell_holy_removecurse",
        ["hasFade"] = true,
        ["active"] = true
      }
    },
    ["druid"] = {
      ["barkskin"] = {
        ["name"] = "Barkskin",
        ["soundFileName"] = "barkskin",
        ["spellID"] = 22812,
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["natures_grasp"] = {
        ["name"] = "Nature's Grasp",
        ["soundFileName"] = "natures_grasp",
        ["spellID"] = 17329, -- rank 6
        ["spellIcon"] = "spell_nature_natureswrath",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["bash"] = {
        ["name"] = "Bash",
        ["soundFileName"] = "bash",
        ["spellID"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["feral_charge_effect"] = {
        ["name"] = "Feral Charge",
        ["soundFileName"] = "feral_charge",
        ["spellID"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["frenzied_regeneration"] = {
        ["name"] = "Frenzied Regeneration",
        ["soundFileName"] = "frenzied_regeneration",
        ["spellID"] = 22896, -- rank 3
        ["spellIcon"] = "ability_bullrush",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["abolish_poison"] = {
        ["name"] = "Abolish Poison",
        ["soundFileName"] = "abolish_poison",
        ["spellID"] = 2893,
        ["spellIcon"] = "spell_nature_nullifypoison_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["innervate"] = {
        ["name"] = "Innervate",
        ["soundFileName"] = "innervate",
        ["spellID"] = 29166,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["natures_swiftness"] = {
        ["name"] = "Nature's Swiftness",
        ["soundFileName"] = "natures_swiftness",
        ["spellID"] = 17116,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["faerie_fire"] = {
        ["name"] = "Farie Fire",
        ["soundFileName"] = "faerie_fire",
        ["spellID"] = 9907,
        ["spellIcon"] = "spell_nature_faeriefire",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["shaman"] = {
      ["elemental_mastery"] = {
        ["name"] = "Elemental Mastery",
        ["soundFileName"] = "elemental_mastery",
        ["spellID"] = 16166,
        ["spellIcon"] = "spell_nature_wispheal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["natures_swiftness"] = {
        ["name"] = "Nature's Swiftness",
        ["soundFileName"] = "natures_swiftness",
        ["spellID"] = 16188,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["tremor_totem"] = {
        ["name"] = "Tremor Totem",
        ["soundFileName"] = "tremor_totem",
        ["spellID"] = 8143,
        ["spellIcon"] = "spell_nature_tremortotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["poison_cleansing_totem"] = {
        ["name"] = "Poison Cleansing Totem",
        ["soundFileName"] = "poison_cleansing_totem",
        ["spellID"] = 8166,
        ["spellIcon"] = "spell_nature_poisoncleansingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["grounding_totem"] = {
        ["name"] = "Grounding Totem",
        ["soundFileName"] = "grounding_totem",
        ["spellID"] = 8177,
        ["spellIcon"] = "spell_nature_groundingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["fire_resistance_totem"] = {
        ["name"] = "Fire Resistance Totem",
        ["soundFileName"] = "fire_resistance_totem",
        ["spellID"] = 10538, -- rank 3
        ["spellIcon"] = "spell_fireresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["flametongue_totem"] = {
        ["name"] = "Flametongue Totem",
        ["soundFileName"] = "flametongue_totem",
        ["spellID"] = 16387, -- rank 4
        ["spellIcon"] = "spell_nature_guardianward",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["grace_of_air_totem"] = {
        ["name"] = "Grace of Air Totem",
        ["soundFileName"] = "grace_of_air_totem",
        ["spellID"] = 25359, -- rank 3
        ["spellIcon"] = "spell_nature_invisibilitytotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["nature_resistance_totem"] = {
        ["name"] = "Nature Resistance Totem",
        ["soundFileName"] = "nature_resistance_totem",
        ["spellID"] = 10601, -- rank 3
        ["spellIcon"] = "spell_nature_natureresistancetotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["stoneskin_totem"] = {
        ["name"] = "Stoneskin Totem",
        ["soundFileName"] = "stoneskin_totem",
        ["spellID"] = 10408, -- rank 6
        ["spellIcon"] = "spell_nature_stoneskintotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["strength_of_earth_totem"] = {
        ["name"] = "Strength of Earth Totem",
        ["soundFileName"] = "strength_of_earth_totem",
        ["spellID"] = 25361, -- rank 5
        ["spellIcon"] = "spell_nature_earthbindtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["windfury_totem"] = {
        ["name"] = "Windfury Totem",
        ["soundFileName"] = "windfury_totem",
        ["spellID"] = 10610, -- rank 3
        ["spellIcon"] = "spell_nature_windfury",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["windwall_totem"] = {
        ["name"] = "Windwall Totem",
        ["soundFileName"] = "windwall_totem",
        ["spellID"] = 15112, -- rank 3
        ["spellIcon"] = "spell_nature_earthbind",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["earthbind_totem"] = {
        ["name"] = "Earthbind Totem",
        ["soundFileName"] = "earthbind_totem",
        ["spellID"] = 2484,
        ["spellIcon"] = "spell_nature_strengthofearthtotem02",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["fire_nova_totem"] = {
        ["name"] = "Fire Nova Totem",
        ["soundFileName"] = "fire_nova_totem",
        ["spellID"] = 11315, -- rank 5
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["magma_totem"] = {
        ["name"] = "Magma Totem",
        ["soundFileName"] = "magma_totem",
        ["spellID"] = 10587, -- rank 4
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["searing_totem"] = {
        ["name"] = "Searing Totem",
        ["soundFileName"] = "searing_totem",
        ["spellID"] = 10438, -- rank 6
        ["spellIcon"] = "spell_fire_searingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["stoneclaw_totem"] = {
        ["name"] = "Stoneclaw Totem",
        ["soundFileName"] = "stoneclaw_totem",
        ["spellID"] = 10428, -- rank 6
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["frost_resistance_totem"] = {
        ["name"] = "Frost Resistance Totem",
        ["soundFileName"] = "frost_resistance_totem",
        ["spellID"] = 10479, -- rank 3
        ["spellIcon"] = "spell_frostresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["healing_stream_totem"] = {
        ["name"] = "Healing Stream Totem",
        ["soundFileName"] = "healing_stream_totem",
        ["spellID"] = 10463, -- rank 5
        ["spellIcon"] = "inv_spear_04",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["disease_cleansing_totem"] = {
        ["name"] = "Disease Cleansing Totem",
        ["soundFileName"] = "disease_cleansing_totem",
        ["spellID"] = 8170,
        ["spellIcon"] = "spell_nature_diseasecleansingtotem",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["mana_spring_totem"] = {
        ["name"] = "Mana Spring Totem",
        ["soundFileName"] = "mana_spring_totem",
        ["spellID"] = 10497, -- rank 4
        ["spellIcon"] = "spell_nature_manaregentotem",
        ["active"] = true
      },
      ["mana_tide_totem"] = {
        ["name"] = "Mana Tide Totem",
        ["soundFileName"] = "mana_tide_totem",
        ["spellID"] = 17359, -- rank 3
        ["spellIcon"] = "spell_frost_summonwaterelemental",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["tranquil_air_totem"] = {
        ["name"] = "Tranquil Air Totem",
        ["soundFileName"] = "tranquil_air_totem",
        ["spellID"] = 25908,
        ["spellIcon"] = "spell_nature_brilliance",
        ["hasFade"] = false,
        ["active"] = true
      }
    },
    ["racials"] = {
      ["perception"] = {
        ["name"] = "Perception",
        ["soundFileName"] = "perception",
        ["spellID"] = 20600,
        ["spellIcon"] = "spell_nature_sleep",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["will_of_the_forsaken"] = {
        ["name"] = "Will of the Forsaken",
        ["soundFileName"] = "will_of_the_forsaken",
        ["spellID"] = 7744,
        ["spellIcon"] = "spell_shadow_raisedead",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["stoneform"] = {
        ["name"] = "Stoneform",
        ["soundFileName"] = "stoneform",
        ["spellID"] = 20594,
        ["spellIcon"] = "spell_shadow_unholystrength",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["escape_artist"] = {
        ["name"] = "Escape Artist",
        ["soundFileName"] = "escape_artist",
        ["spellID"] = 20589,
        ["spellIcon"] = "ability_rogue_trip",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["war_stomp"] = {
        ["name"] = "War Stomp",
        ["soundFileName"] = "war_stomp",
        ["spellID"] = 20549,
        ["spellIcon"] = "ability_warstomp",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["berserking"] = {
        ["name"] = "Berserking",
        ["soundFileName"] = "berserking",
        ["spellID"] = 26296, -- depending on mana, rage, energy
        ["spellIcon"] = "racial_troll_berserk",
        ["hasFade"] = true,
        ["active"] = true
      },
      --[[
        Only the fading of shadowmeld actually shows up in the combat log
      ]]--
      ["shadowmeld"] = {
        ["name"] = "Shadowmeld",
        ["soundFileName"] = "shadowmeld",
        ["spellID"] = 20580,
        ["spellIcon"] = "ability_ambush",
        ["hasFade"] = true,
        ["active"] = true
      },
      --[[ blood fury is not showing in combat log or any event
      ["blood_fury"] = {
        ["name"] = "Blood Fury",
        ["soundFileName"] = "",
        ["spellID"] = 20572,
        ["spellIcon"] = "racial_orc_berserkerstrength",
        ["hasFade"] = false,
        ["active"] = true
      }
      --]]
    },
    ["items"] = {
      ["aura_of_protection"] = {
        ["name"] = "Aura of Protection",
        ["soundFileName"] = "aura_of_protection",
        ["itemID"] = 19024,
        ["spellID"] = 23506,
        ["spellIcon"] = "inv_misc_armorkit_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["brittle_armor"] = {
        ["name"] = "Brittle Armor",
        ["soundFileName"] = "brittle_armor",
        ["itemID"] = 19948,
        ["spellID"] = 24590,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["the_burrowers_shell"] = {
        ["name"] = "The Burrower's Shell",
        ["soundFileName"] = "the_burrowers_shell",
        ["itemID"] = 23558,
        ["spellID"] = 29506,
        ["spellIcon"] = "inv_shield_23",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["ephemeral_power"] = {
        ["name"] = "Ephemeral Power",
        ["soundFileName"] = "ephemeral_power",
        ["itemID"] = 18820,
        ["spellID"] = 23271,
        ["spellIcon"] = "inv_misc_stonetablet_11",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["essence_of_sapphiron"] = {
        ["name"] = "Essence of Sapphiron",
        ["soundFileName"] = "essence_of_sapphiron",
        ["itemID"] = 23046,
        ["spellID"] = 28779,
        ["spellIcon"] = "inv_trinket_naxxramas06",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["fire_reflector"] = {
        ["name"] = "Fire Reflector",
        ["soundFileName"] = "fire_reflector",
        ["itemID"] = 18638,
        ["spellID"] = 23097,
        ["spellIcon"] = "inv_misc_enggizmos_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["flee"] = {
        ["name"] = "Flee",
        ["soundFileName"] = "flee",
        ["itemID"] = 4984,
        ["spellID"] = 5024,
        ["spellIcon"] = "inv_misc_bone_elfskull_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frost_reflector"] = {
        ["name"] = "Frost Reflector",
        ["soundFileName"] = "frost_reflector",
        ["itemID"] = 18634,
        ["spellID"] = 23131,
        ["spellIcon"] = "inv_misc_enggizmos_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gift_of_life"] = {
        ["name"] = "Gift of Life",
        ["soundFileName"] = "gift_of_life",
        ["itemID"] = 19341,
        ["spellID"] = 23725,
        ["spellIcon"] = "inv_misc_gem_pearl_05",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["immune_root"] = {
        ["name"] = "Immune Root",
        ["soundFileName"] = "immune_root",
        ["itemID"] = 4328,
        ["spellID"] = 9774,
        ["spellIcon"] = "inv_belt_25",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["mind_quickening"] = {
        ["name"] = "Mind Quickening",
        ["soundFileName"] = "mind_quickening",
        ["itemID"] = 19339,
        ["spellID"] = 23723,
        ["spellIcon"] = "spell_nature_wispheal",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["reckless_charge"] = {
        ["name"] = "Reckless Charge",
        ["soundFileName"] = "rocket_helmet",
        ["itemID"] = 10588,
        ["spellID"] = 22641,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["restless_strength"] = {
        ["name"] = "Restless Strength",
        ["soundFileName"] = "restless_strength",
        ["itemID"] = 19949,
        ["spellID"] = 24661,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["gnomish_rocket_boots"] = {
        ["name"] = "Gnomish Rocket Boots",
        ["soundFileName"] = "gnomish_rocket_boots",
        ["itemID"] = 10724,
        ["spellID"] = 13141,
        ["spellIcon"] = "inv_boots_02",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["goblin_rocket_boots"] = {
        ["name"] = "Goblin Rocket Boots",
        ["soundFileName"] = "goblin_rocket_boots",
        ["itemID"] = 7189,
        ["spellID"] = 8892,
        ["spellIcon"] = "inv_gizmo_rocketboot_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["shadow_reflector"] = {
        ["name"] = "Shadow Reflector",
        ["soundFileName"] = "shadow_reflector",
        ["itemID"] = 18639,
        ["spellID"] = 23132,
        ["spellIcon"] = "inv_misc_enggizmos_16",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["slayers_crest"] = {
        ["name"] = "Slayer's Crest",
        ["soundFileName"] = "slayers_crest",
        ["itemID"] = 23041,
        ["spellID"] = 28777,
        ["spellIcon"] = "inv_trinket_naxxramas03",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["unstable_power"] = {
        ["name"] = "Unstable Power",
        ["soundFileName"] = "unstable_power",
        ["itemID"] = 19950,
        ["spellID"] = 24658,
        ["spellIcon"] = "inv_jewelry_necklace_13",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["venomous_totem"] = {
        ["name"] = "Venomous Totem",
        ["soundFileName"] = "venomous_totem",
        ["itemID"] = 19342,
        ["spellID"] = 23726,
        ["spellIcon"] = "inv_misc_idol_03",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["tidal_charm"] = {
        ["name"] = "Tidal Charm",
        ["soundFileName"] = "tidal_charm",
        ["itemID"] = 1404,
        ["spellID"] = 835,
        ["spellIcon"] = "inv_misc_rune_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["earthstrike"] = {
        ["name"] = "Earthstrike",
        ["soundFileName"] = "earthstrike",
        ["itemID"] = 21180,
        ["spellID"] = 25891,
        ["spellIcon"] = "spell_nature_abolishmagic",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["net_o_matic"] = {
        ["name"] = "Net-o-Matic",
        ["soundFileName"] = "net_o_matic",
        ["itemID"] = 10720,
        ["spellID"] = 13120,
        ["spellIcon"] = "ability_ensnare",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["gnomish_mind_control_cap"] = {
        ["name"] = "Gnomish Mind Control Cap",
        ["soundFileName"] = "mind_control_cap",
        ["itemID"] = 10726,
        ["spellID"] = 13180,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        -- optional to ignore those events because the target will be friendly and automatically ignored
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["misc"] = {
      ["restore_energy"] = {
        ["name"] = "Thistle Tea",
        ["soundFileName"] = "thistle_tea",
        ["itemID"] = 7676,
        ["spellID"] = 9512,
        ["spellIcon"] = "inv_drink_milk_05",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["restoration"] = {
        ["name"] = "Restorative Potion",
        ["soundFileName"] = "restoration",
        ["itemID"] = 9030,
        ["spellID"] = 11359,
        ["spellIcon"] = "inv_potion_01",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["first_aid"] = {
        ["name"] = "First Aid",
        ["soundFileName"] = "first_aid",
        ["itemID"] = 14530, -- depending on what bandage was used
        ["spellID"] = 18610, -- rank 10
        ["spellIcon"] = "inv_misc_bandage_12",
        ["hasFade"] = false,
        ["active"] = true
      },
      ["invulnerability"] = {
        ["name"] = "Limited Invulnerability Potion",
        ["soundFileName"] = "invulnerability",
        ["itemID"] = 3387,
        ["spellID"] = 3169,
        ["spellIcon"] = "inv_potion_62",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["free_action"] = {
        ["name"] = "Free Action",
        ["soundFileName"] = "free_action",
        ["itemID"] = 5634,
        ["spellID"] = 6615,
        ["spellIcon"] = "inv_potion_04",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["thorium_grenade"] = {
        ["name"] = "Thorium Grenade",
        ["soundFileName"] = "grenade",
        ["itemID"] = 15993,
        ["spellID"] = 19769,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["iron_grenade"] = {
        ["name"] = "Iron Grenade",
        ["soundFileName"] = "grenade",
        ["itemID"] = 4390,
        ["spellID"] = 4068,
        ["spellIcon"] = "inv_misc_bomb_08",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["shadow_protection"] = {
        ["name"] = "Shadow Protection Potion",
        ["soundFileName"] = "shadow_protection",
        ["itemID"] = 13459,
        ["spellID"] = 17548,
        ["spellIcon"] = "inv_potion_23",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["frost_protection"] = {
        ["name"] = "Frost Protection Potion",
        ["soundFileName"] = "frost_protection",
        ["itemID"] = 13456,
        ["spellID"] = 17544,
        ["spellIcon"] = "inv_potion_20",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["fire_protection"] = {
        ["name"] = "Fire Protection Potion",
        ["soundFileName"] = "fire_protection",
        ["itemID"] = 13457,
        ["spellID"] = 17543,
        ["spellIcon"] = "inv_potion_24",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["nature_protection"] = {
        ["name"] = "Nature Protection Potion",
        ["soundFileName"] = "nature_protection",
        ["itemID"] = 13458,
        ["spellID"] = 17546,
        ["spellIcon"] = "inv_potion_22",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["arcane_protection"] = {
        ["name"] = "Arcane Protection Potion",
        ["soundFileName"] = "arcane_protection",
        ["itemID"] = 13461,
        ["spellID"] = 17549,
        ["spellIcon"] = "inv_potion_83",
        ["hasFade"] = true,
        ["active"] = true
      }
    }
  }
end

--[[
  Retrieve a spell from the spellMap by name

  @param {string} name
  @return ({string} {table}) | {nil}
]]--
function me.SearchByName(name)
  if not name then return nil end

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellMap", spellName))

  for class, value in pairs(spellMap) do
    for key, value in pairs(spellMap[class]) do
      if key == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellMap", spellName))

        local spell = mod.common.Clone(spellMap[class][key])
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
  @return {table}
    Map for the passed category
]]--
function me.GetAllForCategory(category)
  if not category then return nil end

  return mod.common.Clone(spellMap[category])
end
