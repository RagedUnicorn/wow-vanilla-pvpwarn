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
mod.common = me

me.tag = "Common"

--[[
  Get the english classname for the current player

  @return {string}
]]--
function me.GetPlayerClassName()
  local _, englishClass, _ = UnitClass("player")

  return englishClass
end

--[[
  @param {table} frame
  @param {string} pattern
  @return {frame | nil}
    The frame that was found with the matching pattern or nil if none can be
    found
]]--
function me.GetChildByName(frame, pattern)
  for _, child in ipairs({frame:GetChildren()}) do
    if string.find(child:GetName(), pattern) then
      return child
    end
  end

  return nil
end

--[[
  Get the classid from pvpw constants. This id is used iternaly only

  @param {string} className
  @return {number | nil}
    Position of the class in PVPW_CLASSLIST (see constants)
    nil if the classID could not be determined
]]--
function me.GetPlayerClassID(className)
  local name = strlower(className)

  for i = 1, table.getn(PVPW_CONSTANTS.PVPW_CLASSLIST) do
    if PVPW_CONSTANTS.PVPW_CLASSLIST[i] == name then
      return i
    end
  end

  mod.logger.LogDebug(me.tag, "Unable to determine classID for " .. name)
  return nil
end

--[[
  Extract position from a string

  @param {string} name
  @return {number}
]]--
function me.ExtractPositionFromName(name)
  _, _, position = strfind(name, "(%d+)")

  return tonumber(position)
end

--[[
  Depending on what locale the client has a different implementation is used
  to normalize a spellname (this is determined once during addon load). This is done because this function is time critical
  and can be called a lot during fights with a lot of players.
]]--
if (GetLocale() == "deDE") then
  --[[
    Normalize spellName by replacing spaces with underscores and removing special characters

    @param {string} spellName
    @return {string}
      normalized spellName
  ]]--
  function me.NormalizeSpellname(spellName)
    local name = string.gsub(string.lower(spellName), "%s+", "_")

    name = string.gsub(name, "_%-_", "_")
    name = string.gsub(name, "-", "_")
    name = string.gsub(name, "[':%(%)]+", "")
    name = string.gsub(name, "ö", "oe")
    name = string.gsub(name, "ü", "ue")
    name = string.gsub(name, "ä", "ae")
    name = string.gsub(name, "ß", "ss")

    return name
  end
else
  --[[
    Normalize spellName by replacing spaces with underscores and removing special characters
    including german umlaute

    @param {string} spellName
    @return {string}
      normalized spellName
  ]]--
  function me.NormalizeSpellname(spellName)
    local name = string.gsub(string.lower(spellName), "%s+", "_")

    name = string.gsub(name, "_%-_", "_")
    name = string.gsub(name, "-", "_")
    name = string.gsub(name, "[':%(%)]+", "")

    return name
  end
end

--[[
  Check if the detected spell is of category ENEMY_AVOIDED

  @param {string} soundType
  @return {boolean}
    true if category matched
    false if category does not match
]]--
function me.IsEnemySpellAvoided(soundType)
  return soundType == PVPW_CONSTANTS.SOUND_TYPES.ENEMY_AVOIDED
end

--[[
  Check if the detected spell is of category SELF_AVOIDED

  @param {string} soundType
  @return {boolean}
    true if category matched
    false if category does not match
]]--
function me.IsSelfSpellAvoided(soundType)
  return soundType == PVPW_CONSTANTS.SOUND_TYPES.SELF_AVOIDED
end

--[[
  Check if the detected spell is of category SPELL

  @param {string} soundType
  @return {boolean}
    true if category matched
    false if category does not match
]]--
function me.IsNormalSpell(soundType)
  return soundType == PVPW_CONSTANTS.SOUND_TYPES.SPELL
end

--[[
  Check if the detected spell is of category SPELL_DOWN

  @param {string} soundType
  @return {boolean}
    true if category matched
    false if category does not match
]]--
function me.IsNormalSpellDown(soundType)
  return soundType == PVPW_CONSTANTS.SOUND_TYPES.SPELL_DOWN
end

--[[
  Check to which spellList the spell belongs to and return the name of that spelllist

  @param {string} soundType
  @return {string|nil}
  * spellList - enemy spell detected
  * spellSelfAvoidList - player avoided spell
  * spellEnemyAvoidList - enemy player avoided spell
]]--
function me.GetSpellListType(soundType)
  if me.IsNormalSpell(soundType) or me.IsNormalSpellDown(soundType) then
    return PVPW_CONSTANTS.SPELL_TYPE.SPELL
  elseif me.IsSelfSpellAvoided(soundType) then
    return PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID
  elseif me.IsEnemySpellAvoided(soundType) then
    return PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID
  else
    mod.logger.LogError(me.tag, "Invalid soundtype")
    return nil
  end
end

--[[
  @param {table} obj
    the object that should be cloned
  @return {table}
    a clone of the object passed
]]--
function me.Clone(obj)
  if type(obj) ~= 'table' then return obj end

  local res = {}

  for k, v in pairs(obj) do
    res[me.Clone(k)] = me.Clone(v)
  end

  return res
end
