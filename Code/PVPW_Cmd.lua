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
mod.cmd = me

me.tag = "Cmd"

--[[
  Print cmd options for addon
]]--
local function ShowInfoMessage()
  local enable = pvpw.L["enable"] .. PVPW_CONSTANTS.ADDON_NAME .. "\n"
  local disable = pvpw.L["disable"] .. PVPW_CONSTANTS.ADDON_NAME .. "\n"
  local opt = pvpw.L["opt"]
  local reload = pvpw.L["reload"]

  DEFAULT_CHAT_FRAME:AddMessage(PVPW_CONSTANTS.ADDON_NAME .. ":\n")
  DEFAULT_CHAT_FRAME:AddMessage(enable)
  DEFAULT_CHAT_FRAME:AddMessage(disable)
  DEFAULT_CHAT_FRAME:AddMessage(opt)
  DEFAULT_CHAT_FRAME:AddMessage(reload)
end

--[[
  Setup slash command handler
]]--
function me.SetupSlashCmdList()
  SLASH_PVPWARN1 = "/pvpw"
  SLASH_PVPWARN2 = "/pvpwarn"

  SlashCmdList["PVPWARN"] = function(msg)
    mod.logger.LogDebug(me.tag, "/pvpw passed argument: " .. msg)

    if msg == "" or msg == "info" then
      ShowInfoMessage()
    elseif msg == "opt" then
      mod.opt.InitOptionsMenu()
      getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_OPTIONS_FRAME):Show()
    elseif msg == "disable" then
      PVPWarnOptions.disableAddon = true
    elseif msg == "enable" then
      PVPWarnOptions.disableAddon = false
    elseif msg == "rl" or msg == "reload" then
      ReloadUI()
    else
      mod.logger.PrintUserError("Invalid argument passed")
    end
  end
end
