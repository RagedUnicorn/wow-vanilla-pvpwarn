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
mod.zone = me

me.tag = "Zone"

local isPlayerInBattleground = false

local battlegrounds = {
  pvpw.L["warsong_gulch"],
  pvpw.L["arathi_basin"],
  pvpw.L["alterac_valley"]
}

--[[
  Update the status of the player after a PLAYER_ENTERING_WORLD or
  ZONE_CHANGED_NEW_AREA event
]]--
function me.UpdatePlayerZoneStatus()
  local	currentZone = GetZoneText()

  --[[
    CurrentZone can be an empty string directly after 'PLAYER_ENTERING_WORLD' firing
  ]]--
  if currentZone == "" then
    isPlayerInBattleground = false
    return
  end

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
