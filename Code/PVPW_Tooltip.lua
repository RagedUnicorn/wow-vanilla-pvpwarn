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
function me.BuildHintTooltipForSpell()
  local tooltip = getglobal(PVPW_CONSTANTS.ELEMENT_TOOLTIP)
  local name = this:GetName()
  local tooltipData

  GameTooltip_SetDefaultAnchor(tooltip, this)

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
    -- title for tooltip
    tooltip:AddLine(tooltipData[2])
    -- description for tooltip
    tooltip:AddLine(tooltipData[3], .8, .8, .8, 1)

    tooltip:Show()
  else
    mod.logger.LogError(me.tag, "Failed to retrieve tooltipData for: " .. name)
  end
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
  local tooltip = getglobal(PVPW_CONSTANTS.ELEMENT_TOOLTIP)

  GameTooltip_SetDefaultAnchor(tooltip, this)

  tooltip:AddLine(line1)
  tooltip:AddLine(line2, .8, .8, .8, 1)

  tooltip:Show()
end
