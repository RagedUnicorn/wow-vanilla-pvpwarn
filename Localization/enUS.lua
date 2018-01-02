pvpw = pvpw or {}
-- localization
pvpw.L = pvpw.L or {}

pvpw.L["name"] = "PVPWarn"

-- console
pvpw.L["help"] = "|cFFFFFF00(%s)|r: Use |cFFFFFF00/pvpw|r or |cFFFFFF00/pvpwarn|r for a list of options"
pvpw.L["disable"] = "|cFFFFFF00disable|r - disable "
pvpw.L["enable"] = "|cFFFFFF00enable|r - enable "
pvpw.L["opt"] = "|cFFFFFF00opt|r - display Optionsmenu"
pvpw.L["reload"] = "|cFFFFFF00reload|r - reload UI"

-- navigationmenu
pvpw.L["navigation_general"] = "General"
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
pvpw.L["version"] = "Version: " .. PVPW_CONSTANTS.ADDON_VERSION
pvpw.L["issues"] = "Issues: https://github.com/RagedUnicorn/wow-pvpwarn/issues"
