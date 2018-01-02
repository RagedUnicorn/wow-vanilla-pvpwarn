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
  SpellResist tab is responsible for configuring spells that are alerted to the player
  if the player himself resists them
]]--

local mod = pvpw
local me = {}
mod.spellWarnResistTab = me

me.tag = "SpellWarnResistTab"

--[[
  OnShow callback for spellFrames. Initializes dropdown with color option for
  visual warning
]]--
function PVPW_InitializeWarnResistMenuDropdown_OnShow()
  -- search for dropdown children inside spellFrame
  for _, child in ipairs({this:GetChildren()}) do
    if string.find(child:GetName(), "SelectVisualWarningAppearance$") then
      UIDropDownMenu_Initialize(child, me.InitializeVisualWarningDropdownMenu)
    end
  end
end

--[[
  @param {number} classID
]]--
function me.Init(classID)
  me.BuildGui(classID)
end

--[[
  @param {number} classID
]]--
function me.BuildGui(classID)
  local tabFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_2)
  local classResistScrollFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME)
  local classResistContentFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_CONTENT_FRAME)
  local classResistScrollFrameSlider = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME_SLIDER)
  -- spelllist for the according classID
  local spellList = mod.spellAvoidMap.GetAllForCategory(PVPW_CLASSLIST[classID])

  -- create scrollFrame if it does not yet exist
  if classResistScrollFrame == nil then
    mod.logger.LogDebug(me.tag, "classScrollFrame did not exist - creating")
    mod.guiHelper.CreateSpellListScrollFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_2,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME
    )
  end

  -- create contentFrame if it does not yet exist
  if classContentFrame == nil then
    mod.guiHelper.CreateSpellListContentFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_CONTENT_FRAME
    )
  end

  -- create slider if it does not yet exist
  if classResistScrollFrameSlider == nil then
    mod.guiHelper.CreateSpellListFrameSlider(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_2,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME_SLIDER
    )
  end

  -- reset gui
  mod.guiHelper.ResetView(
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_CONTENT_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME_SLIDER,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SPELL_FRAME
  )

  local position = 0

  for spellName, spellData in pairs(spellList) do
    if spellList[spellName].self_avoid then
      local classSpellFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SPELL_FRAME .. position)

      if classSpellFrame == nil then
        classSpellFrame = mod.guiHelper.CreateSpellFrame(
          PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_CONTENT_FRAME,
          PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_RESIST_SPELL_FRAME,
          position
        )
      end

      classSpellFrame.type = PVPW_CLASSLIST[classID]
      classSpellFrame.spellName = spellName

      spellData.type = PVPW_CLASSLIST[classID]
      spellData.spellName = spellName

      mod.guiHelper.ConfigureSpellFrame(
        classSpellFrame,
        spellData,
        PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
        PVPW_InitializeWarnResistMenuDropdown_OnShow
      )

      classSpellFrame:Show()
      position = position + 1
    else
      mod.logger.LogDebug(me.tag, "Ignoring showing spell - " .. spellName .." - for self avoid because it is excluded")
    end
  end

  tabFrame:Show()
end

--[[
  Create dropdownmenu for color selection
]]--
function me.InitializeVisualWarningDropdownMenu()
  local colors = PVPW_CONSTANTS.TEXTURES
  local classSpellFrame
  local dropdownFrame
  local button

  for colorName, color in pairs(colors) do
    button = mod.guiHelper.CreateDropdownButton(colorName, color.colorValue, me.DropDownMenuCallback)
    UIDropDownMenu_AddButton(button)
  end

  if string.find(this:GetName(), "Button$") ~= nil then
    dropdownmenu = this:GetParent()
    classSpellFrame = dropdownmenu:GetParent()
  else
    classSpellFrame = this
  end

  if dropdownFrame == nil then
    -- find dropdown inside spellFrame
    for _, child in ipairs({classSpellFrame:GetChildren()}) do
      if string.find(child:GetName(), "SelectVisualWarningAppearance$") then
        dropdownFrame = child
      end
    end
  end

  -- can't work with dropdownmenu if it can't be found
  if dropdownFrame == nil then
    mod.logger.LogError(me.tag, "Failed to retrieve dropdownFrame - abort")
    return
  end

  local color = mod.opt.GetVisualWarningColor(PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
    classSpellFrame.type, classSpellFrame.spellName)

  if color == nil then
    mod.logger.LogDebug(me.tag, "Color not set for spell - setting default color")
    mod.guiHelper.ChooseVisualWarningColor(
      classSpellFrame,
      PVPW_CONSTANTS.DEFAULT_COLOR,
      PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID
    )
    UIDropDownMenu_SetSelectedValue(dropdownFrame, PVPW_CONSTANTS.DEFAULT_COLOR)
  else
    mod.logger.LogDebug(me.tag, "Setting color " .. color .. " for spell " .. classSpellFrame.spellName)
    UIDropDownMenu_SetSelectedValue(dropdownFrame, color)
  end
end

--[[
  Callback for color dropdownmenu
]]--
function me.DropDownMenuCallback()
  -- UIDROPDOWNMENU_OPEN_MENU is the currently open dropdown menu
  UIDropDownMenu_SetSelectedValue(getglobal(UIDROPDOWNMENU_OPEN_MENU), this.value)
  mod.guiHelper.ChooseVisualWarningColor(
    getglobal(UIDROPDOWNMENU_OPEN_MENU):GetParent(),
    this.value,
    PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID
  )
end
