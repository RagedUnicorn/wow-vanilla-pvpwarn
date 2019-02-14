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
  Play a sound to the player

  @param {string} soundCategory
  @param {string} spellType
  @param {string} soundFileName
]]--
function _G.__PVPW__DEBUG__PlaySound(soundCategory, spellType, soundFileName)
  mod.sound.PlaySound(soundCategory, spellType, soundFileName)
end

--[[
  Display an alertIcon on the players screen. For icon names see `PVPW_SpellMap.lua`
]]--
function _G.__PVPW__DEBUG__DisplayAlertIcon()
  local spellIconName = "spell_nature_ancestralguardian"
  mod.visual.ShowVisualAlertIcon(spellIconName)
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
  mod.visual.ShowVisualAlert(1)
end

--[[
  Display violet alert texture
]]--
function _G.__PVPW__DEBUG_ShowVioletAlert()
  mod.visual.ShowVisualAlert(2)
end

--[[
  Display red alert texture
]]--
function _G.__PVPW__DEBUG_ShowRedAlert()
  mod.visual.ShowVisualAlert(3)
end

--[[
  Display orange alert texture
]]--
function _G.__PVPW__DEBUG_ShowOrangeAlert()
  mod.visual.ShowVisualAlert(4)
end

--[[
  Display green alert texture
]]--
function _G.__PVPW__DEBUG_ShowGreenAlert()
  mod.visual.ShowVisualAlert(5)
end

--[[
  Display blue alert texture
]]--
function _G.__PVPW__DEBUG_ShowBlueAlert()
  mod.visual.ShowVisualAlert(6)
end

--[[
  Display brown alert texture
]]--
function _G.__PVPW__DEBUG_ShowBrownAlert()
  mod.visual.ShowVisualAlert(7)
end

--[[
  Display white alert texture
]]--
function _G.__PVPW__DEBUG_ShowWhiteAlert()
  mod.visual.ShowVisualAlert(8)
end

--[[
  Display pink alert texture
]]--
function _G.__PVPW__DEBUG_ShowPinkAlert()
  mod.visual.ShowVisualAlert(9)
end

--[[
  Display light blue alert texture
]]--
function _G.__PVPW__DEBUG_ShowLightBlueAlert()
  mod.visual.ShowVisualAlert(10)
end
