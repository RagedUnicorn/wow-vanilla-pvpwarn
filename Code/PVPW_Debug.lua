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

--[[
  Some global functions for development and debugging purpose only. Include This
  file into PVPWarn.toc.

  Prefix global debug functions with '__PVPW__DEBUG__' to avoid any conflicts
  with other addons

  All functions can be called from the game with /run [functionName]
]]--

local mod = pvpw
local me = {}
mod.debug = me

me.tag = "Debug"

-- global
local _G = getfenv(0)

--[[
  @param {string} soundCategory
  @param {string} soundType
  @param {string} soundFileName
]]--
function _G.__PVPW__DEBUG__PlaySound(soundCategory, soundType, soundFileName)
  mod.sound.PlaySound(soundCategory, soundType, soundFileName)
end

--[[
  Examples:
    "Player gains Recklessness.", "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
    "Player's Minor Healthstone heals Player for 1000.", "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
    "You are afflicted by Psychic Scream.", "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"

    @param {string} message
    @param {string} eventType
]]--
function _G.__PVPW__DEBUG_SimulateCombatMessage(message, eventType)
  assert(type(message) == "string",
    string.format("bad argument #1 to `__PVPW__DEBUG_SimulateCombatMessage` (expected string got %s)", type(message)))

  assert(type(eventType) == "string",
    string.format("bad argument #2 to `__PVPW__DEBUG_SimulateCombatMessage` (expected string got %s)", type(eventType)))

  mod.eventHandler.HandleEvent(message, eventType)
end

--[[
  Display yellow alert texture
]]--
function _G.__PVPW__DEBUG_ShowYellowAlert()
  mod.visual.ShowVisual("yellow_debug_test", "yellow")
end

--[[
  Display violet alert texture
]]--
function _G.__PVPW__DEBUG_ShowVioletAlert()
  mod.visual.ShowVisual("violet_debug_test", "violet")
end

--[[
  Display red alert texture
]]--
function _G.__PVPW__DEBUG_ShowRedAlert()
  mod.visual.ShowVisual("red_debug_test", "red")
end

--[[
  Display orange alert texture
]]--
function _G.__PVPW__DEBUG_ShowOrangeAlert()
  mod.visual.ShowVisual("orange_debug_test", "orange")
end

--[[
  Display green alert texture
]]--
function _G.__PVPW__DEBUG_ShowGreenAlert()
  mod.visual.ShowVisual("green_debug_test", "green")
end

--[[
  Display blue alert texture
]]--
function _G.__PVPW__DEBUG_ShowBlueAlert()
  mod.visual.ShowVisual("blue_debug_test", "blue")
end
