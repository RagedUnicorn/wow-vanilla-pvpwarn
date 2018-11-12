## Interface: 11200
## Title: PVPWarn
## Author: Michael Wiesendanger <michael.wiesendanger@gmail.com>
## Notes: Addon that warns players visually and acoustically about pvp events
## Dependencies: LogParser
## SavedVariablesPerCharacter: PVPWarnOptions, PVPWarnProfiles

# constant values
Code\PVPW_Constants.lua
# environment variables
Code\PVPW_Environment.lua

# localization
Localization\enUS.lua
Localization\deDE.lua

# code
Code\PVPW_Core.lua
Code\PVPW_Cmd.lua
Code\PVPW_Common.lua
Code\PVPW_Logger.lua
Code\PVPW_SpellMap.lua
Code\PVPW_SpellAvoidMap.lua
Code\PVPW_Timer.lua
Code\PVPW_EventHandler.lua
Code\PVPW_Sound.lua
Code\PVPW_Visual.lua
Code\PVPW_WarnQueue.lua
Code\PVPW_Tooltip.lua
Code\PVPW_Player.lua
Code\PVPW_Zone.lua
Code\PVPW_Profile.lua
Code\PVPW_AddonOptions.lua

# gui
Gui\PVPW_Gui.lua
Gui\PVPW_NavigationMenu.lua
Gui\PVPW_Options.lua
Gui\PVPW_Options.xml

Gui\PVPW_GeneralMenu.lua
Gui\PVPW_ConfigurationMenu.lua
Gui\PVPW_ResistMenu.lua
Gui\PVPW_ProfilesMenu.lua

# configuration tabs for items/racials/classes/misc
Gui\PVPW_GuiHelper.lua
Gui\PVPW_SpellWarnCastTab.lua
Gui\PVPW_SpellWarnResistTab.lua

Gui\PVPW_Frame.xml
