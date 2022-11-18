--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
  Saved addon variable
]]--
PVPWarnOptions = {
  ["disableAddon"] = false,
  ["disableAddonInBattlegrounds"] = false,
  ["showEventsForTargetOnly"] = false,
  ["ignoreEventsWhileDead"] = false,
  --[[
    Enemy spells being casted/used/activated
  ]]--
  ["spellList"] = nil,
  --[[
    Spells that the player avoided
  ]]--
  ["spellSelfAvoidList"] = nil,
  --[[
    Spells that an enemy player avoided
  ]]--
  ["spellEnemyAvoidList"] = nil,
  --[[
    Whether to not show an alert icon when a spell is detected
  ]]--
  ["disableVisualAlertIcons"] = false,
  --[[
    Framepositions for user draggable Frames
    frames = {
      -- should match the actual frame name
      ["PVPW_AlertIconFrame"] = {
        posX: 0,
        posY: 0
      }
      ...
    }
  ]]--
  ["frames"] = {}
}

--[[
  Saved addon variable
]]--
PVPWarnProfiles = {}

--[[
    Set default values if property is nil. This might happen after an addon upgrade
  ]]--
function me.SetupConfiguration()
  if PVPWarnOptions.disableAddon == nil then
    PVPWarnOptions.disableAddon = false
  end

  if PVPWarnOptions.disableAddonInBattlegrounds == nil then
    PVPWarnOptions.disableAddonInBattlegrounds = false
  end

  if PVPWarnOptions.showEventsForTargetOnly == nil then
    PVPWarnOptions.showEventsForTargetOnly = false
  end

  if PVPWarnOptions.ignoreEventsWhileDead == nil then
    PVPWarnOptions.ignoreEventsWhileDead = false
  end

  -- initialize spelllist for the first time with default profile
  if PVPWarnOptions.spellList == nil then
    PVPWarnOptions.spellList = mod.profile.GetDefaultProfile()
  end

  -- initialize self avoid spelllist for the first time with default profile
  if PVPWarnOptions.spellSelfAvoidList == nil then
    PVPWarnOptions.spellSelfAvoidList = mod.profile.GetDefaultProfileSelfAvoidSpells()
  end

  -- initialize enemy avoid spelllist for the first time with default profile
  if PVPWarnOptions.spellEnemyAvoidList == nil then
    PVPWarnOptions.spellEnemyAvoidList = mod.profile.GetDefaultProfileEnemyAvoidSpells()
  end

  if PVPWarnOptions.disableVisualAlertIcons == nil then
    PVPWarnOptions.disableVisualAlertIcons = false
  end

  if PVPWarnOptions.frames == nil then
    PVPWarnOptions.frames = {}
  end
end

--[[
  Set addon version on addon options. Before setting a new version make sure
  to run through migration paths. As of right now there is no migration path.
]]--
function me.SetAddonVersion()
  -- if no version set so far make sure to set the current one
  if PVPWarnOptions.addonVersion == nil then
    PVPWarnOptions.addonVersion = PVPW_ENVIRONMENT.ADDON_VERSION
  end

  me.MigrationPath()
  -- migration done update addon version to current
  PVPWarnOptions.addonVersion = PVPW_ENVIRONMENT.ADDON_VERSION
end

--[[
  Migration path for older version to newest version. For now this migration path
  is running each time the addon starts. Later versions should consider the save addon
  version before running a migration path
]]--
function me.MigrationPath()
  --[[
  if PVPWarnOptions.addonVersion == "x.x.x" then
    me.PrexxxMigration()
  end
  ]]--
end

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
  return PVPWarnOptions.showEventsForTargetOnly
end

--[[
  Disable visual alert icon
]]--
function me.DisableVisualAlertIcon()
  PVPWarnOptions.disableVisualAlertIcons = true
end

--[[
  Enable visual alert icon
]]--
function me.EnableVisualAlertIcon()
  PVPWarnOptions.disableVisualAlertIcons = false
end

--[[
  @return {boolean}
    true - if visual alert icon is disabled
    false - if visual alert icon is enabled
]]--
function me.IsVisualAlertIconDisabled()
  return PVPWarnOptions.disableVisualAlertIcons
end

--[[
  Save the position of a frame in the addon variables allowing to persist its
  position

  @param {string} frameName
  @param {number} posX
  @param {number} posY
]]--
function me.SaveUserPlacedFramePosition(frameName, posX, posY)
  if PVPWarnOptions.frames[frameName] == nil then
    mod.logger.LogDebug(me.tag, "Create new Frame cache for - " .. frameName)
    PVPWarnOptions.frames[frameName] = {}
  end

  PVPWarnOptions.frames[frameName].posX = posX
  PVPWarnOptions.frames[frameName].posY = posY

  mod.logger.LogDebug(me.tag, "Saved frame position for - " .. frameName
    .. " - new pos: posX " .. posX .. " posY " .. posY)
end

--[[
  Frames that reuse the position should make sure to set the point to "TOPLEFT"

  @param {string} frameName

  @return {table | nil}
    table - the returned x and y position
    nil - if no frame with the passed name could be found
]]--
function me.GetUserPlacedFramePosition(frameName)
  local frameConfig = PVPWarnOptions.frames[frameName]

  if type(frameConfig) == "table" then
    return frameConfig
  end

  return nil
end
