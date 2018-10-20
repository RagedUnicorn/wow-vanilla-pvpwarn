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


--[[
  SpellWarn tab is responsible for configuring spells that are alerted to the player
  if an enemy casts them
]]--

local mod = pvpw
local me = {}
mod.spellWarnCastTab = me

me.tag = "SpellWarnCastTab"

--[[
  OnShow callback for spellFrames. Initializes dropdown with color option for
  visual warning
]]--
function PVPW_InitializeWarnCastMenuDropdown_OnShow()
  -- search for dropdown children inside spellFrame
  for _, child in ipairs({this:GetChildren()}) do
    if string.find(child:GetName(), "SelectVisualWarningAppearance$") then
      UIDropDownMenu_Initialize(child, me.InitializeVisualWarningDropdownMenu)
    end
  end
end

--[[
  @param {number} classId
]]--
function me.Init(classId)
  mod.logger.LogDebug(me.tag, "Initialize: " .. me.tag)
  me.BuildGui(classId)
end

--[[
  @param {number} classId
]]--
function me.BuildGui(classId)
  local tabFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_1)
  local classScrollFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME)
  local classContentFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONTENT_FRAME)
  local classScrollFrameSlider = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME_SLIDER)
  -- spelllist for the according classId
  local spellList = mod.spellMap.GetAllForCategory(PVPW_CLASSLIST[classId])

  -- create scrollFrame if it does not yet exist
  if classScrollFrame == nil then
    mod.logger.LogDebug(me.tag, "classScrollFrame did not exist - creating")
    mod.guiHelper.CreateSpellListScrollFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_1,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME
    )
  end

  -- create contentFrame if it does not yet exist
  if classContentFrame == nil then
    mod.guiHelper.CreateSpellListContentFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONTENT_FRAME
    )
  end

  -- create slider if it does not yet exist
  if classScrollFrameSlider == nil then
    mod.guiHelper.CreateSpellListFrameSlider(
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_1,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME_SLIDER
    )
  end

  mod.guiHelper.ResetView(
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONTENT_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SCROLL_FRAME_SLIDER,
    PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SPELL_FRAME
  )

  local position = 0

  for spellName, spellData in pairs(spellList) do
    local classSpellFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SPELL_FRAME .. position)

    if classSpellFrame == nil then
      classSpellFrame = mod.guiHelper.CreateSpellFrame(
        PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_CONTENT_FRAME,
        PVPW_CONSTANTS.ELEMENT_PVPW_CLASS_SPELL_FRAME,
        position
      )
    end

    classSpellFrame.type = PVPW_CLASSLIST[classId]
    classSpellFrame.spellName = spellName

    spellData.type = PVPW_CLASSLIST[classId]
    spellData.spellName = spellName

    mod.guiHelper.ConfigureSpellFrame(
      classSpellFrame,
      spellData,
      PVPW_CONSTANTS.SPELL_TYPE.SPELL,
      PVPW_InitializeWarnCastMenuDropdown_OnShow
    )

    classSpellFrame:Show()
    position = position + 1
  end

  -- show tabframe
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

  local color = mod.opt.GetVisualWarningColor(PVPW_CONSTANTS.SPELL_TYPE.SPELL,
    classSpellFrame.type, classSpellFrame.spellName)

  if color == nil then
    mod.logger.LogDebug(me.tag, "Color not set for spell - setting default color")
    mod.guiHelper.ChooseVisualWarningColor(
      classSpellFrame,
      PVPW_CONSTANTS.DEFAULT_COLOR,
      PVPW_CONSTANTS.SPELL_TYPE.SPELL
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
    PVPW_CONSTANTS.SPELL_TYPE.SPELL
  )
end
