## Interface: ${addon.interface}
## Title: ${addon.name}
## Author: ${addon.author}
## Notes: Addon that warns players visually and acoustically about pvp events
## Version: ${addon.tag.version}
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

# debug
Code\PVPW_Debug.lua

# test
Test\PVPW_TestReporter.lua
Test\PVPW_TestHelper.lua
Test\PVPW_TestWarriorEn.lua
Test\PVPW_TestWarriorDe.lua
Test\PVPW_TestWarlockEn.lua
Test\PVPW_TestWarlockDe.lua
Test\PVPW_TestPriestEn.lua
Test\PVPW_TestPriestDe.lua
Test\PVPW_TestRogueEn.lua
Test\PVPW_TestRogueDe.lua
Test\PVPW_TestMageEn.lua
Test\PVPW_TestMageDe.lua
Test\PVPW_TestHunterEn.lua
Test\PVPW_TestHunterDe.lua
Test\PVPW_TestPaladinEn.lua
Test\PVPW_TestPaladinDe.lua
Test\PVPW_TestDruidEn.lua
Test\PVPW_TestDruidDe.lua
Test\PVPW_TestShamanEn.lua
Test\PVPW_TestShamanDe.lua
Test\PVPW_TestRacialsEn.lua
Test\PVPW_TestRacialsDe.lua
Test\PVPW_TestItemsEn.lua
Test\PVPW_TestItemsDe.lua
Test\PVPW_TestMiscEn.lua
Test\PVPW_TestMiscDe.lua
Test\PVPW_TestAll.lua
