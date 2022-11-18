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
  The "Enemy Avoid" menu is responsible for configuring spells for the current
  class that are alerted to the player if an enemy resists them
]]--

local mod = pvpw
local me = {}
mod.spellResistMenu = me

me.tag = "SpellResistMenu"

--[[
  OnShow callback for spellFrames. Initializes dropdown with color option for
  visual warning
]]--
function PVPW_InitializeResistMenuDropdown_OnShow()
  -- search for dropdown children inside spellFrame
  for _, child in ipairs({this:GetChildren()}) do
    if string.find(child:GetName(), "SelectVisualWarningAppearance$") then
      UIDropDownMenu_Initialize(child, me.InitializeVisualWarningDropdownMenu)
    end
  end
end

function me.Init()
  mod.logger.LogDebug(me.tag, "Initialize: " .. me.tag)
  me.BuildGui()
end

function me.BuildGui()
  local enemyResistFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_FRAME)
  local enemyResistContentFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME)
  local selfResistScrollFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME)
  local selfResistScrollFrameSlider = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME_SLIDER)
  local selfResistContentFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME)

  local className = strlower(mod.common.GetPlayerClassName())
  mod.logger.LogDebug(me.tag, "Enemyresist menu class detected - " .. className)

  local spellList = mod.spellAvoidMap.GetAllForCategory(className)

  -- create scrollFrame if it does not yet exist
  if selfResistScrollFrame == nil then
    mod.logger.LogDebug(me.tag, "classScrollFrame did not exist - creating")
    mod.guiHelper.CreateSpellListScrollFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME
    )
  end

  -- create contentFrame if it does not yet exist
  if enemyResistContentFrame == nil then
    mod.guiHelper.CreateSpellListContentFrame(
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME
    )
  end

  -- create slider if it does not yet exist
  if selfResistScrollFrameSlider == nil then
    mod.guiHelper.CreateSpellListFrameSlider(
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME,
      PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME_SLIDER
    )
  end

  -- reset gui
  mod.guiHelper.ResetView(
    PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME,
    PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME_SLIDER,
    PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SPELL_FRAME
  )

  local position = 0

  for spellName, spellData in pairs(spellList) do
    if spellList[spellName].enemy_avoid then
      local selfResistSpellFrame = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SPELL_FRAME .. position)

      if selfResistSpellFrame == nil then
        selfResistSpellFrame = mod.guiHelper.CreateSpellFrame(
          PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME,
          PVPW_CONSTANTS.ELEMENT_PVPW_SELF_RESIST_SPELL_FRAME,
          position
        )
      end

      selfResistSpellFrame.type = strlower(mod.common.GetPlayerClassName())
      selfResistSpellFrame.spellName = spellName

      spellData.type = strlower(mod.common.GetPlayerClassName())
      spellData.spellName = spellName

      mod.guiHelper.ConfigureSpellFrame(
        selfResistSpellFrame,
        spellData,
        PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
        PVPW_InitializeResistMenuDropdown_OnShow
      )

      selfResistSpellFrame:Show()
      position = position + 1
    else
      mod.logger.LogDebug(me.tag, "Ignoring showing spell - " .. spellName .." - for enemy avoid because it is excluded")
    end
  end

  enemyResistFrame:Show()
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

  local color = mod.opt.GetVisualWarningColor(PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
    classSpellFrame.type, classSpellFrame.spellName)

  if color == nil then
    mod.logger.LogDebug(me.tag, "Color not set for spell - setting default color")
    mod.guiHelper.ChooseVisualWarningColor(
      classSpellFrame,
      PVPW_CONSTANTS.DEFAULT_COLOR,
      PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID
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
    PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID
  )
end
