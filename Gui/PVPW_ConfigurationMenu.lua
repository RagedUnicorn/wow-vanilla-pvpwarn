--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
me.classId = 0

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
function me.TabNavigationButtonOnClick()
  local tabId = this:GetID()
  local classId = this:GetParent():GetID()

  if navigation[tabId].active then
    -- window is already active
    return
  end

  me.Reset()
  me.ActivateTab(tabId, classId)
end

--[[
  Activate a specific tab. Function is either called by an onclick event on one
  of the tab buttons or initialy when the first tab is activated automatically

  @param {number} position
  @param {number} classId
]]--
function me.ActivateTab(position, classId)
  if classId == nil then
    local classFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME)
    classId = classFrame:GetID()
  end

  navigation[position].active = true
  getglobal(PVPW_CONSTANTS["ELEMENT_PVPW_CLASS_CONFIGURATION_BUTTON_" .. position]):LockHighlight()
  mod[navigation[position]["func"]].Init(classId)
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
