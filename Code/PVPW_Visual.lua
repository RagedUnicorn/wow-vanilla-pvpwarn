--[[
  PVPWarn - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2018 Michael Wiesendanger <michael.wiesendanger@gmail.com>

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
