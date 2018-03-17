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
mod.logger = me

--[[
  debug - 4
  info - 3
  warn - 2
  error 1
]]--
me.logLevel = 1
me.debug = 4
me.info = 3
me.warn = 2
me.error = 1

-- log events
me.logEvent = false

me.colors = {}
me.colors.error = "|cfff00000"  -- red
me.colors.warn = "|cffffce01"   -- yellow
me.colors.info = "|cff18f3ff"   -- blue
me.colors.debug = "|cff7413d9"  -- magenta
me.colors.event = "|cff1cdb4f"  -- green

--[[
  @param {string} tag
  @param {string} message
]]--
function me.LogDebug(tag, message)
  if tag == nil then
    tag = ""
  end

  if me.logLevel == me.debug then
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.debug .. PVPW_CONSTANTS.ADDON_NAME_SHORT .. ":" ..
      tag .. " - " .. message)
  end
end

--[[
  @param {string} tag
  @param {string} message
]]--
function me.LogInfo(tag, message)
  if tag == nil then
    tag = ""
  end

  if me.logLevel >= me.info then
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.info .. PVPW_CONSTANTS.ADDON_NAME_SHORT .. ":" ..
      tag .. " - " .. message)
  end
end

--[[
  @param {string} tag
  @param {string} message
]]--
function me.LogWarn(tag, message)
  if tag == nil then
    tag = ""
  end

  if me.logLevel >= me.warn then
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.warn .. PVPW_CONSTANTS.ADDON_NAME_SHORT .. ":" ..
      tag .. " - " .. message)
  end
end

--[[
  @param {string} tag
  @param {string} message
]]--
function me.LogError(tag, message)
  if tag == nil then
    tag = ""
  end

  if me.logLevel >= me.error then
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.error .. PVPW_CONSTANTS.ADDON_NAME_SHORT .. ":" ..
      tag .. " - " .. message)
  end
end

--[[
  @param {string} tag
  @param {string} message
]]--
function me.LogEvent(tag, message)
  if tag == nil then
    tag = ""
  end

  if me.logEvent == true then
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.event .. PVPW_CONSTANTS.ADDON_NAME_SHORT .. ":" ..
      tag .. " - " .. message)
  end
end

--[[
  Print a colorozed message to the chatframe. The message will be printed even when
  logging is set to errors only

  @param {string} tag
  @param {string} msg
  @param {number} r
  @param {number} g
  @param {number} b
]]--
function me.Print(tag, msg, r, g, b)
    if tag == nil then
      tag = ""
    end

    DEFAULT_CHAT_FRAME:AddMessage("|cffff8040" .. tag .. ":|r " .. msg, r, g, b)
end

--[[
  Display a message in the standard error frame

  @param {string} msg
]]--
function me.PrintUserError(msg)
  UIErrorsFrame:AddMessage(msg, 1.0, 0.0, 0.0, 53, 5)
end
