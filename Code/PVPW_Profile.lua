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
mod.profile = me

me.tag = "Profile"

--[[
  Store for profiles
]]--
local profiles = {}

-- allow for a maximum of 10 profiles
local maxProfiles = 10
local maxProfileNameLength = 25

--[[
  ["type"] = {
    -- e.g. paladin, racials
    ["spellName"] = {
      -- e.g. lay_on_hands as found in SpellMap
      ["spellActive"] = false,
        -- default false
      ["soundWarningActive"] = false,
        -- default false
      ["soundFadeWarningActive"] = false,
        -- default false
      ["visualWarningActive"] = false,
        -- default false
      ["visualWarningColor"] = [number] -- e.g. blue, orange see PVPW_CONSTANTS.TEXTURES
        -- default color in PVPW_CONSTANTS.DEFAULT_COLOR
    }
  }
]]--
local defaultProfile = {
  -- Default spells that are activated and alerted to the player
  defaultProfileSpells = {
    ["paladin"] = {
      ["lay_on_hands"] = {
        ["spellActive"] = true,
        ["soundWarningActive"] = true,
        ["soundFadeWarningActive"] = true,
        ["visualWarningActive"] = true,
        ["visualWarningColor"] = 4
      }
    },
    ["warrior"] = {
      ["recklessness"] = {
        ["spellActive"] = true,
        ["soundWarningActive"] = true,
        ["soundFadeWarningActive"] = true,
        ["visualWarningActive"] = true,
        ["visualWarningColor"] = 4
      }
    }
  },
  -- Default self avoided spells that are activated and alerted to the player
  defaultProfileSelfAvoidSpells = {
    ["rogue"] = {},
    ["warrior"] = {},
    ["mage"] = {},
    ["warlock"] = {},
    ["hunter"] = {},
    ["paladin"] = {},
    ["priest"] = {},
    ["druid"] = {},
    ["shaman"] = {}
  },
  -- Default enemy avoided spells that are activated and alerted to the player
  defaultProfileEnemyAvoidSpells = {
    ["rogue"] = {},
    ["warrior"] = {},
    ["mage"] = {},
    ["warlock"] = {},
    ["hunter"] = {},
    ["paladin"] = {},
    ["priest"] = {},
    ["druid"] = {},
    ["shaman"] = {}
  }
}

function me.GetDefaultProfile()
  return defaultProfile
end

function me.GetProfiles()
  return profiles
end

function me.GetMaxProfileNameLength()
  return maxProfileNameLength
end

--[[
  Add a new profile to the list of profiles

  @param {string} profileName
  @param {table} spellConfiguration
  @param {table} selfAvoidSpellConfiguration
  @param {table} spellEnemyAvoidList
]]--
function me.AddNewProfile(profileName, spellConfiguration, selfAvoidSpellConfiguration, enemyAvoidSpellConfiguration)
  if table.getn(profiles) >= maxProfiles then
    mod.logger.PrintUserError(
      string.format(pvpw.L["user_message_add_new_profile_max_reached"], maxProfiles)
    )
    return
  end

  for i = 1, table.getn(profiles) do
    if profiles[i].name == profileName then
      mod.logger.PrintUserError(pvpw.L["user_message_select_profile_already_exists"])
      return
    end
  end

  local profile = {
    name = profileName,
    ["spellConfiguration"] = mod.common.Clone(spellConfiguration),
    ["selfAvoidSpellConfiguration"] = mod.common.Clone(selfAvoidSpellConfiguration),
    ["enemyAvoidSpellConfiguration"] = mod.common.Clone(enemyAvoidSpellConfiguration)
  }

  table.insert(profiles, profile)
  mod.logger.LogDebug(me.tag, "Created new profile with name - " .. profileName)
end

--[[
  Delete the profile on the passed index

  @param {number} index
]]--
function me.DeleteProfile(index)
  table.remove(profiles, index)
  mod.logger.LogDebug(me.tag, "Removed profile on index " .. index)
end

--[[
  Activate the profile found at the passed index
  Important! Values have to be cloned because lua does not copy by value on tables

  @param {number} index
]]--
function me.ActivateProfile(index)
  PVPWarnOptions.spellList = nil
  PVPWarnOptions.spellList = mod.common.Clone(profiles[index].spellConfiguration)
  PVPWarnOptions.spellSelfAvoidList = nil
  PVPWarnOptions.spellSelfAvoidList = mod.common.Clone(profiles[index].selfAvoidSpellConfiguration)
  PVPWarnOptions.spellEnemyAvoidList = nil
  PVPWarnOptions.spellEnemyAvoidList = mod.common.Clone(profiles[index].enemyAvoidSpellConfiguration)
end
