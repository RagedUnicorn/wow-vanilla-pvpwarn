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

local options = {
  {"DisableAddon", pvpw.L["disable_addon"], pvpw.L["disable_addon_tooltip"]},
  {"DisableAddonInBattlegrounds", pvpw.L["disable_addon_in_battlegrounds"], pvpw.L["disable_addon_in_battlegrounds_tooltip"]},
  {"IgnoreEventsWhileDead", pvpw.L["ignore_events_while_dead"], pvpw.L["ignore_events_while_dead_tooltip"]},
  {"ShowEventsForTargetOnly", pvpw.L["show_events_for_target_only"], pvpw.L["show_events_for_target_only_tooltip"]}
}

function me.InitGeneralMenu()
  local item

  for i = 1, table.getn(options) do
    item = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_Opt .. options[i][1])

    if item then
      local itemTextObject = getglobal(item:GetName() .. "Text")
      itemTextObject:SetText(options[i][2])
      itemTextObject:SetTextColor(.95, .95, .95)

      -- configure script-handlers
      item:SetScript("OnEnter", me.OptTooltipOnEnter)
      item:SetScript("OnLeave", me.OptTooltipOnLeave)
    end
  end
end

--[[
  OnEnter callback for checkbuttons - show tooltip
]]--
function me.OptTooltipOnEnter()
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
function me.OptTooltipOnLeave()
  getglobal(PVPW_CONSTANTS.ELEMENT_TOOLTIP):Hide()
end

--[[
  OnShow callback for checkbuttons - disable addon
]]--
function me.DisableAddonOnShow()
  -- load status from config-object
  if mod.addonOptions.IsAddonDisabled() then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - disable addon
]]--
function me.DisableAddonOnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    mod.addonOptions.DisableAddon()
  else
    mod.addonOptions.EnableAddon()
  end
end

--[[
  OnShow callback for checkbuttons - disable addon in battlegrounds
]]--
function me.DisableAddonInBattlegroundsOnShow()
  -- load status from config-object
  if mod.addonOptions.IsAddonDisabledInBattlegrounds() then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

--[[
  OnShow callback for checkbuttons - disable addon in battlegrounds
]]--
function me.DisableAddonInBattlegroundsOnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    mod.addonOptions.DisableAddonInBattlegrounds()
  else
    mod.addonOptions.EnableAddonInBattlegrounds()
  end
end

--[[
  OnShow callback for checkbuttons - ignore events while the player is dead
]]--
function me.IgnoreEventsWhileDeadOnShow()
  -- load status from config-object
  if mod.addonOptions.IsIgnoreEventsWhileDeadEnabled() then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - ignore events while the player is dead
]]--
function me.IgnoreEventsWhileDeadOnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    mod.addonOptions.EnableIgnoreEventsWhileDead()
  else
    mod.addonOptions.DisableIgnoreEventsWhileDead()
  end
end

--[[
  OnShow callback for checkbuttons - show events only for the current target
]]--
function me.ShowEventsForTargetOnlyOnShow()
  -- load status from config-object
  if mod.addonOptions.IsShowEventsForTargetOnlyEnabled() then
    this:SetChecked(true)
  else
    this:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - show events only for the current target
]]--
function me.ShowEventsForTargetOnlyOnClick()
  local enabled = this:GetChecked()

  if enabled == 1 then
    mod.addonOptions.EnableShowEventsForTargetOnly()
  else
    mod.addonOptions.DisableShowEventsForTargetOnly()
  end
end
