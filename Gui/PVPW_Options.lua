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
mod.opt = me

me.tag = "Options"

function me.InitOptionsMenu()
  -- set version title
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_OPTIONS_TITLE)
    :SetText(PVPW_ENVIRONMENT.ADDON_NAME .. " " .. PVPW_ENVIRONMENT.ADDON_VERSION)
  -- show optionsframe
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_OPTIONS_FRAME):Show()
end

--[[
  Close the optionsmenu by hiding it
]]--
function me.OptionCloseButtonOnClick()
  getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_OPTIONS_FRAME):Hide()
end

--[[
  OnEnter callback for spell checkbuttons in categogries
    - show tooltip
]]
function PVPW_SpellCheckButtonTooltip_OnEnter()
  mod.tooltip.BuildHintTooltipForSpell()
end

--[[
  OnLeave callback for spell checkbuttons in categogries - hide tooltip
]]
function PVPW_SpellCheckButtonTooltip_OnLeave()
  getglobal(PVPW_CONSTANTS.ELEMENT_TOOLTIP):Hide()
end

--[[
  Global Callback for playsound button - used to play the choosen sound
]]--
function PVPW_PlaySound_OnClick()
  local parent = this:GetParent()

  if parent.spellType == PVPW_CONSTANTS.SPELL_TYPE.SPELL then
    mod.sound.PlaySound(parent.type, PVPW_CONSTANTS.SPELL_TYPES.SPELL,
      parent.soundFileName)
  elseif parent.spellType == PVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID then
    mod.sound.PlaySound(parent.type, PVPW_CONSTANTS.SPELL_TYPES.SELF_AVOIDED,
      parent.soundFileName)
  elseif parent.spellType == PVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID then
    mod.sound.PlaySound(parent.type, PVPW_CONSTANTS.SPELL_TYPES.ENEMY_AVOIDED,
      parent.soundFileName)
  end
end

--[[
  Global Callback for playsound fade button - used to play the choosen sound
]]--
function PVPW_PlaySoundFade_OnClick()
  local parent = this:GetParent()

  mod.sound.PlaySound(parent.type, PVPW_CONSTANTS.SPELL_TYPES.SPELL_DOWN,
    parent.soundFileName, true)
end

--[[
  Global Callback for showvisual button - used to show an example of the choosen color
]]--
function PVPW_ShowVisual_OnClick()
  local parent = this:GetParent()

  local color = mod.opt.GetVisualWarningColor(parent.spellType,
    parent.type, parent.spellName)

  mod.visual.ShowVisual("gui_alert_config", color)
end

--[[
  Callback for spell status checkbox. Toggling wheter a certain spell should be
  enabled or disabled. Disabled spells will not trigger any warning independent
  whether acoustic or visual warning is activated or not
]]--
function PVPW_ToggleSpellStatus_OnClick()
  local spellFrame = this:GetParent()

  mod.opt.ToggleSpellState(spellFrame.spellType, spellFrame.type, spellFrame.spellName)
  -- after updating status in configuration update visual appearance
  mod.guiHelper.ToggleSpellFrame(this:GetParent(), spellFrame.type,
    spellFrame.spellName, spellFrame.spellType)
end

--[[
  Callback for sound warning checkbox. Toggling whether an acoustic warning should be
  displayed for the respective spell
]]--
function PVPW_ToggleSoundWarning_OnClick()
  local spellFrame = this:GetParent()

  mod.opt.ToggleSoundWarning(spellFrame.spellType, spellFrame.type, spellFrame.spellName)
  -- after updating status in configuration update visual appearance
  mod.guiHelper.ToggleSpellFrame(this:GetParent(), spellFrame.type,
    spellFrame.spellName, spellFrame.spellType)
end

--[[
  Callback for visual warning checkbox. Toggling whether a visual warning should be
  displayed for the respective spell
]]--
function PVPW_ToggleVisualWarning_OnClick()
  local spellFrame = this:GetParent()

  mod.opt.ToggleVisualWarning(spellFrame.spellType, spellFrame.type, spellFrame.spellName)
  -- after updating status in configuration update visual appearance
  mod.guiHelper.ToggleSpellFrame(this:GetParent(), spellFrame.type,
    spellFrame.spellName, spellFrame.spellType)
end

--[[
  Callback for sound down warning checkbox. Toggling whether an acoustic warning should be
  displayed for the respective spell when it fades from an enemy player
]]--
function PVPW_ToggleSoundDownWarning_OnClick()
  local spellFrame = this:GetParent()

  mod.opt.ToggleSoundDownWarning(spellFrame.spellType, spellFrame.type, spellFrame.spellName)
  -- after updating status in configuration update visual appearance
  mod.guiHelper.ToggleSpellFrame(this:GetParent(), spellFrame.type,
    spellFrame.spellName, spellFrame.spellType)
end

--[[
  Returns a default config object for a spell
]]--
function me.GetDefaultSpellConfiguration()
  return {
    ["spellActive"] = false,
    ["soundWarningActive"] = false,
    ["soundFadeWarningActive"] = false,
    ["visualWarningActive"] = false,
    ["visualWarningColor"] = PVPW_CONSTANTS.DEFAULT_COLOR
  }
end

--[[
  @param {string} spellList
    See constants SPELL_TYPE
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleSpellState(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleSpellState` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `ToggleSpellState` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `ToggleSpellState` (expected string got %s)", type(spellName)))

  if me.IsSpellActive(spellList, categoryName, spellName) then
    me.SetSpellActive(spellList, categoryName, spellName, false)
  else
    me.SetSpellActive(spellList, categoryName, spellName, true)
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleSoundWarning(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleSoundWarning` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `ToggleSoundWarning` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `ToggleSoundWarning` (expected string got %s)", type(spellName)))

  if me.IsSoundWarningActive(spellList, categoryName, spellName) then
    me.SetSoundWarningActive(spellList, categoryName, spellName, false)
  else
    me.SetSoundWarningActive(spellList, categoryName, spellName, true)
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleSoundDownWarning(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleSoundDownWarning` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #1 to `ToggleSoundDownWarning` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #2 to `ToggleSoundDownWarning` (expected string got %s)", type(spellName)))

  if me.IsSoundFadeWarningActive(spellList, categoryName, spellName) then
    me.SetSoundFadeWarningActive(spellList, categoryName, spellName, false)
  else
    me.SetSoundFadeWarningActive(spellList, categoryName, spellName, true)
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleVisualWarning(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleVisualWarning` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `ToggleVisualWarning` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `ToggleVisualWarning` (expected string got %s)", type(spellName)))

  if me.IsVisualWarningActive(spellList, categoryName, spellName) then
    me.SetVisualWarningActive(spellList, categoryName, spellName, false)
  else
    me.SetVisualWarningActive(spellList, categoryName, spellName, true)
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {boolean}
    true if the visual warning is active
    false if the visual warning is inactive
]]--
function me.IsVisualWarningActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsVisualWarningActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsVisualWarningActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsVisualWarningActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].visualWarningActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.SetVisualWarningActive(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  local category, spell = mod.common.SearchSpellInSpellMap(spellList, spellName)

  if spell and spell.links then
    -- make sure to sync configuration change to all linked spells
    for i = 1, table.getn(spell.links) do
      local linkedCategory, linkedSpell = mod.spellMap.SearchSpellByspellId(spell.links[i])
      PVPWarnOptions[spellList][linkedCategory][spellName].visualWarningActive = state
    end

    -- set config for initial spell found as well
    PVPWarnOptions[spellList][category][spellName].visualWarningActive = state
  else
    -- default case for almost all spells
    PVPWarnOptions[spellList][categoryName][spellName].visualWarningActive = state
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {boolean}
    true if the sound warning is active
    false if the sound warning is inactive
]]--
function me.IsSoundWarningActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsSoundWarningActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsSoundWarningActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsSoundWarningActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].soundWarningActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {boolean}
    true if the sound warning is active
    false if the sound warning is inactive
]]--
function me.IsSoundFadeWarningActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsSoundFadeWarningActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsSoundFadeWarningActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsSoundFadeWarningActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].soundFadeWarningActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.SetSoundWarningActive(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  local category, spell = mod.common.SearchSpellInSpellMap(spellList, spellName)

  if spell and spell.links then
    -- make sure to sync configuration change to all linked spells
    for i = 1, table.getn(spell.links) do
      local linkedCategory, linkedSpell = mod.spellMap.SearchSpellByspellId(spell.links[i])
      PVPWarnOptions[spellList][linkedCategory][spellName].soundWarningActive = state
    end

    -- set config for initial spell found as well
    PVPWarnOptions[spellList][category][spellName].soundWarningActive = state
  else
    -- default case for almost all spells
    PVPWarnOptions[spellList][categoryName][spellName].soundWarningActive = state
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.SetSoundFadeWarningActive(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  local category, spell = mod.common.SearchSpellInSpellMap(spellList, spellName)

  if spell and spell.links then
    -- make sure to sync configuration change to all linked spells
    for i = 1, table.getn(spell.links) do
      local linkedCategory, linkedSpell = mod.spellMap.SearchSpellByspellId(spell.links[i])
      PVPWarnOptions[spellList][linkedCategory][spellName].soundFadeWarningActive = state
    end

    -- set config for initial spell found as well
    PVPWarnOptions[spellList][category][spellName].soundFadeWarningActive = state
  else
    -- default case for almost all spells
    PVPWarnOptions[spellList][categoryName][spellName].soundFadeWarningActive = state
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {number|nil}
    A color from PVPW_CONSTANTS.TEXTURES or false if none could be found
]]--
function me.GetVisualWarningColor(spellList, categoryName, spellName)
  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].visualWarningColor
    end
  end

  mod.logger.LogWarn(me.tag, "Unable to determine visualWarningColor for "
    .. categoryName .. " - " .. spellName)
  return nil
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {number} color
    a color from PVPW_CONSTANTS.TEXTURES
]]--
function me.SetVisualWarningColor(spellList, categoryName, spellName, color)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  local category, spell = mod.common.SearchSpellInSpellMap(spellList, spellName)

  if spell and spell.links then
    -- make sure to sync configuration change to all linked spells
    for i = 1, table.getn(spell.links) do
      local linkedCategory, linkedSpell = mod.spellMap.SearchSpellByspellId(spell.links[i])
      PVPWarnOptions[spellList][linkedCategory][spellName].visualWarningColor = color
    end

    -- set config for initial spell found as well
    PVPWarnOptions[spellList][category][spellName].visualWarningColor = color
  else
    -- default case for almost all spells
    PVPWarnOptions[spellList][categoryName][spellName].visualWarningColor = color
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {boolean}
    true if the spell is active
    false if the spell is inactive
]]--
function me.IsSpellActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsSpellActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsSpellActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsSpellActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].spellActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.SetSpellActive(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  local category, spell = mod.common.SearchSpellInSpellMap(spellList, spellName)

  if spell and spell.links then
    -- make sure to sync configuration change to all linked spells
    for i = 1, table.getn(spell.links) do
      local linkedCategory, linkedSpell = mod.spellMap.SearchSpellByspellId(spell.links[i])
      PVPWarnOptions[spellList][linkedCategory][spellName].spellActive = state
    end

    -- set config for initial spell found as well
    PVPWarnOptions[spellList][category][spellName].spellActive = state
  else
    -- default case for almost all spells
    PVPWarnOptions[spellList][categoryName][spellName].spellActive = state
  end
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)
  if not PVPWarnOptions[spellList][categoryName] then
    mod.logger.LogInfo(me.tag, "Class - " .. categoryName .. " does not exist. Creating new one...")
    PVPWarnOptions[spellList][categoryName] = {}
  end

  if not PVPWarnOptions[spellList][categoryName][spellName] then
    mod.logger.LogInfo(me.tag, "SpellName - " .. spellName .. " for class "
      .. categoryName .. " does not exist. Creating new one...")
    PVPWarnOptions[spellList][categoryName][spellName] = me.GetDefaultSpellConfiguration()
  end
end
