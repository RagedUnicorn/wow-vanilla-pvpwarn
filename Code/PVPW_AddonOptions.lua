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
mod.addonOptions = me

me.tag = "AddonOptions"

--[[
  Disable the addon
]]--
function me.DisableAddon()
  PVPWarnOptions.disableAddon = true
  mod.eventHandler.UnsubscribeEvents()

  mod.logger.LogInfo(me.tag, "Disabled Addon")
end

--[[
  Enable the addon
]]--
function me.EnableAddon()
  PVPWarnOptions.disableAddon = false
  mod.eventHandler.SubscribeEvents()

  mod.logger.LogInfo(me.tag, "Enabled Addon")
end

--[[
  @return {boolean}
    true - if the addon is disabled
    false - if the addon is not disabled
]]--
function me.IsAddonDisabled()
  return PVPWarnOptions.disableAddon
end

--[[
  Disable addon in battlegrounds
]]--
function me.DisableAddonInBattlegrounds()
  PVPWarnOptions.disableAddonInBattlegrounds = true
end

--[[
  Enable addon in battlegrounds
]]--
function me.EnableAddonInBattlegrounds()
  PVPWarnOptions.disableAddonInBattlegrounds = false
end

--[[
  @return {boolean}
    true - if the addon is disabled in battlegrounds
    false - if the addon is not disabled in battlegrounds
]]--
function me.IsAddonDisabledInBattlegrounds()
  return PVPWarnOptions.disableAddonInBattlegrounds
end

--[[
  Disable ignore events while the player is dead
]]--
function me.DisableIgnoreEventsWhileDead()
  PVPWarnOptions.ignoreEventsWhileDead = false
end

--[[
  Enable ignore events while the player is dead
]]--
function me.EnableIgnoreEventsWhileDead()
  PVPWarnOptions.ignoreEventsWhileDead = true
end

--[[
  @return {boolean}
    true - if events are ignored while the player is dead
    false - if events are not ignored while the player is dead
]]--
function me.IsIgnoreEventsWhileDeadEnabled()
  return PVPWarnOptions.ignoreEventsWhileDead
end

--[[
  Disable show events for the current target only
]]--
function me.DisableShowEventsForTargetOnly()
  PVPWarnOptions.showEventsForTargetOnly = false
end

--[[
  Enable show events for the current target only
]]--
function me.EnableShowEventsForTargetOnly()
  PVPWarnOptions.showEventsForTargetOnly = true
end

--[[
  @return {boolean}
    true - if events are only shown for the current target
    false - if events are shown for all targets
]]--
function me.IsShowEventsForTargetOnlyEnabled()
  return PVPWarnOptions.ignoreEventsWhileDead
end
