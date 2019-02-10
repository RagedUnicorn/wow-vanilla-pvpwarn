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

--[[
  Show a visual warning to the user

  @param {string} warnName
  @param {string} colorValue
    see PVPW_CONSTANTS.TEXTURES for color values
]]--
-- TODO rename to ShowVisualAlert
-- TODO parameter warnName unnused
function me.ShowVisual(warnName, colorValue)
  local basePath = TEXTURE_BASE_PATH
  local colorTexture
  local texturePath, texture

  for _, color in pairs(PVPW_CONSTANTS.TEXTURES) do
    if color.colorValue == tonumber(colorValue) then
      colorTexture = color.textureName
    end
  end

  if colorTexture == nil then
    mod.logger.LogError(me.tag, "Error invalid colorValue - " .. colorValue)
    return
  end

  texturePath = basePath .. colorTexture

  mod.logger.LogDebug(me.tag, "Displaying warning texture - " .. texturePath)

  --[[
    If a new texture is created each time they will overlap each other. Avoid
    this by reusing once a texture is created
  ]]--
  if PVPW_AlertTexture == nil then
    mod.logger.LogDebug(me.tag, "Texture not found - creating")
    texture = PVPW_AlertFrame:CreateTexture("PVPW_AlertTexture", "BACKGROUND")
  else
    mod.logger.LogDebug(me.tag, "Texture already exists - reusing")
    texture = PVPW_AlertTexture
  end

  texture:SetBlendMode("ADD")
  texture:SetTexture(texturePath)

  texture:SetAllPoints(WorldFrame)
  PVPW_AlertFrame.texture = texture
  UIFrameFlash(PVPW_AlertFrame, .2, .5, .7, false, 0, 0)
end

function me.CreateVisualIconFrame()
  local alertIconFrame = CreateFrame("Frame", PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME, UIParent)
  local alertIconHolder = CreateFrame("Button", PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER, alertIconFrame)

  alertIconFrame:SetWidth(40)
  alertIconFrame:SetHeight(40)
  alertIconFrame:SetBackdropColor(0, 0, 0, 1)
  alertIconFrame:SetBackdropBorderColor(0, 0, 0, 1)

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

  -- create texture holder
  alertIconHolder.texture = alertIconHolder:CreateTexture(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_TEXTURE, "OVERLAY")
end

--[[
  @param {string} spellIconName
]]--
function me.ShowVisualAlertIcon(spellIconName)
  local alertIconHolder = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER)
  for _, region in ipairs({alertIconHolder:GetRegions()}) do
    if string.find(region:GetName(), PVPW_CONSTANTS.ELEMENT_ALERT_ICON_TEXTURE) then
      region:SetTexture("Interface\\Icons\\" .. spellIconName)
      region:SetAllPoints(getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME))
    end
  end

  -- TODO document parameters
  UIFrameFlash(alertIconHolder, 1, 2, 8, false, 0, 5)
end

function me.ConfigureVisualAlertIcon(enableConfigurationMode)
  local alertIconFrame = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME)
  local alertIconHolder = getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_HOLDER)

  if enableConfigurationMode then
    local spellIconName = "ability_criticalstrike"

    for _, region in ipairs({alertIconHolder:GetRegions()}) do
      if string.find(region:GetName(), PVPW_CONSTANTS.ELEMENT_ALERT_ICON_TEXTURE) then
        region:SetTexture("Interface\\Icons\\" .. spellIconName)
        region:SetAllPoints(getglobal(PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME))
      end
    end

    alertIconFrame:SetMovable(true)
    alertIconFrame:EnableMouse(true)
    alertIconFrame:RegisterForDrag("LeftButton")
    alertIconFrame:SetScript("OnMouseDown", me.StartMovingOnMouseDown)
    alertIconFrame:SetScript("OnMouseUp", me.StopMovingOrSizingOnMouseUp)

    alertIconHolder:Show()
  else
    alertIconFrame:SetMovable(false)
    alertIconFrame:EnableMouse(false)
    alertIconFrame:SetScript("OnMouseDown", nil)
    alertIconFrame:SetScript("OnMouseUp", nil)

    alertIconHolder:Hide()
  end
end

--[[
  Callbackhandler for alertIconFrame onMouseDown
]]--
function me.StartMovingOnMouseDown()
  this:StartMoving()
end

--[[
  Callbackhandler for alertIconFrame onMouseUp
]]--
function me.StopMovingOrSizingOnMouseUp()
  this:StopMovingOrSizing()

  local _, _, _, posX, posY = this:GetPoint()

  mod.addonOptions.SaveUserPlacedFramePosition(
    PVPW_CONSTANTS.ELEMENT_ALERT_ICON_FRAME,
    posX,
    posY
  )
end
