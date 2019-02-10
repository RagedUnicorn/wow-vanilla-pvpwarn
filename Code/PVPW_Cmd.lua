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
    local args = {}

    mod.logger.LogDebug(me.tag, "/pvpw passed argument: " .. msg)

    -- parse arguments by whitespace
    for arg in string.gfind(msg, "%S+") do
      table.insert(args, arg)
    end


    if args[1] == "" or args[1] == "info" or table.getn(args) == 0 then
      ShowInfoMessage()
    elseif args[1] == "opt" then
      mod.opt.InitOptionsMenu()
    elseif args[1] == "disable" then
      mod.addonOptions.DisableAddon()
    elseif args[1] == "enable" then
      mod.addonOptions.EnableAddon()
    elseif args[1] == "rl" or args[1] == "reload" then
      ReloadUI()
    elseif args[1] == "conf" or "configure" then
      if args[2] == "enable" then
        mod.visual.ConfigureVisualAlertIcon(true)
      elseif args[2] == "disable" then
        mod.visual.ConfigureVisualAlertIcon(false)
      else
        mod.logger.PrintUserError("Invalid argument passed")
      end
    else
      mod.logger.PrintUserError("Invalid argument passed")
    end
  end
end
