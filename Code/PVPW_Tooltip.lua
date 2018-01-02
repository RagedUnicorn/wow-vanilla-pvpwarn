--[[
  PVPWarn - A WoW 1.12.1 Addon to alert the player of pvp events
  Copyright (C) 2017 Michael Wiesendanger <michael.wiesendanger@gmail.com>

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
mod.tooltip = me

me.tag = "tooltip"

--[[
  Private
]]

-- Localized tooltip texts for spell configurations
local options = {
  {"SpellStatus", pvpw.L["spell_status_tooltip_title"], pvpw.L["spell_status_tooltip"]},
  {"SoundWarning", pvpw.L["sound_warning_tooltip_title"], pvpw.L["sound_warning_tooltip"]},
  {"SoundFadeWarning", pvpw.L["sound_fade_warning_tooltip_title"], pvpw.L["sound_fade_warning_tooltip"]},
  {"VisualWarning", pvpw.L["sound_visual_warning_tooltip_title"] , pvpw.L["sound_visual_warning_tooltip"]}
}

--[[
  Using the global GameTooltip to display descriptions of the checkbuttons in optionsmenu

  @param {table} this
    reference to the object that was "entered"
]]--
function me.BuildHintTooltipForSpell(this)
  local name = this:GetName()
  local line1, line2
  local tooltipData

  if string.find(name or "", "SpellStatus$") then
    tooltipData = me.FindOptionsText("SpellStatus")
  elseif string.find(name or "", "SoundWarning$") then
    tooltipData = me.FindOptionsText("SoundWarning")
  elseif string.find(name or "", "SoundFadeWarning$") then
    tooltipData = me.FindOptionsText("SoundFadeWarning")
  elseif string.find(name or "", "VisualWarning$") then
    tooltipData = me.FindOptionsText("VisualWarning")
  end

  if tooltipData then
    -- grab title for tooltip
    line1 = tooltipData[2]
    -- grab description for tooltip
    line2 = tooltipData[3]
  end

  GameTooltip_SetDefaultAnchor(GameTooltip, this)

  GameTooltip:AddLine(line1)
  GameTooltip:AddLine(line2, .8, .8, .8, 1)

  GameTooltip:Show()
end

--[[
  Find options text from options table

  @param {string} fieldName
  @return {table}
]]--
function me.FindOptionsText(fieldName)
  for i = 1, table.getn(options) do
    if options[i][1] == fieldName then
      return options[i]
    end
  end
end


--[[
  @param {string} line1
  @param {string} line2
]]--
function me.BuildTooltipForOption(line1, line2)
  GameTooltip_SetDefaultAnchor(GameTooltip, this)

  GameTooltip:AddLine(line1)
  GameTooltip:AddLine(line2, .8, .8, .8, 1)

  GameTooltip:Show()
end
