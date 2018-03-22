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
  button2 = pvpw.L["choose_profile_name_cancel_button"],
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
  Popup dialog warning before loading a profile
]]--
StaticPopupDialogs["PVPW_CHANGE_PROFILE_WARNING"] = {
  text = pvpw.L["confirm_override_profile_dialog_text"],
  button1 = pvpw.L["confirm_override_profile_yes_button"],
  button2 = pvpw.L["confirm_override_profile_no_button"],
  OnAccept = function(default)
    if default then
      mod.profile.ActivateDefaultProfile()
    else
      mod.profile.ActivateProfile(currentSelectedProfile)
      me.ProfileListUpdate() -- update visual list
    end
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

function PVPW_InitProfilesMenu()
  mod.logger.LogDebug(me.tag, "Loaded ProfilesMenu")

  me.SetupUI()
end

function me.SetupUI()
  -- create save configuration button
  local saveConfigurationButton = CreateFrame(
    "Button",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_SAVE_CURRENT_CONFIGURATION_BUTTON,
    UIParent,
    "UIPanelButtonTemplate"
  )

  saveConfigurationButton:SetPoint(
    "BOTTOMLEFT",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_LIST_FRAME,
    "BOTTOMLEFT",
    0, -35
  )

  saveConfigurationButton:SetHeight(32)
  saveConfigurationButton:SetText(pvpw.L["save_current_profile_button"])
  saveConfigurationButton:SetScript('OnClick', me.SaveCurrentProfileButtonOnClick)
  saveConfigurationButton:SetParent(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_FRAME)

  mod.guiHelper.ResizeButtonToText(saveConfigurationButton)

  saveConfigurationButton:Show()

  -- create delete profile button
  local deleteProfileButton = CreateFrame(
    "Button",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_DELETE_SELECTED_PROFILE_BUTTON,
    UIParent,
    "UIPanelButtonTemplate"
  )

  deleteProfileButton:SetPoint(
    "LEFT",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_SAVE_CURRENT_CONFIGURATION_BUTTON,
    "RIGHT",
    0, 0
  )

  deleteProfileButton:SetHeight(32)
  deleteProfileButton:SetText(pvpw.L["delete_selected_profile_button"])
  deleteProfileButton:SetScript("OnClick", me.DeleteSelectedProfileButtonOnClick)
  deleteProfileButton:SetParent(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_FRAME)

  mod.guiHelper.ResizeButtonToText(deleteProfileButton)

  deleteProfileButton:Show()

  -- create load profile button
  local loadProfileButton = CreateFrame(
    "Button",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_LOAD_SELECTED_PROFILE_BUTTON,
    UIParent,
    "UIPanelButtonTemplate"
  )

  loadProfileButton:SetPoint(
    "LEFT",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_DELETE_SELECTED_PROFILE_BUTTON,
    "RIGHT",
    0, 0
  )
  loadProfileButton:SetHeight(32)
  loadProfileButton:SetText(pvpw.L["set_active_profile_button"])
  loadProfileButton:SetScript("OnClick", me.LoadSelectedProfileButtonOnClick)
  loadProfileButton:SetParent(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_FRAME)

  mod.guiHelper.ResizeButtonToText(loadProfileButton)

  loadProfileButton:Show()

  -- create load profile button
  local loadDefaultProfileButton = CreateFrame(
    "Button",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_LOAD_DEFAULT_PROFILE_BUTTON,
    UIParent,
    "UIPanelButtonTemplate"
  )

  loadDefaultProfileButton:SetPoint(
    "LEFT",
    PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_LOAD_SELECTED_PROFILE_BUTTON,
    "RIGHT",
    0, 0
  )
  loadDefaultProfileButton:SetHeight(32)
  loadDefaultProfileButton:SetText(pvpw.L["load_default_profile_button"])
  loadDefaultProfileButton:SetScript("OnClick", me.LoadDefaultProfileButtonOnClick)
  loadDefaultProfileButton:SetParent(PVPW_CONSTANTS.ELEMENT_PVPW_PROFILES_FRAME)

  mod.guiHelper.ResizeButtonToText(loadDefaultProfileButton)

  loadDefaultProfileButton:Show()
end

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
  local profiles = PVPWarnProfiles
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
function me.LoadSelectedProfileButtonOnClick()
  if currentSelectedProfile == nil then
    mod.logger.PrintUserError(pvpw.L["user_message_select_profile_before_load"])
  else
    StaticPopup_Show("PVPW_CHANGE_PROFILE_WARNING")
  end
end

function me.LoadDefaultProfileButtonOnClick()
  local dialog = StaticPopup_Show("PVPW_CHANGE_PROFILE_WARNING")
  if dialog then
    dialog.data = true
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
