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
mod.zone = me

me.tag = "Zone"

local isPlayerInBattleground = false

local battlegrounds = {
  "Warsong Gulch",
  "Arathi Basin",
  "Alterac Valley"
}

--[[
  Update the status of the player after a PLAYER_ENTERING_WORLD or
  ZONE_CHANGED_NEW_AREA event
]]--
function me.UpdatePlayerZoneStatus()
  local	currentZone = GetZoneText()

  mod.logger.LogDebug(me.tag, "Players current zone: " .. currentZone)

  for i = 1, table.getn(battlegrounds) do
    if currentZone == battlegrounds[i] then
      isPlayerInBattleground = true
      return -- abort on hit
    end
  end

  isPlayerInBattleground = false
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
