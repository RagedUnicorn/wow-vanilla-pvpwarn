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
  @param {number} spellType
    see constants SPELL_TYPES
  @param {string} soundFileName
    part of the name of the soundfile
  @return {number}
    0 if there was a problem
    1 if sound was played
]]--
function me.PlaySound(soundCategory, spellType, soundFileName)
  assert(type(soundCategory) == "string",
    string.format("bad argument #1 to `PlaySound` (expected string got %s)", type(soundCategory)))

  assert(type(spellType) == "number",
    string.format("bad argument #2 to `PlaySound` (expected number got %s)", type(spellType)))

  assert(type(soundFileName) == "string",
    string.format("bad argument #3 to `PlaySound` (expected string got %s)", type(soundFileName)))

  if spellType == PVPW_CONSTANTS.SPELL_TYPES.SPELL then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. soundFileName .. FILE_TYPE
  elseif spellType == PVPW_CONSTANTS.SPELL_TYPES.SPELL_DOWN then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. soundFileName .. FILE_NAME_DOWN .. FILE_TYPE
  elseif spellType == PVPW_CONSTANTS.SPELL_TYPES.ENEMY_AVOIDED then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. FILE_FOLDER_ENEMY_AVOIDED ..
      "\\" .. FILE_NAME_ENEMY_AVOIDED .. soundFileName .. FILE_TYPE
  elseif spellType == PVPW_CONSTANTS.SPELL_TYPES.SELF_AVOIDED then
    soundPath = BASE_PATH .. soundCategory .. "\\" .. FILE_FOLDER_SELF_AVOIDED ..
      "\\" .. FILE_NAME_SELF_AVOIDED .. soundFileName .. FILE_TYPE
  else
    mod.logger.LogWarn(me.tag, "Invalid spellType: " .. spellType)
  end

  mod.logger.LogDebug(me.tag, string.format("Playing: %s", soundPath))
  local status = PlaySoundFile(soundPath, "Master")

  if not status then
    -- this also happens when sound is deactivated
    mod.logger.LogWarn(me.tag, string.format("There seems to be an issue playing: %s", soundPath))
    return status
  end

  return status
end
