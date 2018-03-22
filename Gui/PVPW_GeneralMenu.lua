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
mod.generalMenu = me

me.tag = "GeneralMenu"

--[[
  Private
]]
local options = {
  {"DisableAddon", pvpw.L["disable_addon"], pvpw.L["disable_addon_tooltip"]},
  {"DisableAddonInBattlegrounds", pvpw.L["disable_addon_in_battlegrounds"], pvpw.L["disable_addon_in_battlegrounds_tooltip"]},
  {"IgnoreEventsWhileDead", pvpw.L["ignore_events_while_dead"], pvpw.L["ignore_events_while_dead_tooltip"]},
  {"ShowEventsForTargetOnly", pvpw.L["show_events_for_target_only"], pvpw.L["show_events_for_target_only_tooltip"]}
}

function PVPW_InitGeneralMenu()
  local item

  for i = 1, table.getn(options) do
    item = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_Opt .. options[i][1])

    if item then
      local itemTextObject = getglobal(item:GetName() .. "Text")
      itemTextObject:SetText(options[i][2])
      itemTextObject:SetTextColor(.95, .95, .95)

      -- configure script-handlers
      item:SetScript("OnEnter", PVPW_Opt_Tooltip_OnEnter)
      item:SetScript("OnLeave", PVPW_Opt_Tooltip_OnLeave)
    end
  end
end

--[[
  OnEnter callback for checkbuttons - show tooltip
]]--
function PVPW_Opt_Tooltip_OnEnter()
  local name = this:GetName()

  if not name then return end

  for i = 1, table.getn(options) do
    if name == PVPW_CONSTANTS.ELEMENT_PVPW_Opt .. options[i][1] then
      mod.tooltip.BuildTooltipForOption(options[i][2], options[i][3])
    end
  end
end

--[[
  OnEnter callback for checkbuttons - hide tooltip
]]--
function PVPW_Opt_Tooltip_OnLeave()
  GameTooltip:Hide()
end

function PVPW_DisableAddon_OnShow()
  -- load status from config-object
  if PVPWarnOptions.disableAddon then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

function PVPW_DisableAddon_OnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    PVPWarnOptions.disableAddon = true
  else
    PVPWarnOptions.disableAddon = false
  end
end

function PVPW_DisableAddonInBattlegrounds_OnShow()
  -- load status from config-object
  if PVPWarnOptions.disableAddonInBattlegrounds then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

function PVPW_DisableAddonInBattlegrounds_OnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    PVPWarnOptions.disableAddonInBattlegrounds = true
  else
    PVPWarnOptions.disableAddonInBattlegrounds = false
  end
end


function PVPW_IgnoreEventsWhileDead_OnShow()
  -- load status from config-object
  if PVPWarnOptions.ignoreEventsWhileDead then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

function PVPW_IgnoreEventsWhileDead_OnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    PVPWarnOptions.ignoreEventsWhileDead = true
  else
    PVPWarnOptions.ignoreEventsWhileDead = false
  end
end

function PVPW_ShowEventsForTargetOnly_OnShow()
  -- load status from config-object
  if PVPWarnOptions.showEventsForTargetOnly then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

function PVPW_ShowEventsForTargetOnly_OnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    PVPWarnOptions.showEventsForTargetOnly = true
  else
    PVPWarnOptions.showEventsForTargetOnly = false
  end
end
