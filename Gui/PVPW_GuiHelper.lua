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
mod.guiHelper = me

me.tag = "GuiHelper"

--[[
  Reset GUI elements in SpellWarnCast, SpellWarnResist Tab and EnemyResistMenu

  @param {string} scrollFrameName
  @param {string} contentFrameName
  @param {string} scrollFrameSliderName
  @param {string} spellFrameName
]]--
function me.ResetView(scrollFrameName, contentFrameName, scrollFrameSliderName, spellFrameName)
  local scrollFrame = getglobal(scrollFrameName)
  local contentFrame = getglobal(contentFrameName)
  local scrollFrameSlider = getglobal(scrollFrameSliderName)

  --[[
    attach content frame to scrollframe. This step has to be repeated each time
    a GUI for another screen has to be created so the area is correctly set and
    scrollable. If not done so the first created frame will decide the height of
    all others.
  ]]--
  scrollFrame:SetScrollChild(contentFrame)
  -- reset scrollFrameSlider scroll
  scrollFrameSlider:SetValue(0)
  -- reset contentframe scroll
  scrollFrame:SetVerticalScroll(0)

  --[[
    reset all spellFrames - a class might have less spells than another one and
    a different configuration
  ]]--
  local position = 0

  while getglobal(spellFrameName .. position) do
    local spellFrame = getglobal(spellFrameName .. position)
    -- sadly no |(or) support in lua for pattern matching
    for _, child in ipairs({spellFrame:GetChildren()}) do
      if string.find(child:GetName(), "ShowVisual$") then
        child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 210, -110)
        child:Hide()
      elseif string.find(child:GetName(), "VisualWarning$") then
        child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 10, -85)
        child:Hide()
      elseif string.find(child:GetName(), "SelectVisualWarningAppearance$") then
        child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 70, -80)
        child:Hide()
      elseif string.find(child:GetName(), "PlaySound$") or
        string.find(child:GetName(), "PlaySoundFade$") or
        string.find(child:GetName(), "ShowVisual$") or
        string.find(child:GetName(), "PlaySoundFade$") or
        string.find(child:GetName(), "SoundWarning$") or
        string.find(child:GetName(), "SoundFadeWarning$") then
        child:Hide()
      end
    end
    spellFrame:Hide()

    position = position + 1
  end
end

--[[
  Creates a scrollframe for scrollable content

  @param {string} viewFrameName
  @param {string} scrollFrameName
  @return {table}
    the created scrollFrame
]]--
function me.CreateSpellListScrollFrame(viewFrameName, scrollFrameName)
  local viewFrame = getglobal(viewFrameName)
  local scrollFrame = CreateFrame("ScrollFrame", scrollFrameName, viewFrame)

  scrollFrame:SetWidth(420)
  scrollFrame:SetHeight(320)
  scrollFrame:SetPoint("TOPLEFT", viewFrame, "TOPLEFT", 0, 0)
  scrollFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    insets = {left = -1.5, right = -1.5, top = -1.5, bottom = -1.5},
  })
  scrollFrame:SetBackdropColor(0, 0, 0, 1)
  scrollFrame:EnableMouseWheel(true)
  scrollFrame:SetScript("OnMouseWheel", me.ScrollFrame_OnMouseWheel)

  return scrollFrame
end

--[[
  Scroll callback for scrollable content. Also updates the associated
  scrollFrameSlider to its new position
]]--
function me.ScrollFrame_OnMouseWheel()
  local maxScroll = this:GetVerticalScrollRange()
  local scroll = this:GetVerticalScroll()
  local toScroll = (scroll - (20 * arg1))
  local scrollFrameSlider

  for _, child in ipairs({this:GetChildren()}) do
    if child:GetObjectType() == "Slider" then
      scrollFrameSlider = child
    end
  end

  if toScroll < 0 then
    this:SetVerticalScroll(0)
    me.Slider_UpdatePosition(scrollFrameSlider, 0, maxScroll)
  elseif toScroll > maxScroll then
    this:SetVerticalScroll(maxScroll)
    me.Slider_UpdatePosition(scrollFrameSlider, maxScroll, maxScroll)
  else
    this:SetVerticalScroll(toScroll)
    me.Slider_UpdatePosition(scrollFrameSlider, toScroll, maxScroll)
  end
end

--[[
  Update scrollframeslider position

  @param {table} scrollFrameSlider
    reference to the scrollframeslider that should get updated
  @param {number} scrollPosition
  @param {number} maxScroll
]]--
function me.Slider_UpdatePosition(scrollFrameSlider, scrollPosition, maxScroll)
  local position

  mod.logger.LogDebug(me.tag, "Content scrollposition: " .. scrollPosition)

  if scrollFrameSlider == nil then
    mod.logger.LogError(me.tag, "Unable to find frameslider for current scrollframe")
    return
  end

  position = 100 / (maxScroll / math.floor(scrollPosition))
  mod.logger.LogDebug(me.tag, "New Slider scrollposition: " .. math.ceil(position))
  scrollFrameSlider:SetValue(math.ceil(position))
end

--[[
  Creates a contentFrame for the scrollFrame

  @param {string} scrollFrameName
  @param {string} contentFrameName
  @return {table}
]]--
function me.CreateSpellListContentFrame(scrollFrameName, contentFrameName)
  local scrollFrame = getglobal(scrollFrameName)
  local contentFrame = CreateFrame("Frame", contentFrameName, scrollFrame)

  contentFrame:SetWidth(420)
  contentFrame:SetHeight(320)
  scrollFrame:SetScrollChild(contentFrame)

  return contentFrame
end

--[[
  Creates a draggable slider for the scrollFrame

  @param {string} viewName
  @param {string} scrollFrameName
  @param {string} scrollFrameSliderName
  @return {table}
]]--
function me.CreateSpellListFrameSlider(viewName, scrollFrameName, scrollFrameSliderName)
  local scrollBackground
  local viewFrame = getglobal(viewName)
  local scrollFrame = getglobal(scrollFrameName)
  local scrollFrameSlider = CreateFrame("Slider", scrollFrameSliderName,
    scrollFrame, "UIPanelScrollBarTemplate")

  scrollFrameSlider:SetPoint("TOPLEFT", viewFrame, "TOPRIGHT", 4, -16)
  scrollFrameSlider:SetPoint("BOTTOMLEFT", viewFrame, "BOTTOMRIGHT", 4, 16)
  scrollFrameSlider:SetMinMaxValues(
    PVPW_CONSTANTS.CLASS_CONFIG_SLIDER_MIN_VALUE,
    PVPW_CONSTANTS.CLASS_CONFIG_SLIDER_MAX_VALUE
  )
  scrollFrameSlider:SetValueStep(1)
  scrollFrameSlider:SetValue(0)
  scrollFrameSlider:SetWidth(16)
  -- sets the stepsize that is made when clicking on up or down arrow button
  scrollFrameSlider:SetHeight(10)
  scrollFrameSlider:SetScript("OnValueChanged", me.ScrollFrameSlider_OnValueChanged)
  scrollBackground = scrollFrameSlider:CreateTexture(nil, "BACKGROUND")
  scrollBackground:SetAllPoints(scrollFrameSlider)
  scrollBackground:SetTexture(0, 0, 0, 0.4)

  return scrollFrameSlider
end

--[[
  Callback for slider - called each time the value of the slider changes
]]--
function me.ScrollFrameSlider_OnValueChanged()
  local maxScroll, stepSize
  local scrollFrame = this:GetParent()

  if scrollFrame == nil then
    mod.logger.LogError(me.tag, "Unable to find scrollFrame")
    return
  end
  -- getmaxscroll of scrollFrame
  maxScroll = scrollFrame:GetVerticalScrollRange()
  -- translate max/min 0 - 100 to maxScroll
  stepSize = maxScroll / PVPW_CONSTANTS.CLASS_CONFIG_SLIDER_MAX_VALUE
  -- set vertical scroll of the contenframe - (currentslider value * stepsize)
  scrollFrame:SetVerticalScroll(this:GetValue() * stepSize)
end

--[[
  - When called because a spellFrame should be loaded
  - Called by activating or deactivating

  @param {table} classSpellFrame
    reference to the spellFrame that should get toggled
  @param  {string} type
    e.g. rogue, warrior, misc
  @param  {string} spellName
  @param {string} spellType
    type of the spell. See constants PVPW_CONSTANTS.SPELL_TYPE
]]--
function me.ToggleSpellFrame(spellFrame, type, spellName, spellType)
  -- retrieve status from configuration object
  local isSpellActive = mod.opt.IsSpellActive(spellType, type, spellName)
  local isSoundActive = mod.opt.IsSoundWarningActive(spellType, type, spellName)
  local isVisualActive = mod.opt.IsVisualWarningActive(spellType, type, spellName)
  local visualWarningColor = mod.opt.GetVisualWarningColor(spellType, type, spellName)
  local isSoundFadeActive

  -- only basic spell detection can have a fade sound
  if spellType == PVPW_CONSTANTS.SPELL_TYPE.SPELL then
    isSoundFadeActive = mod.opt.IsSoundFadeWarningActive(spellType, type, spellName)
    me.ToggleSoundFade(spellFrame, isSpellActive, isSoundFadeActive)
  end

  -- unable to determine color set to default color
  if not visualWarningColor then
    visualWarningColor = PVPW_CONSTANTS.DEFAULT_COLOR
  end

  for _, child in ipairs({spellFrame:GetChildren()}) do
    if string.find(child:GetName(), "SpellStatus$") then
      if isSpellActive then
        child:SetChecked(true)
      else
        child:SetChecked(false)
      end
    end
  end

  me.ToggleSound(spellFrame, isSpellActive, isSoundActive)
  me.ToggleVisual(spellFrame, isSpellActive, isVisualActive, visualWarningColor)
end

--[[
  @param {table} spellFrame
    reference to the spellFrame that should get toggled
  @param  {boolean} isSpellActive
  @param  {boolean} isSoundActive
]]--
function me.ToggleSound(spellFrame, isSpellActive, isSoundActive)
  --[[
    retrieve all children inside the frame. CheckButton and button are both valid
    children in this case
  ]]--
  for _, child in ipairs({spellFrame:GetChildren()}) do
    if string.find(child:GetName(), "PlaySound$") then
      if isSpellActive and isSoundActive then
        child:Enable()
      else
        child:Disable()
      end
    elseif string.find(child:GetName(), "SoundWarning$") then
      if isSpellActive then
        child:Enable()
      else
        child:Disable()
      end

      if isSoundActive then
        child:SetChecked(true)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            if isSpellActive then
              region:SetVertexColor(
                HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
            else
              region:SetVertexColor(
                GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
            end
          end
        end
      else
        child:SetChecked(false)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            region:SetVertexColor(
              GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
          end
        end
      end
    end
  end
end

--[[
  @param {table} spellFrame
    reference to the spellFrame that should get toggled
  @param  {boolean} isSpellActive
    whether the spell is active or inactive
  @param  {boolean} isVisualActive
    whether the visual alert is active or inactive
  @param {string} visualWarningColor
    color of the visual warning
]]--
function me.ToggleVisual(spellFrame, isSpellActive, isVisualActive, visualWarningColor)
  --[[
    retrieve all children inside the frame. CheckButton and button are both valid
    children in this case
  ]]--
  for _, child in ipairs({spellFrame:GetChildren()}) do
    if string.find(child:GetName(), "ShowVisual$") then
      if isSpellActive and isVisualActive then
        child:Enable()
      else
        child:Disable()
      end
    elseif string.find(child:GetName(), "VisualWarning$") then
      if isSpellActive then
        child:Enable()
      else
        child:Disable()
      end

      if isVisualActive then
        child:SetChecked(true)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            if isSpellActive then
              region:SetVertexColor(
                HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
            else
              region:SetVertexColor(
                GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
            end
          end
        end
      else
        child:SetChecked(false)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            region:SetVertexColor(
              GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
          end
        end
      end
    elseif string.find(child:GetName(), "SelectVisualWarningAppearance$") then
      if isSpellActive and isVisualActive then
        getglobal(child:GetName() .. "Button"):Enable()
        getglobal(child:GetName() .. "Text"):SetVertexColor(
          HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
      else
        getglobal(child:GetName() .. "Button"):Disable()
        getglobal(child:GetName() .. "Text"):SetVertexColor(
          GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
      end

      for _, color in pairs(PVPW_CONSTANTS.TEXTURES) do
        if color.colorValue == visualWarningColor then
          UIDropDownMenu_SetSelectedValue(child, i)
        end
      end
    end
  end

  -- search for fontstrings
  for _, region in ipairs({spellFrame:GetRegions()}) do
    if string.find(region:GetName() or "", "SpellName$") and region:IsObjectType("FontString") then
      if isSpellActive then
        region:SetVertexColor(
          HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
      else
        region:SetVertexColor(
          GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
      end
    end
  end
end

--[[
  @param {table} spellFrame
    reference to the spellFrame that should get toggled
  @param  {boolean} isSpellActive
  @param  {boolean} isSoundFadeActive
]]--
function me.ToggleSoundFade(spellFrame, isSpellActive, isSoundFadeActive)
  --[[
    retrieve all children inside the frame. CheckButton and button are both valid
    children in this case
  ]]--
  for _, child in ipairs({spellFrame:GetChildren()}) do
    if string.find(child:GetName(), "PlaySoundFade$") then
      if isSpellActive and isSoundFadeActive then
        child:Enable()
      else
        child:Disable()
      end
    elseif string.find(child:GetName(), "SoundFadeWarning$") then
      if isSpellActive then
        child:Enable()
      else
        child:Disable()
      end

      if isSoundFadeActive then
        child:SetChecked(true)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            if isSpellActive then
              region:SetVertexColor(
                HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
            else
              region:SetVertexColor(
                GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
            end
          end
        end
      else
        child:SetChecked(false)
        for _, region in ipairs({child:GetRegions()}) do
          if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
            region:SetVertexColor(
              GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
          end
        end
      end
    end
  end
end

--[[
  Creates a new spellFrame

  @param {string} contentFrameName
  @param {string} spellFrameName
    Base for the spellFrame name. Builds a fully name combinend with position
  @param {number} position
  @return {table}
    the created spellFrame
]]--
function me.CreateSpellFrame(contentFrameName, spellFrameName, position)
  local contentFrame = getglobal(contentFrameName)
  local spellFrame

  mod.logger.LogDebug(me.tag, "Creating new Spellcontainer" .. position
    .. " because it did not yet exist")

  spellFrame = CreateFrame("Frame", spellFrameName .. position,
    contentFrame, "PVPW_SpellConfigurationTemplate")
  spellFrame:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -position * 140)

  local texture = spellFrame:CreateTexture()
  texture:SetAllPoints()
  if math.mod(position, 2) == 0 then
    texture:SetTexture(.37, .37, .37, .8)
  else
    texture:SetTexture(.25, .25, .25, .8)
  end

  return spellFrame
end

--[[
  @param {table} spellFrame
  @param {table} spellData
  @param {string} spelltype
  @param {function} initializeDropdownCallback
    callback for spellFrame dropdown initialization
]]--
function me.ConfigureSpellFrame(spellFrame, spellData, spellType, initializeDropdownCallback)
  -- set data on spellFrame
  spellFrame:SetID(spellData.spellID)
  spellFrame.soundFileName = spellData.soundFileName
  spellFrame.spellType = spellType

  me.SetSpellTitle(spellFrame, spellData)

  if initializeDropdownCallback == nil then
    mod.logger.LogError(me.tag, "Spellframe is missing a callback for its dropdown")
  else
    spellFrame:SetScript("OnShow", initializeDropdownCallback)
  end

  --[[
    retrieve all children inside the frame. CheckButton and button are both valid
    children in this case
  ]]--
  for _, child in ipairs({spellFrame:GetChildren()}) do
    me.ConfigureSpellFrameObjects(child, spellData)

    if string.find(child:GetName(), "SpellIcon$") then
      me.SetSpellIcon(child, spellData)
    elseif string.find(child:GetName(), "SelectVisualWarningAppearance$") then
      if not spellData.hasFade then
        child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 70, -60)
      end
      child:Show()
    end
  end

  -- update spellFrame status
  mod.guiHelper.ToggleSpellFrame(spellFrame, spellData.type,
    spellData.spellName, spellType)
end

--[[
  Set title on the spellFrame

  @param {table} spellFrame
  @param {table} spellData
]]--
function me.SetSpellTitle(spellFrame, spellData)
  --[[
    Retrieve all regions inside the spellFrame. Both textures and fontstrings
    are of type region.
  ]]--
  for _, region in ipairs({spellFrame:GetRegions()}) do
    if region:IsObjectType("FontString") then
      if string.find(region:GetName(), "SpellName$") then
        region:SetText(spellData.name)
        return -- abort after first occurence
      end
    end
  end
end

--[[
  Set spell icon on spellFrame

  @param {table} button
    A gui button that holds the icon
  @param {table} spellData
]]--
function me.SetSpellIcon(button, spellData)
  -- set icon for spell
  for _, region in ipairs({button:GetRegions()}) do
    if string.find(region:GetName(), "SpellTexture$") then
      if spellData.spellIcon then
        region:SetTexture("Interface\\Icons\\" .. spellData.spellIcon)
      else
        mod.logger.LogError(me.tag, "Missing spellicon for spell: " .. spellData.name)
      end
    end
  end
end


--[[
  Attach OnEnter and OnLeave scripthandlers to a checkbutton for showing and
  hiding a tooltip

  @param {table} frame
    a reference to a checkbutton
]]--
function me.SetTooltipCallbackHandlers(frame)
  frame:SetScript("OnEnter", PVPW_SpellCheckButtonTooltip_OnEnter)
  frame:SetScript("OnLeave", PVPW_SpellCheckButtonTooltip_OnLeave)
end

--[[
  Set label texts for buttons and checkboxes in a spellframe

  @param {table} child
    A gui object
  @param {table} spellData
]]--
function me.ConfigureSpellFrameObjects(child, spellData)
  if string.find(child:GetName(), "SpellStatus$") then
    me.SetTooltipCallbackHandlers(child)
  elseif string.find(child:GetName(), "PlaySound$") then
    child:SetText(pvpw.L["play_sound"]) -- set label for play sound button
    child:SetWidth(
      child:GetFontString():GetStringWidth() + PVPW_CONSTANTS.BUTTON_DEFAULT_PADDING
    )
    child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 10, -110)
    child:Show()
  elseif string.find(child:GetName(), "PlaySoundFade$") and spellData.hasFade then
    child:SetText(pvpw.L["play_sound_fade"]) -- set label for play fade sound button
    child:SetWidth(
      child:GetFontString():GetStringWidth() + PVPW_CONSTANTS.BUTTON_DEFAULT_PADDING
    )

    local neighbour = mod.common.GetChildByName(child:GetParent(), "PlaySound$")

    if neighbour ~= nil then
      child:ClearAllPoints()
      child:SetPoint("TOPLEFT", neighbour, "TOPRIGHT", 0, 0)
    end

    child:Show()
  elseif string.find(child:GetName(), "ShowVisual$") then
    local neighbour -- neighbour button left side

    child:SetText(pvpw.L["show_visual"]) -- set label for show visual warning button

    child:SetWidth(
      child:GetFontString():GetStringWidth() + PVPW_CONSTANTS.BUTTON_DEFAULT_PADDING
    )

    if not spellData.hasFade then
      neighbour = mod.common.GetChildByName(child:GetParent(), "PlaySound$")
    else
      neighbour = mod.common.GetChildByName(child:GetParent(), "PlaySoundFade$")
    end

    if neighbour ~= nil then
      child:ClearAllPoints()
      child:SetPoint("TOPLEFT", neighbour, "TOPRIGHT", 0, 0)
    end

    child:Show()
  elseif string.find(child:GetName(), "SoundWarning$") then
    me.SetTooltipCallbackHandlers(child)
    -- sound warning checkbox set label
    for _, region in ipairs({child:GetRegions()}) do
      if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
        region:SetText(pvpw.L["sound_active"])
      end
    end
    child:Show()
  elseif string.find(child:GetName(), "SoundFadeWarning$") and spellData.hasFade then
    me.SetTooltipCallbackHandlers(child)
    -- sound fade warning checkbox set label
    for _, region in ipairs({child:GetRegions()}) do
      if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
        region:SetText(pvpw.L["sound_fade_active"])
      end
    end
    child:Show()
  elseif string.find(child:GetName(), "VisualWarning$") then
    me.SetTooltipCallbackHandlers(child)
    -- visual warning checkbox set label
    for _, region in ipairs({child:GetRegions()}) do
      if string.find(region:GetName() or "", "Text$") and region:IsObjectType("FontString") then
        region:SetText(pvpw.L["visual_active"])
      end
    end
    if not spellData.hasFade then
      child:SetPoint("TOPLEFT", child:GetParent(), "TOPLEFT", 10, -65)
    end
    child:Show()
  end
end

--[[
  Create a dropwdownbutton for visual color selection

  @param {string} text
  @param {string} value
  @param {function} callback
  @return {table}
    the created button
]]--
function me.CreateDropdownButton(text, value, callback)
  local button = {}

  button.text = pvpw.L["texture_" .. text]
  button.value = value
  button.func = callback

  return button
end

--[[
  Callback for choosing a visual warning color in dropdownmenu

  @param {table} classSpellFrame
  @param {number} color
  @param {string} spellList
    What spellList to be used - see PVPW_CONSTANTS.SPELL_TYPE
]]--
function me.ChooseVisualWarningColor(classSpellFrame, color, spellList)
  mod.opt.SetVisualWarningColor(spellList,
    classSpellFrame.type, classSpellFrame.spellName, tonumber(color))
end
