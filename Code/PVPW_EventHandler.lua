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
mod.eventHandler = me

me.tag = "EventHandler"

--[[
  Track identifiers of event subscriptions. This allows for later unregistering
  from the logparser dependency.
]]--
local subscriptions = {}

--[[
  @param {string} status
  @param {string} spellData
]]
function me.HandleEvent(status, spellData)

  -- if addon disabled ignore event
  if PVPWarnOptions.disableAddon then
    mod.logger.LogDebug(me.tag, "Ignoring event because the Addon is disabled")
    return
  end

  -- ignore event if player is dead
  if PVPWarnOptions.ignoreEventsWhileDead and not mod.player.IsPlayerAlive() then
    mod.logger.LogDebug(me.tag, "Ignoring event because player is dead")
    return
  end

  --[[
    Ignore event if only events for current target should be shown and the player
    has no valid target at the time
  ]]--
  if PVPWarnOptions.showEventsForTargetOnly and not mod.player.PlayerHasEnemyTarget() then
    mod.logger.LogDebug(me.tag, "Ignore event because showEventsForTargetOnly is active "
      .. "and player has no valid target")
    return
  end

  -- if player is in a battleground and addon is disabled for battlegrounds ignore event
  if PVPWarnOptions.disableAddonInBattlegrounds and mod.zone.IsPlayerInBattleground() then
    mod.logger.LogDebug(me.tag, "Ignoring event because player is in battleground" ..
      " and events in battlegrounds are disabled")
    return
  end

  if status ~= 0 then
    local class, spell, fade

    -- check if event should be ignored
    if not me.ShouldProcessEvent(spellData) then
      mod.logger.LogDebug(me.tag, "Should not process event - aborting...")
      return
    end

    -- retrieve spelldata
    class, spell = me.GetSpellFromSpellMap(spellData)

    if class and spell then
      if spellData.faded then
        if spell.hasFade then
          fade = true
        else
          mod.logger.LogDebug(me.tag, "Detected a fading spell but the spell" ..
            " in the spellMap does not support fading - ignoring event")
          return
        end
      end

      if me.ShouldIgnoreEvent(spellData.type, spell) then
        mod.logger.LogDebug(me.tag, "Ignoring event - " .. spellData.type .. " - for spell: "
          .. spell.name)
        return
      end

      mod.warnQueue.AddToQueue(tostring(math.floor(math.random() * 100000)),
          spell.normalizedSpellName, spellData.spellType, class, spell.soundFileName, fade)
    else
      mod.logger.LogInfo(me.tag, string.format("Unknown spell %s", spellData.spell))
      return
    end
  end
end

--[[
  Based on the spellData type retrieve the spell either from the normale spellMap
  or the SpellAvoidMap

  @param {table} spellData
  @return {string, table}
]]--
function me.GetSpellFromSpellMap(spellData)
  local class, spell

  if spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF
    or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_SELF_DAMAGE
    or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS then
    class, spell = mod.spellAvoidMap.SearchByName(spellData.spell)
  else
    class, spell = mod.spellMap.SearchByName(spellData.spell)
  end

  return class, spell
end

--[[
  Figure out whether an event should be processed or not. Note that the event can still
  be dropped at a latter point because the player deactived the spell in his options

  @param {table} spellData
  @return {boolean}
    true - event should be processed
    false - event should be ignored
]]--
function me.ShouldProcessEvent(spellData)
  if PVPWarnOptions.showEventsForTargetOnly then

    if spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS
      or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
      or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
      or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_AURA_GONE_OTHER
      or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
      or spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS then
       if mod.player.IsCurrentTarget(spellData.source) then
         return true
       end

       return false
    elseif spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_SELF_DAMAGE then
      if mod.player.IsCurrentTarget(spellData.target) then
        return true
      end

      return false
    elseif spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS then
      if mod.player.IsCurrentTarget(spellData.source) or mod.player.IsCurrentTarget(spellData.source1) then
        return true
      end

      return false
    elseif spellData.type == PVPW_CONSTANTS.CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE then
      -- always return true because this event does not have a source
      return true
    end
  else
    -- if option is deactivated show event in any case
    return true
  end
end

--[[
  @param {string} eventType
  @param {table} spell

  @return {boolean}
    True if the event should be ignored
    False if the event should not be ignored
]]--
function me.ShouldIgnoreEvent(eventType, spell)
  if not spell.ignoreEvents then return false end

  for i = 1, table.getn(spell.ignoreEvents) do
    if spell.ignoreEvents[i] == eventType then
      return true
    end
  end

  return false
end

--[[
  Subscribe to LogParser events
]]--
function me.SubscribeEvents()
  mod.logger.LogInfo(me.tag, "Subscribing to Addon events")

  local events = {
    "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
    "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
    "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
    "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
    "CHAT_MSG_SPELL_AURA_GONE_OTHER",
    "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
    "CHAT_MSG_SPELL_SELF_DAMAGE",
    "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS",
    "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
  }

  for i = 1, table.getn(events) do
    local identifier
    local eventType

    if not me.IsAlreadySubscribed(events[i]) then
      identifier, eventType = lp.subscriptionManager.SubscribeEvent(
        PVPW_CONSTANTS.ADDON_IDENTIFIER,
        mod.eventHandler.HandleEvent,
        events[i]
      )

      subscriptions[eventType] = identifier
    else
      mod.logger.LogInfo(me.tag, "Event - " .. events[i]
        .. " is already subscribed - skipping...")
    end
  end
end

--[[
  Unsubscribe to LogParser events
]]--
function me.UnsubscribeEvents()
  mod.logger.LogInfo(me.tag, "Unsubscribing to Addon events")

  for _, identifier in pairs(subscriptions) do
    lp.subscriptionManager.UnsubscribeEvent(identifier)
  end

  subscriptions = {} -- empty
end

--[[
  @param {string} eventType

  @return {boolean}
    true - if the event is already subscribed
    false - if the event is not yet subscribed
]]--
function me.IsAlreadySubscribed(eventType)
  for type, _ in pairs(subscriptions) do
    if eventType == type then
      return true
    end
  end

  return false
end
