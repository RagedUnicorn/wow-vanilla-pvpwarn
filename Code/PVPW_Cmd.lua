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
  DEFAULT_CHAT_FRAME:AddMessage(pvpw.L["info_title"])
  DEFAULT_CHAT_FRAME:AddMessage(pvpw.L["enable"])
  DEFAULT_CHAT_FRAME:AddMessage(pvpw.L["disable"])
  DEFAULT_CHAT_FRAME:AddMessage(pvpw.L["opt"])
  DEFAULT_CHAT_FRAME:AddMessage(pvpw.L["reload"])
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
    elseif msg == "disable" then
      mod.addonOptions.DisableAddon()
    elseif msg == "enable" then
      mod.addonOptions.EnableAddon()
    elseif msg == "rl" or msg == "reload" then
      ReloadUI()
    else
      mod.logger.PrintUserError("Invalid argument passed")
    end
  end
end
