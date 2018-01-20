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
