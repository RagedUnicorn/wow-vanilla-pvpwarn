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
mod.profilesMenu = me

me.tag = "ProfilesMenu"

-- the currently selected profile in the profile list
local currentSelectedProfile = nil

--[[
  Popup dialog for choosing a profile name
]]--
StaticPopupDialogs["PVPW_CHOOSE_PROFILE_NAME"] = {
  text = pvpw.L["choose_profile_name_dialog_text"],
  button1 = pvpw.L["choose_profile_name_accept_button"],
  button2 = pvpw.L["choose_profile_name_cancel_button"] ,
  OnShow = function (self, data)
    local editBox = me.FindDialogElementByName(
      this:GetChildren(), "StaticPopup3EditBox")
    local button1 = me.FindDialogElementByName(
      this:GetChildren(), "StaticPopup3Button1")

    if editBox ~= nil and button1 ~= nil then
      button1:Disable()
      editBox:SetText("") -- reset text to empty
    end
  end,
  OnAccept = function()
    -- retrieve text input from editfield
    for _, child in ipairs({this:GetParent():GetChildren()}) do
      if string.find(child:GetName(), "StaticPopup3EditBox") then
        me.SaveCurrentProfile(child:GetText())
        return
      end
    end
  end,
  EditBoxOnTextChanged = function ()
    local editBox = me.FindDialogElementByName(
      this:GetParent():GetChildren(), "StaticPopup3EditBox")
    local button1 = me.FindDialogElementByName(
      this:GetParent():GetChildren(), "StaticPopup3Button1")

    if editBox ~= nil and button1 ~= nil then
      if string.len(editBox:GetText()) > 0 then
        button1:Enable()

      else
        button1:Disable()
      end
    end
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 3,
  hasEditBox = true,
  maxLetters = mod.profile.GetMaxProfileNameLength()
}

--[[
  Popup dialog for choosing a profile name
]]--
StaticPopupDialogs["PVPW_CHANGE_PROFILE_WARNING"] = {
  text = pvpw.L["confirm_override_profile_dialog_text"],
  button1 = pvpw.L["confirm_override_profile_yes_button"],
  button2 = pvpw.L["confirm_override_profile_no_button"],
  OnAccept = function()
    mod.profile.ActivateProfile(currentSelectedProfile)
    me.ProfileListUpdate() -- update visual list
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Helper function to find elements inside a static popup dialog

  @param {table} context
  @param {string} elementName
  @return {table | nil}
    the element that was found or nil if none could be found
]]--
function me.FindDialogElementByName(context, elementName)
  for _, child in ipairs({context:GetParent():GetChildren()}) do
    if string.find(child:GetName(), elementName) then
      return child
    end
  end

  return nil
end

--[[
  FauxScrollFrame callback for profileslist
]]--
function me.ProfileListUpdate()
  local profiles = mod.profile.GetProfiles()
  local offset = FauxScrollFrame_GetOffset(PVPW_ProfileListScrollFrame)

  FauxScrollFrame_Update(PVPW_ProfileListScrollFrame, profiles and table.getn(profiles) or 0, 5, 24)

  me.ClearCellList(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL, 5)

  for i = 1, 5 do
   local profileCell = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL .. i)
   local profileName = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL .. i .. "_ProfileName")
   local profileStatus = getglobal(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL .. i .. "_ProfileStatus")

   local idx = offset + i

    if idx <= table.getn(profiles) then
      profileName:SetText(profiles[idx].name)
      profileCell:Show()
    else
      profileCell:Hide()
    end
  end
end

--[[
  Cell onClick callback for profileslist cells
]]--
function me.ProfileListCellOnClick()
  local index = FauxScrollFrame_GetOffset(PVPW_ProfileListScrollFrame) + this:GetID()
  currentSelectedProfile = index
  -- clear all current highlighting
  me.ClearCellList(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL, 5)

  this.selectedItem = true
  getglobal(this:GetName() .. "Highlight"):Show()
end

--[[
  Button callback to save the current user configuration. This will invoke a popup
  dialog for the user to choose a name for the profile.
]]--
function me.SaveCurrentProfileButtonOnClick()
  StaticPopup_Show("PVPW_CHOOSE_PROFILE_NAME")
end

--[[
  Given the player has a profile selected in the list this will delete the profile.
  The users current configuration however will not be touched by this.
]]--
function me.DeleteSelectedProfileButtonOnClick()
  if currentSelectedProfile == nil then
    mod.logger.PrintUserError(pvpw.L["user_message_select_profile_before_delete"])
  else
    mod.profile.DeleteProfile(currentSelectedProfile)
    currentSelectedProfile = nil
    me.ClearCellList(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILE_LIST_CELL, 5)
    me.ProfileListUpdate() -- update visual list
  end
end

--[[
  Given the player has a profile selected in the list this will activate the profile.
  The users current configuration will be overriden
]]--
function me.SetActiveProfileButtonOnClick()
  if currentSelectedProfile == nil then
    mod.logger.PrintUserError(pvpw.L["user_message_select_profile_before_load"])
  else
    StaticPopup_Show("PVPW_CHANGE_PROFILE_WARNING")
  end
end

--[[
  Save current player configuration as a profile

  @param {string} profileName
]]--
function me.SaveCurrentProfile(profileName)
  mod.profile.AddNewProfile(
    profileName,
    PVPWarnOptions.spellList,
    PVPWarnOptions.spellSelfAvoidList,
    PVPWarnOptions.spellEnemyAvoidList
  )
  me.ProfileListUpdate() -- update visual list
end

--[[
  @param {string} baseName
    name of the button to clear
  @param {number} count
    amount of buttons to clear
  @param {boolean} visual
    whether to clear only visual or also logically
]]--
function me.ClearCellList(baseName, count, visual)
  for i = 1, count do
    if not visual then
      getglobal(baseName .. i).selectedItem = false
    end
    getglobal(baseName .. i .. "Highlight"):Hide()
  end
end
