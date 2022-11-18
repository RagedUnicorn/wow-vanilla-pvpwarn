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

local mod = pvpw
local me = {}
mod.logger = me

--[[
  debug - 4
  info - 3
  warn - 2
  error 1
]]--
me.logLevel = PVPW_ENVIRONMENT.LOG_LEVEL
me.debug = 4
me.info = 3
me.warn = 2
me.error = 1

-- log events
me.logEvent = PVPW_ENVIRONMENT.LOG_EVENT

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
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.debug .. PVPW_ENVIRONMENT.ADDON_NAME_SHORT .. ":" ..
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
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.info .. PVPW_ENVIRONMENT.ADDON_NAME_SHORT .. ":" ..
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
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.warn .. PVPW_ENVIRONMENT.ADDON_NAME_SHORT .. ":" ..
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
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.error .. PVPW_ENVIRONMENT.ADDON_NAME_SHORT .. ":" ..
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
    DEFAULT_CHAT_FRAME:AddMessage(me.colors.event .. PVPW_ENVIRONMENT.ADDON_NAME_SHORT .. ":" ..
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
