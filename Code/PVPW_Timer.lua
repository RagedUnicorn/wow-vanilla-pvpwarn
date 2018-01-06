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
mod.timer = me

me.tag = "Timer"

me.TimerPool = {}
me.Timers = {}

--[[
  @param {string} name
  @param {func} func
  @param {number} delay
  @param {number} rep
]]--
function me.CreateTimer(name, func, delay, rep)
  mod.logger.LogDebug(me.tag, "Creating timer with name: " .. name)
  me.TimerPool[name] = {
    func = func,
    delay = delay,
    rep = rep,
    elapsed = delay
  }
end

--[[
  @param {string} name
  @return {boolean | nil}
]]--
function me.IsTimerActive(name)
  for i, j in ipairs(me.Timers) do
    if j == name then
      return i
    end
  end
  return nil
end

--[[
  @param {string} name
  @param {number} delay
]]--
function me.StartTimer(name, delay)
  mod.logger.LogDebug(me.tag, "Starting timer with name: " .. name)
  me.TimerPool[name].elapsed = delay or me.TimerPool[name].delay

  if not me.IsTimerActive(name) then
    table.insert(me.Timers, name)
    getglobal(PVPW_CONSTANTS.ELEMENT_TIMERS_FRAME):Show()
  end
end

--[[
  @param {string} name
]]--
function me.StopTimer(name)
  local idx = me.IsTimerActive(name)

  if idx then
    table.remove(me.Timers, idx)
    if table.getn(me.Timers) < 1 then
      getglobal(PVPW_CONSTANTS.ELEMENT_TIMERS_FRAME):Hide()
    end
  end
end

--[[
  onUpdate callback from timersframe
]]--
function me.TimersFrame_OnUpdate()
  local timerPool

  for _, name in ipairs(me.Timers) do
    timerPool = me.TimerPool[name]
    timerPool.elapsed = timerPool.elapsed - arg1
    if timerPool.elapsed < 0 then
      timerPool.func()
      if timerPool.rep then
        timerPool.elapsed = timerPool.delay
      else
        me.StopTimer(name)
        mod.logger.LogDebug(me.tag, "Stopped timer with name: " .. name)
      end
    end
  end
end
