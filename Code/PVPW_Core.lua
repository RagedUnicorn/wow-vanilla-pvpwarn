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

pvpw = pvpw or {}
local me = pvpw

me.tag = "Core"

local _G = getfenv(0)

--[[
  Testing

  Hook GetLocale to return a fixed value. Deactivate in production!
  Note: This is used for testing only. If the locale doesn't match with the actual
  locale of the combatlog the addon is unable to parse the log.
]]--
--[[
  function _G.GetLocale()
    return "deDE"
  end
]]--

--[[
  Store logdata for tests
]]--
-- PVPWarnLog = {}

--[[
  Saved addon variable
]]--
PVPWarnOptions = {
  ["disableAddon"] = false,
  ["disableAddonInBattlegrounds"] = false,
  ["showEventsForTargetOnly"] = false,
  ["ignoreEventsWhileDead"] = false,
  --[[
    Enemy spells being casted/used/activated
  ]]--
  ["spellList"] = nil,
  --[[
    Spells that the player avoided
  ]]--
  ["spellSelfAvoidList"] = nil,
  --[[
    Spells that an enemy player avoided
  ]]--
  ["spellEnemyAvoidList"] = nil
}

PVPWarnProfiles = {}

--[[
  Addon load
]]--
function me.OnLoad()
  me.RegisterEvents()
  me.cmd.SetupSlashCmdList()
end

--[[
  MainFrame OnEvent handler
]]--
function me.OnEvent()
  local messageType

  if event == PVPW_CONSTANTS.PLAYER_LOGIN then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_LOGIN)
    me.Initialize()
    me.player.UpdatePlayerHealthStatus()
  elseif event == PVPW_CONSTANTS.PLAYER_ENTERING_WORLD then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_ENTERING_WORLD)
    me.zone.UpdatePlayerZoneStatus()
  elseif event == PVPW_CONSTANTS.ZONE_CHANGED_NEW_AREA then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.ZONE_CHANGED_NEW_AREA)
    me.zone.UpdatePlayerZoneStatus()
  elseif event == PVPW_CONSTANTS.PLAYER_DEAD then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_DEAD)
    me.player.UpdatePlayerHealthStatus()
  elseif event == PVPW_CONSTANTS.PLAYER_ALIVE then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_ALIVE)
    me.player.UpdatePlayerHealthStatus()
  elseif event == PVPW_CONSTANTS.PLAYER_UNGHOST then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_UNGHOST)
    me.player.UpdatePlayerHealthStatus()
  elseif event == PVPW_CONSTANTS.PLAYER_TARGET_CHANGED then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.PLAYER_TARGET_CHANGED)
    me.player.UpdatePlayerTarget()
  end
end

--[[
  Register addon events
]]--
function me.RegisterEvents()
  -- register to player login event also fires on /reload
  this:RegisterEvent("PLAYER_LOGIN")
  -- fired when the player enters the world, reloads the UI, enters/leaves an instance or battleground, or respawns at a graveyard. Also fires any other time the player sees a loading screen
  this:RegisterEvent("PLAYER_ENTERING_WORLD")
  -- fires when the player moves between major zones or enters/exits an instance
  this:RegisterEvent("ZONE_CHANGED_NEW_AREA")
  -- fires when the player dies
  this:RegisterEvent("PLAYER_DEAD")
  -- fires when the player's spirit is released after death or when the player accepts a resurrection without releasing
  this:RegisterEvent("PLAYER_ALIVE")
  -- fires when a player resurrects after being in spirit form
  this:RegisterEvent("PLAYER_UNGHOST")
  -- fires when the player changes targets
  this:RegisterEvent("PLAYER_TARGET_CHANGED")
end

--[[
  Init function
]]--
function me.Initialize()
  --setup random seed
  math.randomseed(GetTime())
  me.logger.LogDebug(me.tag, "Initialize addon")

  if PVPWarnOptions.disableAddon == nil or PVPWarnOptions.disableAddon == false then
    -- register callbacks for events
    me.eventHandler.SubscribeEvents()
  else
    me.logger.LogDebug(me.tag, "Addon is disabled")
  end

  me.timer.CreateTimer("WarnQueueWorker", me.warnQueue.WorkQueue, 0.1, true)
  me.timer.CreateTimer("WarnQueueWorkingState", me.warnQueue.SetWorkingState, 0.8, true)

  me.timer.StartTimer("WarnQueueWorker")

  DEFAULT_CHAT_FRAME:AddMessage(string.format(PVPW_CONSTANTS.ADDON_NAME .. pvpw.L["help"], PVPW_CONSTANTS.ADDON_VERSION))

  me.SetupConfiguration()
end

function me.SetupConfiguration()
  --[[
      Set default values if property is nil. This might happen after an addon upgrade
    ]]--
  if PVPWarnOptions.disableAddon == nil then
    PVPWarnOptions.disableAddon = false
  end

  if PVPWarnOptions.disableAddonInBattlegrounds == nil then
    PVPWarnOptions.disableAddonInBattlegrounds = false
  end

  if PVPWarnOptions.showEventsForTargetOnly == nil then
    PVPWarnOptions.showEventsForTargetOnly = false
  end

  if PVPWarnOptions.ignoreEventsWhileDead == nil then
    PVPWarnOptions.ignoreEventsWhileDead = false
  end

  -- initialize spelllist for the first time with default profile
  if PVPWarnOptions.spellList == nil then
    PVPWarnOptions.spellList = me.profile.GetDefaultProfile()
  end

  -- initialize self avoid spelllist for the first time with default profile
  if PVPWarnOptions.spellSelfAvoidList == nil then
    PVPWarnOptions.spellSelfAvoidList = me.profile.GetDefaultProfileSelfAvoidSpells()
  end

  -- initialize enemy avoid spelllist for the first time with default profile
  if PVPWarnOptions.spellEnemyAvoidList == nil then
    PVPWarnOptions.spellEnemyAvoidList = me.profile.GetDefaultProfileEnemyAvoidSpells()
  end
end
