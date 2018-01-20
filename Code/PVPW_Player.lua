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
mod.player = me

me.tag = "Player"

--[[
  Private
]]--

--[[
  Track whether the player is alive or dead and Update when events like PLAYER_DEAD,
  PLAYER_ALIVE and PLAYER_UNGHOST are fired
]]--
local isPlayerAlive = false
--[[
  Track current playertarget
]]--
local playerTarget = nil

--[[
  Check if a player is really dead and did not use feigndeath
]]--
function me.UpdatePlayerHealthStatus()
  local FEIGN_DEATH = "Interface\\Icons\\Ability_Rogue_FeignDeath"
  local dead = UnitIsDeadOrGhost("player")

  -- abort as early as possible
  if dead == nil then
    mod.logger.LogDebug(me.tag, "Update player health status to alive")
    isPlayerAlive = true
    return
  end

  for i = 1, 24 do
    if UnitBuff("player", i) == FEIGN_DEATH then
      mod.logger.LogDebug(me.tag, "Update player health status to alive")
      isPlayerAlive = true
      return
    end
  end

  mod.logger.LogDebug(me.tag, "Update player health status to dead")
  isPlayerAlive = false
end

--[[
  Figure out if a player is alive or dead|ghostform

  @return {boolean}
    true if the player is alive
    false if the player is dead or in ghostform
]]--
function me.IsPlayerAlive()
  return isPlayerAlive
end

--[[
  Figure out if a player is currently in a battleground or not

  @return {boolean}
    true if the player is in a battleground
    false if the player is not in a battleground
]]--
function me.IsPlayerInBattleground()
  return isPlayerInBattleground
end

--[[
  Check if the target from an event matches the players current target

  @param {string} target
  @return {boolean}
    true if the event matches the players current target
    false if the event does not match the players current target
]]--
function me.IsCurrentTarget(target)
  if target == playerTarget then
    return true
  else
    return false
  end
end

--[[
  Update the players current target if he has a valid target. A valid target
  is an enemy player
]]--
function me.UpdatePlayerTarget()
  -- ignore event if option is not activated
  if not PVPWarnOptions.showEventsForTargetOnly then
    mod.logger.LogDebug(me.tag, "Ignore event target changed")
    return
  end

  if me.PlayerHasEnemyTarget() then
    playerTarget = GetUnitName("target")
    mod.logger.LogDebug(me.tag, "Set new target to: " .. playerTarget)
  else
    playerTarget = nil
    mod.logger.LogDebug(me.tag, "No valid target - reseting target")
  end
end

--[[
  Check whether the player has a player target and if this player is an enemy

  @return {boolean}
    true player has an enemy player as target
    false player has no target, a friendly player, an enemy player not marked for
    pvp or an npc as target
]]--
function me.PlayerHasEnemyTarget()
  if UnitIsPlayer("target") and UnitIsEnemy("player", "target") then
    return true
  end

  return false
end
