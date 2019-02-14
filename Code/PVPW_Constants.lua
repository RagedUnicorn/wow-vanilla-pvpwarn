--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

PVPW_CONSTANTS = {
  SPELL_TYPES = {
    ["SPELL"] = 1,
    ["SPELL_DOWN"] = 2,
    ["ENEMY_AVOIDED"] = 3,
    ["SELF_AVOIDED"] = 4,
    ["LOCAL_FAILURE"] = 5,
    ["HOSTILE_DEATH"] = 6
  },

  AVOID_TYPES = {
    ["IMMUNE"] = "immune",
    ["RESIST"] = "resist",
    ["DODGE"] = "dodge",
    ["PARRY"] = "parry",
    ["MISS"] = "miss",
    ["BLOCK"] = "block"
  },

  --[[
    Spelllist corresponding to the saved addon variable and its configured
    spelllists. See PVPWarnOptions in PVPW_Core
  ]]--
  SPELL_TYPE = {
    ["SPELL"] = "spellList",
    ["SPELL_SELF_AVOID"] = "spellSelfAvoidList",
    ["SPELL_ENEMY_AVOID"] = "spellEnemyAvoidList"
  },
  --[[
    Max age in seconds of a warn message before it is considered to old. Messages
    that are to old are dropped from the queue.
  ]]--
  MAX_WARN_AGE = 5,
  --[[
    Warn textures
  ]]--
  TEXTURES = {
    yellow = {
      textureName = "texture_yellow",
      colorValue = 1
    },
    violet = {
      textureName = "texture_violet",
      colorValue = 2
    },
    red = {
      textureName = "texture_red",
      colorValue = 3
    },
    orange = {
      textureName = "texture_orange",
      colorValue = 4
    },
    green = {
      textureName = "texture_green",
      colorValue = 5
    },
    blue = {
      textureName = "texture_blue",
      colorValue = 6
    },
    brown = {
      textureName = "texture_brown",
      colorValue = 7
    },
    white = {
      textureName = "texture_white",
      colorValue = 8
    },
    pink = {
      textureName = "texture_pink",
      colorValue = 9
    },
    light_blue = {
      textureName = "texture_light_blue",
      colorValue = 10
    }
  },

  --[[
    default color based on TEXTURES - colorValue
  ]]--
  DEFAULT_COLOR = 1,


  --[[
    WoW event types
  ]]--
  PLAYER_LOGIN = "PLAYER_LOGIN",
  PLAYER_ENTERING_WORLD = "PLAYER_ENTERING_WORLD",
  ZONE_CHANGED_NEW_AREA = "ZONE_CHANGED_NEW_AREA",
  PLAYER_DEAD = "PLAYER_DEAD",
  PLAYER_ALIVE = "PLAYER_ALIVE",
  PLAYER_UNGHOST = "PLAYER_UNGHOST",
  PLAYER_TARGET_CHANGED = "PLAYER_TARGET_CHANGED",
  CHAT_MSG_SPELL_SELF_DAMAGE = "CHAT_MSG_SPELL_SELF_DAMAGE",
  CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE = "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
  CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF = "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
  CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
  CHAT_MSG_SPELL_AURA_GONE_OTHER = "CHAT_MSG_SPELL_AURA_GONE_OTHER",
  CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
  CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",

  --[[
    Alert UI
  ]]--
  ELEMENT_ALERT_FRAME = "PVPW_AlertFrame",
  ELEMENT_ALERT_TEXTURE = "PVPW_AlertTexture",
  --[[
    The maximum amount of slots for displaying alert icons
  ]]--
  MAX_ALERT_ICON_SLOTS = 5,
  --[[
    Total time an alert icon is occupying a slot
  ]]--
  ALERT_ICON_FLASH_TIME = 6,
  ELEMENT_ALERT_ICON_FRAME = "PVPW_AlertIconFrame",
  ELEMENT_ALERT_ICON_SLOT_HEIGHT = 36,
  ELEMENT_ALERT_ICON_SLOT_WIDTH = 36,
  ELEMENT_ALERT_ICON_HOLDER = "PVPW_AlertIconHolder",
  ELEMENT_ALERT_ICON_TEXTURE = "_SpellTexture",
  ELEMENT_ALERT_ICON_CONFIGURE_ICON = "ability_criticalstrike",
  ELEMENT_ALERT_ICON_SLOT_TEMPLATE = "PVPW_AlertIconSlotTemplate",

  --[[
    timersframe
  ]]--
  ELEMENT_TIMERS_FRAME = "PVPW_TimersFrame",
  --[[
    elements
  ]]--
  ELEMENT_PVPW_OPTIONS_FRAME = "PVPW_OptionsFrame",
  ELEMENT_PVPW_OPTIONS_TITLE = "PVPW_OptionsTitle",
  --[[
    option navigation
  ]]--
  ELEMENT_PVPW_NAVIGATION_BUTTON = "PVPW_Navigation_Button_",
  ELEMENT_PVPW_CONTENT = "PVPW_Content",
  --[[
    generalmenu
  ]]--
  ELEMENT_PVPW_OPT = "PVPW_Opt",
  ELEMENT_TOOLTIP = "GameTooltip",

  --[[
    profiles
  ]]--
  ELEMENT_PVPW_PROFILES_FRAME = "PVPW_ContentProfiles",
  ELEMENT_PVPW_PROFILES_LIST_FRAME = "PVPW_ProfileList",
  ELEMENT_PVPW_PROFILES_SAVE_CURRENT_CONFIGURATION_BUTTON = "PVPW_SaveCurrentConfigurationButton",
  ELEMENT_PVPW_PROFILES_DELETE_SELECTED_PROFILE_BUTTON = "PVPW_DeleteSelectedProfileButton",
  ELEMENT_PVPW_PROFILES_LOAD_SELECTED_PROFILE_BUTTON = "PVPW_LoadSelectedProfileButton",
  ELEMENT_PVPW_PROFILES_LOAD_DEFAULT_PROFILE_BUTTON = "PVPW_LoadDefaultProfileButton",
  ELEMENT_PVPW_PROFILES_MENU_LABEL = "PVPW_ProfilesMenuLabel",
  ELEMENT_PVPW_PROFILE_LIST_CELL = "PVPW_ProfileListCell",
  ELEMENT_PVPW_CHOOSE_PROFILE_NAME_POPUP_EDITBOX = "StaticPopup3EditBox",
  ELEMENT_PVPW_CHOOSE_PROFILE_NAME_POPUP_BUTTON_1 = "StaticPopup3Button1",

  --[[
    self resist menu for spells of the current class that can be avoided
  ]]--
  ELEMENT_PVPW_SELF_RESIST_FRAME = "PVPW_ContentEnemyAvoid",
  ELEMENT_PVPW_SELF_RESIST_CONTENT_FRAME = "PVPW_SelfResistContentFrame",
  ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME = "PVPW_SelfResistScrollFrame",
  ELEMENT_PVPW_SELF_RESIST_SCROLL_FRAME_SLIDER = "PVPW_SelfResistScrollFrameSlider",
  ELEMENT_PVPW_SELF_RESIST_SPELL_FRAME = "PVPW_SelfResistSpellFrame",

  --[[
    configuration tabs
  ]]--
  ELEMENT_PVPW_CLASS_CONFIGURATION_BUTTON_1 = "PVPW_ClassFrame_TabButton1",
  ELEMENT_PVPW_CLASS_CONFIGURATION_BUTTON_2 = "PVPW_ClassFrame_TabButton2",
  ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_1 = "PVPW_ClassFrame_TabContentFrame1",
  ELEMENT_PVPW_CLASS_CONFIGURATION_TAB_2 = "PVPW_ClassFrame_TabContentFrame2",

  --[[
    class/items/racials configuration
  ]]--
  ELEMENT_PVPW_CLASS_FRAME = "PVPW_ClassFrame",
  ELEMENT_PVPW_CLASS_SCROLL_FRAME = "PVPW_ClassScrollFrame",
  ELEMENT_PVPW_CLASS_CONTENT_FRAME = "PVPW_ClassContentFrame",
  ELEMENT_PVPW_CLASS_SPELL_FRAME = "PVPW_ClassSpellFrame",
  ELEMENT_PVPW_CLASS_SCROLL_FRAME_SLIDER = "PVPW_ClassScrollFrameSlider",
  ELEMENT_PVPW_CLASS_SPELL_CONFIGURATION_TEMPLATE = "PVPW_SpellConfigurationTemplate",

  ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME = "PVPW_ClassResistScrollFrame",
  ELEMENT_PVPW_CLASS_RESIST_CONTENT_FRAME = "PVPW_ClassResistContentFrame",
  ELEMENT_PVPW_CLASS_RESIST_SPELL_FRAME = "PVPW_ClassResistSpellFrame",
  ELEMENT_PVPW_CLASS_RESIST_SCROLL_FRAME_SLIDER = "PVPW_ClassResistScrollFrameSlider",

  --[[
    about content
  ]]--
  ELEMENT_PVPW_ABOUT_AUTHOR_LABEL = "PVPW_AboutAuthor",
  ELEMENT_PVPW_ABOUT_EMAIL_LABEL = "PVPW_AboutEmail",
  ELEMENT_PVPW_ABOUT_VERSION_LABEL = "PVPW_AboutVersion",
  ELEMENT_PVPW_ABOUT_ISSUES_LABEL = "PVPW_AboutIssues",

  --[[
    Configuration values for scrollframe slider
    0 is all the way up
    100 is all the way down
  ]]--
  CLASS_CONFIG_SLIDER_MIN_VALUE = 0,
  CLASS_CONFIG_SLIDER_MAX_VALUE = 100,

  BUTTON_DEFAULT_PADDING = 20
}

--[[
  A list of available categories consisting of all classes, racials, items and a
  misc category
]]--
PVPW_CLASSLIST = {
  [1] = "warrior",
  [2] = "paladin",
  [3] = "rogue",
  [4] = "priest",
  [5] = "shaman",
  [6] = "mage",
  [7] = "warlock",
  [8] = "druid",
  [9] = "hunter",
  [10] = "items",
  [11] = "racials",
  [12] = "misc"
}
