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

pvpw = pvpw or {}
local me = pvpw

me.tag = "Core"

local _G = getfenv(0)

--[[
  Testing

  Hook GetLocale to return a fixed value. Deactivate in production!
]]--
function _G.GetLocale()
  return "deDE"
end

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
    ["type"] = {
      -- e.g. paladin, racials
      ["spellName"] = {
        -- e.g. lay_on_hands as found in SpellMap
        ["spellActive"] = false,
          -- default false
        ["soundWarningActive"] = false,
          -- default false
        ["soundFadeWarningActive"] = false,
          -- default false
        ["visualWarningActive"] = false,
          -- default false
        ["visualWarningColor"] = [number] -- e.g. blue, orange see PVPW_CONSTANTS.TEXTURES
          -- default color in PVPW_CONSTANTS.DEFAULT_COLOR
      }
    }
  ]]--
  --[[
    Enemy spells being casted/used/activated
  ]]--
  ["spellList"] = {
    ["paladin"] = {
      ["lay_on_hands"] = {
        ["spellActive"] = true,
        ["soundWarningActive"] = true,
        ["soundFadeWarningActive"] = true,
        ["visualWarningActive"] = true,
        ["visualWarningColor"] = 4
      }
    },
    ["warrior"] = {
      ["recklessness"] = {
        ["spellActive"] = true,
        ["soundWarningActive"] = true,
        ["soundFadeWarningActive"] = true,
        ["visualWarningActive"] = true,
        ["visualWarningColor"] = 4
      }
    }
  },
  --[[
    Spells that the player avoided
  ]]--
  ["spellSelfAvoidList"] = {
    ["rogue"] = {},
    ["warrior"] = {},
    ["mage"] = {},
    ["warlock"] = {},
    ["hunter"] = {},
    ["paladin"] = {},
    ["priest"] = {},
    ["druid"] = {},
    ["shaman"] = {}
  },
  --[[
    Spells that the enemy player avoided
  ]]--
  ["spellEnemyAvoidList"] = {
    ["rogue"] = {},
    ["warrior"] = {},
    ["mage"] = {},
    ["warlock"] = {},
    ["hunter"] = {},
    ["paladin"] = {},
    ["priest"] = {},
    ["druid"] = {},
    ["shaman"] = {}
  }
}

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
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_SELF_DAMAGE then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_SELF_DAMAGE)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_AURA_GONE_OTHER then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_AURA_GONE_OTHER)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE)
    me.eventHandler.HandleEvent(arg1, event)
  elseif event == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE then
    me.logger.LogEvent(me.tag, PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE)
    me.eventHandler.HandleEvent(arg1, event)
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
  -- fires when a hostile player begins or ends casting a harmful spell.
  this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
  -- fires when you gain or are affected by an instant or ongoing spell or effect.
  this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
  -- fires when a hostile player starts or stops casting a beneficial spell.
  this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF")
  -- fires when a hostile player is effected by an instant cast or ongoing beneficial effect.
  this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS")
  -- fires when a buff or debuff fades from a creature, NPC, or player other than yourself or a party member.
  this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
  -- fires when a damage shield on you deals damage.
  this:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF")
  -- fires when a damage shield on someone other than you deals damage.
  this:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS")
  -- fires when you start and stop casting a damaging spell.
  this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
  -- fires when a hostile player is affected by a instant or ongoing damaging effect.
  this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
  -- fires when the player dies
  this:RegisterEvent("PLAYER_DEAD");
  -- fires when the player's spirit is released after death or when the player accepts a resurrection without releasing
  this:RegisterEvent("PLAYER_ALIVE");
  -- fires when a player resurrects after being in spirit form
  this:RegisterEvent("PLAYER_UNGHOST");
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

  me.timer.CreateTimer("WarnQueueWorker", me.warnQueue.WorkQueue, 0.1, 0.1)
  me.timer.CreateTimer("WarnQueueWorkingState", me.warnQueue.SetWorkingState, 0.8, 0.8)

  me.timer.StartTimer("WarnQueueWorker")

  DEFAULT_CHAT_FRAME:AddMessage(string.format(PVPW_CONSTANTS.ADDON_NAME .. pvpw.L["help"], PVPW_CONSTANTS.ADDON_VERSION))
end
