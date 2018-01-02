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
mod.navigationMenu = me

me.tag = "NavigationMenu"

local navigationEntries = {
  [1] = {
    ["name"] = "General",
    ["text"] = pvpw.L["navigation_general"],
    ["position"] = 1,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [2] = {
    ["name"] = "Warrior",
    ["text"] = pvpw.L["navigation_warrior"],
    ["position"] = 2,
    ["class_id"] = 1,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [3] = {
    ["name"] = "Paladin",
    ["text"] = pvpw.L["navigation_paladin"],
    ["position"] = 3,
    ["class_id"] = 2,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [4] = {
    ["name"] = "Rogue",
    ["text"] = pvpw.L["navigation_rogue"],
    ["position"] = 4,
    ["class_id"] = 3,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [5] = {
    ["name"] = "Priest",
    ["text"] = pvpw.L["navigation_priest"],
    ["position"] = 5,
    ["class_id"] = 4,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [6] = {
    ["name"] = "Shaman",
    ["text"] = pvpw.L["navigation_shaman"],
    ["position"] = 6,
    ["class_id"] = 5,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [7] = {
    ["name"] = "Mage",
    ["text"] = pvpw.L["navigation_mage"],
    ["position"] = 7,
    ["class_id"] = 6,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [8] = {
    ["name"] = "Warlock",
    ["text"] = pvpw.L["navigation_warlock"],
    ["position"] = 8,
    ["class_id"] = 7,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [9] = {
    ["name"] = "Druid",
    ["text"] = pvpw.L["navigation_druid"],
    ["position"] = 9,
    ["class_id"] = 8,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [10] = {
    ["name"] = "Hunter",
    ["text"] = pvpw.L["navigation_hunter"],
    ["position"] = 10,
    ["class_id"] = 9,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [11] = {
    ["name"] = "Items",
    ["text"] = pvpw.L["navigation_items"],
    ["position"] = 11,
    ["class_id"] = 10,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [12] = {
    ["name"] = "Racials",
    ["text"] = pvpw.L["navigation_racials"],
    ["position"] = 12,
    ["class_id"] = 11,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [13] = {
    ["name"] = "Misc",
    ["text"] = pvpw.L["navigation_misc"],
    ["position"] = 13,
    ["class_id"] = 12,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [14] = {
    ["name"] = "EnemyAvoid",
    ["text"] = pvpw.L["navigation_enemy_avoid"],
    ["position"] = 14,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [15] = {
    ["name"] = "About",
    ["text"] = pvpw.L["navigation_about"],
    ["position"] = 15,
    ["active"] = false,
    ["init"] = function()
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_ABOUT_AUTHOR_LABEL):SetText(pvpw.L["author"])
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_ABOUT_EMAIL_LABEL):SetText(pvpw.L["email"])
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_ABOUT_ISSUES_LABEL):SetText(pvpw.L["issues"])
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_ABOUT_VERSION_LABEL):SetText(pvpw.L["version"])
    end
  }
}

--[[
  Set first navigation point and content frame active in optionsframe
]]--
function PVPW_LeftNavigationMenu_OnLoad()
  -- reset tab buttons and content frame
  for i = 1, table.getn(navigationEntries) do
    navigationEntries[i].active = false

    -- reset navigation highlight
    getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_NAVIGATION_BUTTON .. i .. "Texture"):Hide()
    getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_NAVIGATION_BUTTON .. i .. "Text"):SetTextColor(0.94, 0.76, 0, 1)
    --[[
      hide content frame if one is there. Classframes all use the same frame
    ]]--
    if navigationEntries[i].class_id then
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME):Hide()
    else
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[i].name):Hide()
    end
  end

  for _, framechild in ipairs({this:GetChildren()}) do
    -- set first navigation button active and selected
    getglobal(framechild:GetName() .."Texture"):Show()
    getglobal(framechild:GetName() .."Text"):SetTextColor(1, 1, 1, 1)

    break -- break on first element
  end

  -- set first content window active
  navigationEntries[1].active = true
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[1].name):Show()
  navigationEntries[1].init()
end

function PVPW_Navigation_Button_OnClick()
  local name = this:GetName()
  local position = mod.common.ExtractPositionFromName(name)

  if not navigationEntries[position].active then
    -- set all windows inactive
    for i = 1, table.getn(navigationEntries) do
      navigationEntries[i].active = false

      -- reset navigation highlight
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_NAVIGATION_BUTTON .. i .. "Texture"):Hide()
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_NAVIGATION_BUTTON .. i .. "Text"):SetTextColor(0.94, 0.76, 0, 1)

      -- hide content frame
      if navigationEntries[i].class_id then
        local classFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME)
        classFrame:Hide()
      else
        getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[i].name):Hide()
      end
    end

    if navigationEntries[position].class_id then
      navigationEntries[position].active = true

      -- set navigation button active
      getglobal(name .. "Texture"):Show()
      getglobal(name .. "Text"):SetTextColor(1, 1, 1, 1)

      local classFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME)
      classFrame:SetID(navigationEntries[position].class_id)
      classFrame:Show()

      -- reset tabs
      mod.configurationMenu.Reset()
      -- activate first tab
      mod.configurationMenu.ActivateTab(1)
    else
      navigationEntries[position].active = true
      -- set navigation button active
      getglobal(name .. "Texture"):Show()
      getglobal(name .. "Text"):SetTextColor(1, 1, 1, 1)

      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[position].name):Show()
    end

    navigationEntries[position].init()
  else
    return -- window not active
  end
end

function PVPW_Navigation_Button_OnLoad()
  local name = this:GetName()
  local position = mod.common.ExtractPositionFromName(name)

  getglobal(name .."Text"):SetText(navigationEntries[position].text)
end
