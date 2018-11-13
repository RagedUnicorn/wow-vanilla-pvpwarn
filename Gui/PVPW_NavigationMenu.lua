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
    ["name"] = "Profiles",
    ["text"] = pvpw.L["navigation_profiles"],
    ["position"] = 2,
    ["active"] = false,
    ["init"] = function()
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_MENU_LABEL):SetText(pvpw.L["profiles_menu_label"])
    end
  },
  [3] = {
    ["name"] = "Warrior",
    ["text"] = pvpw.L["navigation_warrior"],
    ["position"] = 3,
    ["class_id"] = 1,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [4] = {
    ["name"] = "Paladin",
    ["text"] = pvpw.L["navigation_paladin"],
    ["position"] = 4,
    ["class_id"] = 2,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [5] = {
    ["name"] = "Rogue",
    ["text"] = pvpw.L["navigation_rogue"],
    ["position"] = 5,
    ["class_id"] = 3,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [6] = {
    ["name"] = "Priest",
    ["text"] = pvpw.L["navigation_priest"],
    ["position"] = 6,
    ["class_id"] = 4,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [7] = {
    ["name"] = "Shaman",
    ["text"] = pvpw.L["navigation_shaman"],
    ["position"] = 7,
    ["class_id"] = 5,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [8] = {
    ["name"] = "Mage",
    ["text"] = pvpw.L["navigation_mage"],
    ["position"] = 8,
    ["class_id"] = 6,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [9] = {
    ["name"] = "Warlock",
    ["text"] = pvpw.L["navigation_warlock"],
    ["position"] = 9,
    ["class_id"] = 7,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [10] = {
    ["name"] = "Druid",
    ["text"] = pvpw.L["navigation_druid"],
    ["position"] = 10,
    ["class_id"] = 8,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [11] = {
    ["name"] = "Hunter",
    ["text"] = pvpw.L["navigation_hunter"],
    ["position"] = 11,
    ["class_id"] = 9,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [12] = {
    ["name"] = "Items",
    ["text"] = pvpw.L["navigation_items"],
    ["position"] = 12,
    ["class_id"] = 10,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [13] = {
    ["name"] = "Racials",
    ["text"] = pvpw.L["navigation_racials"],
    ["position"] = 13,
    ["class_id"] = 11,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [14] = {
    ["name"] = "Misc",
    ["text"] = pvpw.L["navigation_misc"],
    ["position"] = 14,
    ["class_id"] = 12,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [15] = {
    ["name"] = "EnemyAvoid",
    ["text"] = pvpw.L["navigation_enemy_avoid"],
    ["position"] = 15,
    ["active"] = false,
    ["init"] = function()
      return false
    end
  },
  [16] = {
    ["name"] = "About",
    ["text"] = pvpw.L["navigation_about"],
    ["position"] = 16,
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
function me.LeftNavigationMenuOnShow()
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
      me.HideNavigationEntryContent(i)
    end
  end

  for _, framechild in ipairs({this:GetChildren()}) do
    -- set first navigation button active and selected
    getglobal(framechild:GetName() .."Texture"):Show()
    getglobal(framechild:GetName() .."Text"):SetTextColor(1, 1, 1, 1)

    break -- break on first element
  end

  -- set first content window active
  me.ShowNavigationEntryContent(1)
end

function me.NavigationButtonOnClick()
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
        getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_FRAME):Hide()
      else
        me.HideNavigationEntryContent(i)
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

      me.ShowNavigationEntryContent(position)
    end

    navigationEntries[position].init()
  else
    return -- window not active
  end
end

function me.NavigationButtonOnLoad()
  local name = this:GetName()
  local position = mod.common.ExtractPositionFromName(name)

  getglobal(name .. "Text"):SetText(navigationEntries[position].text)
end

--[[
  @param {number} position
]]--
function me.ShowNavigationEntryContent(position)
  navigationEntries[position].active = true
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[position].name):Show()
  navigationEntries[position].init()
end

--[[
  @param {number} position
]]--
function me.HideNavigationEntryContent(position)
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CONTENT .. navigationEntries[position].name):Hide()
end
