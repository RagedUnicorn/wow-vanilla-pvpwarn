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
mod.warnQueue = me

me.tag = "WarnQueue"

local warnQueue = {}

--[[
 Whether queue is currently busy playing a sound. Preventing multiple sounds and
 warnings playing at the same time. Queue is first in first served.
]]--
local isQueueBusy = false

--[[
  @param {boolean} state
    true set queue busy
    false set queue available
]]--
function me.SetWorkingState(state)
  -- called from timer callback
  if state == nil then
    state = false

    if mod.timer.IsTimerActive("WarnQueueWorkingState") then
      mod.timer.StopTimer("WarnQueueWorkingState")
    end
  end

  if state then
    -- start timer to set queue back to free after certain amount of time
    mod.timer.StartTimer("WarnQueueWorkingState")
  end

  mod.logger.LogDebug(me.tag, "Setting queue busy state to: " .. tostring(state))
  isQueueBusy = state
end

--[[
  @return {table}
]]--
function GetQueue()
  return warnQueue
end

--[[
  @param {string} warnName
    generated name
  @param {string} normalizedSpellName
    the normalized spellname
  @param {string} soundType
    constant soundType see constants SOUND_TYPES
  @param {string} soundCategory
    e.g. class, misc etc.
  @param {string} soundFileName
    part of the fileName withoug prefix e.g. rocket_helmet
  @param {boolean} soundDown
    whether it is a sound that faded or not
]]--
function me.AddToQueue(warnName, normalizedSpellName, soundType, soundCategory, soundFileName, soundDown)
  local spellList = mod.common.GetSpellListType(soundType)

  -- check whether a certain spell is activated for the player or not
  if not mod.opt.IsSpellActive(spellList, soundCategory, normalizedSpellName) then
    mod.logger.LogDebug(me.tag, "Skipping add to queue for disabled spell - " .. normalizedSpellName)
    return
  end

  local warning = {
    ["warnName"] = warnName,
    ["normalizedSpellName"] = normalizedSpellName,
    ["soundType"] = soundType, -- see constants SOUND_TYPES
    ["soundFileName"] = soundFileName, -- part of the sound fileName
    ["soundCategory"] = soundCategory, -- sound type e.g. a class or item
    ["soundDown"] = soundDown, -- whether sound is fading or not
    ["visualName"] = mod.opt.GetVisualWarningColor(spellList, soundCategory, normalizedSpellName), -- name of a visual alert e.g. blue
    ["startTime"] = GetTime() -- time to track expiry timer
  }

  table.insert(warnQueue, warning)
  mod.logger.LogDebug(me.tag, "Added new warning with name '" .. warning.warnName .. "' to queue")
end

--[[
  @param {number} position
]]--
function me.RemoveFromQueue(position)
  table.remove(warnQueue, position)
  mod.logger.LogDebug(me.tag, "Removed warning with position '" .. position .. "' from queue")
end

--[[
  Called in an interval if the warning is to old we remove it and go to the next
  loop until an item is found that is not to old or the queue is empty
]]--
function me.WorkQueue()
  -- if queue is already busy abort
  if isQueueBusy then
    return
  end

  for key, warning in pairs(warnQueue) do
    local age = GetTime() - warning.startTime

    if age > PVPW_CONSTANTS.MAX_WARN_AGE then
      mod.logger.LogWarn(me.tag, "Skipping warn message because max age was reached")
      me.RemoveFromQueue(key)
    else
      local workingState = false
      local spellList = mod.common.GetSpellListType(warning.soundType)

      if mod.common.IsNormalSpell(warning.soundType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.soundType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing normal sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end
      elseif mod.common.IsEnemySpellAvoided(warning.soundType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.soundType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing avoid sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end
      elseif mod.common.IsSelfSpellAvoided(warning.soundType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.soundType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing self avoid sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end
      else
        mod.logger.LogError(me.tag, "Unknown soundType - " .. warning.soundType)
      end

      if mod.opt.IsVisualWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
        workingState = true
        mod.visual.ShowVisual(warning.warnName, warning.visualName)
      else
        mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.normalizedSpellName
          .. " because visual is disabled for this spell")
      end

      --[[
        Either an acoustic warning or a visual warning should be played - set queue
        to busy
      ]]--
      if workingState then
        me.SetWorkingState(true)
      end

      me.RemoveFromQueue(key)

      return -- abort
    end
  end
end
