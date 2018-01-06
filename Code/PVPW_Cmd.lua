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
