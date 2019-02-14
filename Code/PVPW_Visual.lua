--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
mod.visual = me

me.tag = "Visual"

--[[
  Private
]]--
local TEXTURE_BASE_PATH = "Interface\\AddOns\\PVPWarn\\Assets\\Images\\"
local ICON_TEXTURE_BASE_PATH = "Interface\\Icons\\"

--[[
  Watch over alert icons slots and whether they are in use or not
]]--
local alertIconSlotStateHolder = {
  [1] = {
    ["inUse"] = false,
    ["startTime"] = nil
  },
  [2] = {
    ["inUse"] = false,
    ["startTime"] = nil
  },
  [3] = {
    ["inUse"] = false,
    ["startTime"] = nil
  },
  [4] = {
    ["inUse"] = false,
    ["startTime"] = nil
  },
  [5] = {
    ["inUse"] = false,
    ["startTime"] = nil
  }
}

--[[
  Create the basic world frame and its texture that displays alert flashes
]]--
function me.CreateVisualAlertFrame()
  local alertFrame = CreateFrame("Frame", PVPW_CONSTANTS.ELEMENT_ALERT_FRAME, UIParent)
  local texture = alertFrame:CreateTexture(PVPW_CONSTANTS.ELEMENT_ALERT_TEXTURE, "BACKGROUND")

  texture:SetBlendMode("ADD")
  texture:SetAllPoints(WorldFrame)
end

--[[
  Show a visual warning to the user

  @param {number} colorValue
    see PVPW_CONSTANTS.TEXTURES for color values
]]--
function me.ShowVisualAlert(colorValue)
  local alertFrame = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_FRAME)
  local colorTexture
  local texturePath

  for _, color in pairs(PVPW_CONSTANTS.TEXTURES) do
    if color.colorValue == tonumber(colorValue) then
      colorTexture = color.textureName
    end
  end

  if colorTexture == nil then
    mod.logger.LogError(me.tag, "Error invalid colorValue - " .. colorValue)
    return
  end

  texturePath = TEXTURE_BASE_PATH .. colorTexture
  mod.logger.LogDebug(me.tag, "Displaying warning texture - " .. texturePath)

  getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_TEXTURE):SetTexture(texturePath)
  UIFrameFlash(alertFrame, .2, .5, .7, false, 0, 0)
end

--[[
  Setup the basic frame that hold icon alert slots
]]--
function me.CreateVisualAlertIconFrame()
  local alertIconFrame = CreateFrame("Frame", PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME, UIParent)
  alertIconFrame:SetWidth(PVPW_CONSTANTS.MAX_ALERT_ICON_SLOTS * PVPW_CONSTANTS.ELEMENT_ALERT_ICON_SLOT_WIDTH)
  alertIconFrame:SetHeight(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_SLOT_HEIGHT)
  alertIconFrame:SetBackdropColor(0.3, 0.5, 0.5, 1)
  alertIconFrame:SetBackdropBorderColor(0.3, 0, 0.5, 1)

  local framePosition = mod.addonOptions.GetUserPlacedFramePosition(
    PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME)

  if framePosition ~= nil then
    alertIconFrame:SetPoint(
      "TOPLEFT",
      framePosition.posX,
      framePosition.posY
    )
  else
    -- initial position for first time use
    alertIconFrame:SetPoint("CENTER", UIParent)
  end

  me.CreateAlertIconSlots(alertIconFrame)
end

--[[
  create alert icon slots

  @param {table} parentFrame
]]--
function me.CreateAlertIconSlots(parentFrame)
  local position = 0

  for i = 1, PVPW_CONSTANTS.MAX_ALERT_ICON_SLOTS  do
    local alertIconSlot = CreateFrame(
      "CheckButton",
      PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER .. i,
      parentFrame,
      PVPW_CONSTANTS.ELEMENT_ALERT_ICON_SLOT_TEMPLATE
    )

    alertIconSlot:SetPoint(
      "TOPLEFT",
      parentFrame,
      "TOPLEFT",
      2 + position * 36,
      -2
    )

    position = position + 1
  end
end

--[[
  @param {string} spellIconName
]]--
function me.ShowVisualAlertIcon(spellIconName)
  local slotPosition = me.FindEmptyAlertIconSlot()

  if slotPosition ~= nil then
    local alertIconHolder = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER .. slotPosition)
    for _, region in ipairs({alertIconHolder:GetRegions()}) do
      if string.find(region:GetName(), PVPW_CONSTANTS.ELEMENT_ALERT_ICON_TEXTURE .. "$") then
        region:SetTexture(ICON_TEXTURE_BASE_PATH .. spellIconName)
      end
    end

    --[[
      @param {table} frame
        Frame Pointer - frame to fade in / out.
      @param {number} fadeInTime
        Number - duration of the fade in effect.
      @param {number} fadeOutTime
        Number - duration of the fade out effect.
      @param {number} flashDuration
        Number - number of seconds to keep repeating the fade in / out cycle.
      @param {boolean} showWhenDone
        Boolean - should the frame be visible at the end?
      @param {number} flashInHoldTime
        Number - number of seconds to hold the fully hidden state.
      @param {number} flashOutHoldTime
        Number - number of seconds to hold the fully visible state.
    ]]--
    UIFrameFlash(alertIconHolder, 1, 2, 6, false, 0, 0)
  else
    mod.logger.LogWarn(me.tag, "Unable to find an empty alert icon slot - skipping")
  end
end

--[[
  @param {boolean} enableConfigurationMode
    true - for enabling configuration mode
    false - for disabling configuration mode
]]--
function me.ConfigureVisualAlertIcon(enableConfigurationMode)
  local alertIconFrame = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME)

  if enableConfigurationMode then
    for i = 1, PVPW_CONSTANTS.MAX_ALERT_ICON_SLOTS  do
      local alertIconHolder = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER .. i)
      local spellIconName = PVPW_CONSTANTS.ELEMENT_ALERT_ICON_CONFIGURE_ICON

      for _, region in ipairs({alertIconHolder:GetRegions()}) do
        if string.find(region:GetName(), PVPW_CONSTANTS.ELEMENT_ALERT_ICON_TEXTURE .. "$") then
          region:SetTexture(ICON_TEXTURE_BASE_PATH .. spellIconName)
        end
      end

      alertIconHolder:EnableMouse(true)
      alertIconHolder:RegisterForDrag("LeftButton")
      alertIconHolder:SetScript("OnMouseDown", me.StartMovingOnMouseDown)
      alertIconHolder:SetScript("OnMouseUp", me.StopMovingOrSizingOnMouseUp)

      alertIconHolder:Show()
    end

    alertIconFrame:SetMovable(true)
    alertIconFrame:Show()
  else
    for i = 1, PVPW_CONSTANTS.MAX_ALERT_ICON_SLOTS  do
      local alertIconHolder = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER .. i)

      alertIconHolder:SetMovable(false)
      alertIconHolder:EnableMouse(false)
      alertIconHolder:RegisterForDrag("LeftButton")
      alertIconHolder:SetScript("OnMouseDown", nil)
      alertIconHolder:SetScript("OnMouseUp", nil)

      alertIconHolder:Hide()
    end

    alertIconFrame:SetMovable(false)
  end
end

--[[
  Callbackhandler for alertIconFrame onMouseDown. Start moving the parentframe and not
  the icon slot itself
]]--
function me.StartMovingOnMouseDown()
  this:GetParent():StartMoving()
end

--[[
  Callbackhandler for alertIconFrame onMouseUp. Stop moving the parentframe and
  not the icon slot itself
]]--
function me.StopMovingOrSizingOnMouseUp()
  this:GetParent():StopMovingOrSizing()

  -- retrieve point of parentframe
  local _, _, _, posX, posY = this:GetParent():GetPoint()

  mod.addonOptions.SaveUserPlacedFramePosition(
    PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME,
    posX,
    posY
  )
end

--[[
  Update alert icon holder slots based on their startTime and set them to free
  if time ran out
]]--
function me.UpdateAlertIconHolderState()
  for i = 1, table.getn(alertIconSlotStateHolder) do
    if alertIconSlotStateHolder[i].inUse then
      if GetTime() - alertIconSlotStateHolder[i].startTime >= PVPW_CONSTANTS.ALERT_ICON_FLASH_TIME then
        alertIconSlotStateHolder[i].inUse = false
        alertIconSlotStateHolder[i].startTime = nil
        mod.logger.LogInfo(me.tag, "Resetting alertIconSlot(pos" .. i ..  ") to free")
      end
    end
  end
end

--[[
  Search for an empty alert icon slot

  @return {number | nil}
    number - slot position that is free
    nil - if no free position could be found
]]--
function me.FindEmptyAlertIconSlot()
  for i = 1, table.getn(alertIconSlotStateHolder) do
    if not alertIconSlotStateHolder[i].inUse then
      alertIconSlotStateHolder[i].inUse = true
      alertIconSlotStateHolder[i].startTime = GetTime()
      -- slot is free
      return i
    end
  end

  return nil
end
