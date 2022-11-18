--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
  @param {string} spellType
    constant spellType see constants SPELL_TYPES
  @param {string} soundCategory
    e.g. class, misc etc.
  @param {string} soundFileName
    part of the fileName withoug prefix e.g. rocket_helmet
  @param {boolean} soundDown
    whether it is a sound that faded or not
]]--
function me.AddToQueue(warnName, normalizedSpellName, spellType, soundCategory, soundFileName, spellIcon, soundDown)
  local spellList = mod.common.GetSpellListType(spellType)

  -- check whether a certain spell is activated for the player or not
  if not mod.opt.IsSpellActive(spellList, soundCategory, normalizedSpellName) then
    mod.logger.LogDebug(me.tag, "Skipping add to queue for disabled spell - " .. normalizedSpellName)
    return
  end

  local warning = {
    ["warnName"] = warnName,
    ["normalizedSpellName"] = normalizedSpellName,
    ["spellType"] = spellType, -- see constants SPELL_TYPES
    ["soundFileName"] = soundFileName, -- part of the sound fileName
    ["soundCategory"] = soundCategory, -- sound type e.g. a class or item
    ["spellIcon"] = spellIcon, -- name of the spell icon
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
      local spellList = mod.common.GetSpellListType(warning.spellType)

      --[[
        determine wheter to play a sound or a visual effect based on the configuration for the player
      ]]--
      if mod.common.IsNormalSpell(warning.spellType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.spellType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing normal sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end

        if mod.opt.IsVisualWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.visual.ShowVisualAlert(warning.visualName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.normalizedSpellName
            .. " because visual is disabled for this spell")
        end

        mod.visual.ShowVisualAlertIcon(warning.spellIcon)
      elseif mod.common.IsNormalSpellDown(warning.spellType) then
        if mod.opt.IsSoundFadeWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.spellType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing normal sound down for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end

        if mod.opt.IsVisualWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.visual.ShowVisualAlert(warning.visualName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.normalizedSpellName
            .. " because visual is disabled for this spell")
        end
      elseif mod.common.IsEnemySpellAvoided(warning.spellType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.spellType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing avoid sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end
      elseif mod.common.IsSelfSpellAvoided(warning.spellType) then
        if mod.opt.IsSoundWarningActive(spellList, warning.soundCategory, warning.normalizedSpellName) then
          workingState = true
          mod.sound.PlaySound(warning.soundCategory, warning.spellType, warning.soundFileName)
        else
          mod.logger.LogDebug(me.tag, "Skipping playing self avoid sound for spell - " .. warning.normalizedSpellName
            .. " because sound is disabled for spell")
        end
      else
        mod.logger.LogError(me.tag, "Unknown spellType - " .. warning.spellType)
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
