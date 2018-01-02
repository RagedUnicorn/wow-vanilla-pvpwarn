--[[
  PVPWarn - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2017 Michael Wiesendanger <michael.wiesendanger@gmail.com>

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
local spellAvoidMap = {
  ["rogue"] = {
    ["kick"] = {
      ["name"] = "Kick",
      ["spellID"] = 1769,
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
      ["spellID"] = 1833,
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
      ["spellID"] = 11286,
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
      ["spellID"] = 14251,
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
      ["spellID"] = 8643,
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
      ["spellID"] = 2094,
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
      ["spellID"] = 14278,
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
      ["spellID"] = 11297, -- rank 3
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
      ["spellID"] = 14183,
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
      ["spellID"] = 1725,
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
      ["spellID"] = 11198, -- rank 5
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
      ["spellID"] = 11290, -- rank 6
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
      ["spellID"] = 11275, -- rank 6
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
      ["spellID"] = 7922,
      ["spellIcon"] = "ability_warrior_charge",
      ["soundFileName"] = "charge_stun",
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
      ["spellID"] = 7373, -- rank 3
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
      ["spellID"] = 21553, -- rank 4
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
      ["spellID"] = 11585, -- rank 4
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
      ["spellID"] = 23894, -- rank 4
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
      ["spellID"] = 20615,
      ["spellIcon"] = "ability_rogue_sprint",
      ["soundFileName"] = "intercept_stun",
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
      ["spellID"] = 5246,
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
      ["spellID"] = 6554, -- rank 2
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
      ["spellID"] = 12809,
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
      ["spellID"] = 676,
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
      ["spellID"] = 1672, -- rank 3
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
      ["spellID"] = 2139,
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
      ["spellID"] = 2139,
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
      ["spellID"] = 12826,
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
      ["spellID"] = 28270,
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
      ["spellID"] = 28272,
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
      ["spellID"] = 28271,
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
      ["spellID"] = 10161, -- rank 5
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
      ["spellID"] = 10230, -- rank 4
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
      ["spellID"] = 11719, -- rank 2
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
      ["spellID"] = 17926, -- rank 3
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
      ["spellID"] = 6215, -- rank 3
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
      ["spellID"] = 17928, -- rank 2
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
      ["spellID"] = 18871, -- rank 6
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
      ["spellID"] = 19647,
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
      ["spellID"] = 6358,
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
      ["spellID"] = 20904, -- rank 6
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
      ["spellID"] = 5116,
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
      ["spellID"] = 19503,
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
      ["spellID"] = 13555, -- rank 8
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
      ["spellID"] = 14280, -- rank 3
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
      ["spellID"] = 27753, -- rank 3
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
      ["spellID"] = 14268, -- rank 3
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
      ["spellID"] = 24239, -- rank 3
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
      ["spellID"] = 10308, -- rank 4
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
      ["spellID"] = 19280, -- rank 6
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
      ["spellID"] = 15326, -- rank 5 (skillpoints)
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
      ["spellID"] = 10876, -- rank 5
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
      ["spellID"] = 10912, -- rank 3
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
      ["spellID"] = 10890,
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
      ["spellID"] = 10894, -- rank 8
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
      ["spellID"] = 15487,
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
      ["spellID"] = 15286,
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
      ["spellID"] = 19970, -- rank 6
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
      ["spellID"] = 9907, -- rank 4
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
      ["spellID"] = 8983, -- rank 3
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
      ["spellID"] = 19675,
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
      ["spellID"] = 10414, -- rank 7
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
      ["spellID"] = 29228, -- rank 6
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
      ["spellID"] = 10473, -- rank 4
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
      ["spellID"] = 20549,
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
      ["itemID"] = 1404,
      ["spellID"] = 835,
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
      ["itemID"] = 10588,
      ["spellID"] = 22641,
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
      ["itemID"] = 10720,
      ["spellID"] = 13120,
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
      ["itemID"] = 15993,
      ["spellID"] = 19769,
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
      ["itemID"] = 4390,
      ["spellID"] = 4068,
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
        return class, mod.common.Clone(spellAvoidMap[class][key])
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
