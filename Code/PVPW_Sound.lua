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
mod.sound = me

me.tag = "Sound"

--[[
  Private
]]--
local BASE_PATH
local FILE_NAME_DOWN
local FILE_NAME_SELF_AVOIDED
local FILE_NAME_ENEMY_AVOIDED
local FILE_FOLDER_ENEMY_AVOIDED
local FILE_FOLDER_SELF_AVOIDED
local FILE_TYPE = ".mp3"

if (GetLocale() == "deDE") then
  BASE_PATH = "Interface\\AddOns\\PVPWarn\\Assets\\Sounds\\de\\"
  FILE_NAME_DOWN = "_unten"
  FILE_FOLDER_ENEMY_AVOIDED = "enemy_avoid"
  FILE_NAME_ENEMY_AVOIDED = "gegner_vermeidet_"
  FILE_FOLDER_SELF_AVOIDED = "self_avoid"
  FILE_NAME_SELF_AVOIDED = "ihr_vermeidet_"
else
  BASE_PATH = "Interface\\AddOns\\PVPWarn\\Assets\\Sounds\\en\\"
  FILE_NAME_DOWN = "_down"
  FILE_FOLDER_ENEMY_AVOIDED = "enemy_avoid"
  FILE_NAME_ENEMY_AVOIDED = "enemy_avoided_"
  FILE_FOLDER_SELF_AVOIDED = "self_avoid"
  FILE_NAME_SELF_AVOIDED = "you_avoided_"
end

--[[
  Play a sound from the assets-folder
  @param {string} soundCategory
    e.g rogue, misc, racials etc
  @param {number} soundType
    see constants SOUND_TYPES
  @param {string} soundFileName
    part of the name of the soundfile
  @return {number}
    0 if there was a problem
    1 if sound was played
]]--
function me.PlaySound(soundCategory, soundType, soundFileName)
  assert(type(soundCategory) == "string",
    string.format("bad argument #1 to `PlaySound` (expected string got %s)", type(soundCategory)))

  assert(type(soundType) == "number",
    string.format("bad argument #2 to `PlaySound` (expected number got %s)", type(soundType)))

  assert(type(soundFileName) == "string",
    string.format("bad argument #3 to `PlaySound` (expected string got %s)", type(soundFileName)))

  if soundType == PVPW_CONSTANTS.SOUND_TYPES.SPELL then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. soundFileName .. FILE_TYPE
  elseif soundType == PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. soundFileName .. FILE_NAME_DOWN .. FILE_TYPE
  elseif soundType == PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. FILE_FOLDER_ENEMY_AVOIDED ..
      "\\" .. FILE_NAME_ENEMY_AVOIDED .. soundFileName .. FILE_TYPE
  elseif soundType == PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. FILE_FOLDER_SELF_AVOIDED ..
      "\\" .. FILE_NAME_SELF_AVOIDED .. soundFileName .. FILE_TYPE
  else
    mod.logger.LogWarn(me.tag, "Invalid soundType: " .. soundType)
  end

  mod.logger.LogDebug(me.tag, string.format("Playing: %s", soundPath))
  status = PlaySoundFile(soundPath, "Master")

  if not status then
    -- this also happens when sound is deactivated
    mod.logger.LogWarn(me.tag, string.format("There seems to be an issue playing: %s", soundPath))
    return status
  end

  return status
end
