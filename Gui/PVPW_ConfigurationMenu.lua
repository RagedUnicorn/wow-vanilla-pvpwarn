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


--[[

  GUI setup outline

  ---------- classFrame ----------
  ¦ ¦---- classScrollFrame -----¦ ¦
  ¦ ¦ ¦-- classContentFrame --¦ ¦ ¦
  ¦ ¦ ¦ ¦- classSpellFrame -¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦         1         ¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦-------------------¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦- classSpellFrame -¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦         2         ¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦-------------------¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦- classSpellFrame -¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦         n..       ¦ ¦ ¦ ¦
  ¦ ¦ ¦ ¦-------------------¦ ¦ ¦ ¦
  ¦-------------------------------¦

--]]

local mod = pvpw
local me = {}
mod.configurationMenu = me

me.tag = "ConfigurationMenu"
--[[
  Currently active class configuration screen
]]--
me.classID = 0

--[[
  The class configuration menu consists of multiple tabs. This module is responsible
  for handling those tabs
]]--
local navigation = {
  -- tab 1
  [1] = {
    ["active"] = false,
    ["func"] = "spellWarnCastTab"
  },
  -- tab 2
  [2] = {
    ["active"] = false,
    ["func"] = "spellWarnResistTab"
  }
}

--[[
  Callback for tab navigation buttons
]]--
function PVPW_Tab_Navigation_Button_OnClick()
  local tabID = this:GetID()
  local classID = this:GetParent():GetID()

  if navigation[tabID].active then
    -- window is already active
    return
  end

  me.Reset()
  me.ActivateTab(tabID, classID)
end

--[[
  Activate a specific tab. Function is either called by an onclick event on one
  of the tab buttons or initiali when the first tab is activated automatically

  @param {number} position
  @param {number} classID
]]--
function me.ActivateTab(position, classID)
  if classID == nil then
    local classFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME)
    classID = classFrame:GetID()
  end

  navigation[position].active = true
  getglobal(PVPW_CONSTANTS["ELEMENT_PVPW_CLASS_CONFIGURATION_BUTTON_" .. position]):LockHighlight()
  mod[navigation[position]["func"]].Init(classID)
end

--[[
  Reset navigation before activating a new tab
]]--
function me.Reset()
  for index, value in pairs(navigation) do
    navigation[index].active = false

    getglobal(PVPW_CONSTANTS["ELEMENT_PVPW_CLASS_CONFIGURATION_BUTTON_" .. index]):UnlockHighlight()
    getglobal(PVPW_CONSTANTS["ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_" .. index]):Hide()
  end
end
