pvpw = pvpw or {}
pvpw.L = {}

pvpw.L["name"] = "PVPWarn"

-- console
pvpw.L["help"] = "|cFFFFFF00(%s)|r: Use |cFFFFFF00/pvpw|r or |cFFFFFF00/pvpwarn|r for a list of options"
pvpw.L["disable"] = "|cFFFFFF00disable|r - disable PVPWarn"
pvpw.L["enable"] = "|cFFFFFF00enable|r - enable PVPWarn"
pvpw.L["opt"] = "|cFFFFFF00opt|r - display Optionsmenu"
pvpw.L["reload"] = "|cFFFFFF00reload|r - reload UI"
pvpw.L["info_title"] = "|cFFFFFF00PVPWarn:|r"

-- dependency check messages
pvpw.L["dependency_missing"] = "Could not find LogParser dependency. PVPWarn does not work without this dependency. See https://github.com/RagedUnicorn/wow-vanilla-pvpwarn for more information"
pvpw.L["dependency_version_mismatch"] = "LogParser dependency mismatch! Found version %s expected %s. See https://github.com/RagedUnicorn/wow-vanilla-pvpwarn for more information"

-- battlegrounds
pvpw.L["warsong_gulch"] = "Warsong Gulch"
pvpw.L["arathi_basin"] = "Arathi Basin"
pvpw.L["alterac_valley"] = "Alterac Valley"

-- navigationmenu
pvpw.L["navigation_general"] = "General"
pvpw.L["navigation_profiles"] = "Profiles"
pvpw.L["navigation_warrior"] = "Warrior"
pvpw.L["navigation_paladin"] = "Paladin"
pvpw.L["navigation_rogue"] = "Rogue"
pvpw.L["navigation_priest"] = "Priest"
pvpw.L["navigation_shaman"] = "Shaman"
pvpw.L["navigation_mage"] = "Mage"
pvpw.L["navigation_warlock"] = "Warlock"
pvpw.L["navigation_druid"] = "Druid"
pvpw.L["navigation_hunter"] = "Hunter"
pvpw.L["navigation_items"] = "Items"
pvpw.L["navigation_racials"] = "Racials"
pvpw.L["navigation_misc"] = "Misc"
pvpw.L["navigation_enemy_avoid"] = "Enemy Avoid"
pvpw.L["navigation_about"] = "About"

-- generalmenu
pvpw.L["disable_addon"] = "Disable Addon"
pvpw.L["disable_addon_tooltip"] = "Disable the Addon completely. This can be helpful in crowded places with lots of events"
pvpw.L["disable_addon_in_battlegrounds"] = "Disable Addon in Battlegrounds"
pvpw.L["disable_addon_in_battlegrounds_tooltip"] = "Disable Addon in all Battlegrounds such as Warsong Gulch, Arathi Basin and Alterac Valley"
pvpw.L["ignore_events_while_dead"] = "Ignore events while player is dead"
pvpw.L["ignore_events_while_dead_tooltip"] = "Ignore events while the player is dead or in ghostform"
pvpw.L["show_events_for_target_only"] = "Show Events for current target only"
pvpw.L["show_events_for_target_only_tooltip"] = "Do not show events for targets other than the players current target"

-- profilesmenu
pvpw.L["profiles_menu_label"] = "Profiles:"
pvpw.L["save_current_profile_button"] = "Save configuration"
pvpw.L["delete_selected_profile_button"] = "Delete Profile"
pvpw.L["set_active_profile_button"] = "Load Profile"
pvpw.L["load_default_profile_button"] = "Load Default"
pvpw.L["profile_active_status"] = "Active"
pvpw.L["profile_inactive_status"] = "Inactive"
pvpw.L["choose_profile_name_dialog_text"] = "Choose a name for the new profile"
pvpw.L["choose_profile_name_accept_button"] = "Accept"
pvpw.L["choose_profile_name_cancel_button"] = "Cancel"
pvpw.L["confirm_override_profile_dialog_text"] = "This will override your current profile. Do you want to continue?"
pvpw.L["confirm_override_profile_yes_button"] = "Yes"
pvpw.L["confirm_override_profile_no_button"] = "No"
pvpw.L["user_message_select_profile_before_delete"] = "Select a profile to delete"
pvpw.L["user_message_select_profile_before_load"] = "Select a profile to load"
pvpw.L["user_message_select_profile_already_exists"] = "Profile already exist - choose another name"
pvpw.L["user_message_add_new_profile_max_reached"] = "A maximum of %s profiles is allowed you reached the maximum"

-- tooltips used throughout configuration menus for spells
pvpw.L["spell_status_tooltip_title"] = "Spell Status"
pvpw.L["spell_status_tooltip"] = "Enable or disable spell tracking for this spell"
pvpw.L["sound_warning_tooltip_title"] = "Sound Warning"
pvpw.L["sound_warning_tooltip"] = "Enable or disable acoustic warning for this spell"
pvpw.L["sound_fade_warning_tooltip_title"] = "Sound Fade Warning"
pvpw.L["sound_fade_warning_tooltip"] = "Enable or disable acoustic warning for this spell when it fades from a player"
pvpw.L["sound_visual_warning_tooltip_title"] = "Visual Warning"
pvpw.L["sound_visual_warning_tooltip"] = "Enable or disable visual warning for this spell"

-- class/items/racials/misc configuration
pvpw.L["play_sound"] = "Play Sound"
pvpw.L["play_sound_fade"] = "Play Fade Sound"
pvpw.L["show_visual"] = "Show Visual Alert"
pvpw.L["sound_active"] = "Sound"
pvpw.L["sound_fade_active"] = "Fade"
pvpw.L["visual_active"] = "Visual"
pvpw.L["spell_status"] = "Active"

-- dropdown colors
pvpw.L["texture_light_blue"] = "Light Blue"
pvpw.L["texture_pink"] = "Pink"
pvpw.L["texture_white"] = "White"
pvpw.L["texture_brown"] = "Brown"
pvpw.L["texture_blue"] = "Blue"
pvpw.L["texture_green"] = "Green"
pvpw.L["texture_orange"] = "Orange"
pvpw.L["texture_red"] = "Red"
pvpw.L["texture_violet"] = "Violet"
pvpw.L["texture_yellow"] = "Yellow"

-- tab 1
pvpw.L["spell_warn_tab"] = "SpellWarn"
-- tab 2
pvpw.L["spell_resist_tab"] = "SpellAvoid"

-- about tab
pvpw.L["author"] = "Author: Michael Wiesendanger"
pvpw.L["email"] = "E-Mail: michael.wiesendanger@gmail.com"
pvpw.L["version"] = "Version: " .. PVPW_ENVIRONMENT.ADDON_VERSION
pvpw.L["issues"] = "Issues: https://github.com/RagedUnicorn/wow-vanilla-pvpwarn/issues"
