pvpw = pvpw or {}
-- localization
pvpw.L = pvpw.L or {}

if (GetLocale() == "deDE") then
  pvpw.L["name"] = "PVPWarn"

  -- console
  pvpw.L["help"] = "|cFFFFFF00(%s)|r: Benutze |cFFFFFF00/pvpw|r oder |cFFFFFF00/pvpwarn|r für eine Liste der verfügbaren Optionen"
  pvpw.L["disable"] = "|cFFFFFF00disable|r - deaktiviere "
  pvpw.L["enable"] = "|cFFFFFF00enable|r - aktiviere "
  pvpw.L["opt"] = "|cFFFFFF00opt|r - zeige Optionsmenu an"
  pvpw.L["reload"] = "|cFFFFFF00reload|r - UI neu laden"

  -- battlegrounds
  pvpw.L["warsong_gulch"] = "Warsongschlucht"
  pvpw.L["arathi_basin"] = "Arathibecken"
  pvpw.L["alterac_valley"] = "Alteractal"

  -- navigationmenu
  pvpw.L["navigation_general"] = "Allgemein"
  pvpw.L["navigation_profiles"] = "Profile"
  pvpw.L["navigation_warrior"] = "Krieger"
  pvpw.L["navigation_paladin"] = "Paladin"
  pvpw.L["navigation_rogue"] = "Schurke"
  pvpw.L["navigation_priest"] = "Priester"
  pvpw.L["navigation_shaman"] = "Shamane"
  pvpw.L["navigation_mage"] = "Magier"
  pvpw.L["navigation_warlock"] = "Hexenmeister"
  pvpw.L["navigation_druid"] = "Druide"
  pvpw.L["navigation_hunter"] = "Jäger"
  pvpw.L["navigation_items"] = "Items"
  pvpw.L["navigation_racials"] = "Rassenfähigkeiten"
  pvpw.L["navigation_misc"] = "Sonstige"
  pvpw.L["navigation_enemy_avoid"] = "Gegner verhindert"
  pvpw.L["navigation_about"] = "Über"

  -- generalmenu
  pvpw.L["disable_addon"] = "Deaktiviere Addon"
  pvpw.L["disable_addon_tooltip"] = "Deaktiviere Addon komplett. Dies kann hilfreich sein an Orten mit vielen Spielern mit vielen Events"
  pvpw.L["disable_addon_in_battlegrounds"] = "Deaktiviere Addon in Schlachtfeldern"
  pvpw.L["disable_addon_in_battlegrounds_tooltip"] = "Deaktiviere Addon in allen Schlachtfeldern wie Warsong Schlucht, Arathibbecken und Alteractal"
  pvpw.L["ignore_events_while_dead"] = "Ignoriere Warnungen solange Spieler tot ist"
  pvpw.L["ignore_events_while_dead_tooltip"] = "Ignore Warnungen solange der Spiele tot oder in Geistesform ist"
  pvpw.L["show_events_for_target_only"] = "Zeige Warnungen nur für aktuelles Ziel"
  pvpw.L["show_events_for_target_only_tooltip"] = "Zeige Warnungen nur an wenn sie vom aktuellen Ziel des Spielers ausgehen"

  -- tooltips used throughout configuration menus for spells
  pvpw.L["spell_status_tooltip_title"] = "Zauberstatus"
  pvpw.L["spell_status_tooltip"] = "Aktiviere oder deaktiviere verfolgen für diesen Zauber"
  pvpw.L["sound_warning_tooltip_title"] = "Geräuschwarnung"
  pvpw.L["sound_warning_tooltip"] = "Aktiviere oder deaktiviere Geräuschwarnung für diesen Zauber"
  pvpw.L["sound_fade_warning_tooltip_title"] = "Geräuschwarnung bei Zauberverblassung"
  pvpw.L["sound_fade_warning_tooltip"] = "Aktiviere oder deaktiviere Geräuschwarnung bei Zauberverblassung für diesen Zauber"
  pvpw.L["sound_visual_warning_tooltip_title"] = "Visuelle Warnung"
  pvpw.L["sound_visual_warning_tooltip"] = "Aktiviere oder deaktiviere visuelle Warnung für diesen Zauber"

  -- class/items/racials/misc configuration
  pvpw.L["play_sound"] = "Ton spielen"
  pvpw.L["play_sound_fade"] = "Ton verblassen spielen"
  pvpw.L["show_visual"] = "Zeige visuelle Warnung"
  pvpw.L["sound_active"] = "Ton"
  pvpw.L["sound_fade_active"] = "Verblassen"
  pvpw.L["visual_active"] = "Visuell"
  pvpw.L["spell_status"] = "Aktive"

  -- dropdown colors
  pvpw.L["texture_blue"] = "Blau"
  pvpw.L["texture_green"] = "Grün"
  pvpw.L["texture_orange"] = "Orange"
  pvpw.L["texture_red"] = "Rot"
  pvpw.L["texture_violet"] = "Violet"
  pvpw.L["texture_yellow"] = "Gelb"

  -- tab 1
  pvpw.L["spell_warn_tab"] = "Zauberwarnung"
  -- tab 2
  pvpw.L["spell_resist_tab"] = "Zaubervermeiden"

  -- about tab
  pvpw.L["author"] = "Autor: Michael Wiesendanger"
  pvpw.L["email"] = "E-Mail: michael.wiesendanger@gmail.com"
  pvpw.L["version"] = "Version: " .. PVPW_CONSTANTS.ADDON_VERSION
  pvpw.L["issues"] = "Probleme: https://github.com/RagedUnicorn/wow-pvpwarn/issues"
end
