# PVPWarn

![](/Docs/pvpw_raged_unicorn_logo.png)

> PVPWarn aims to help the player to hear and see enemy spells casted on himself and also spells that an enemy player resisted or spells that the player himself resisted

PVPWarn uses both visual and acoustic effects to make the player aware of certain events. The addon aims to be configurable to the players preferences and allows customization on exactly what spells should be brought to the attention of the player and in what form.

## Installation

WoW-Addons are installed directly in your WoW directory:

`[WoW-installation-directory]\Interface\AddOns`

Make sure to get the newest version of the Addon from the releases tab:

[PVPWarn-Releases](https://github.com/RagedUnicorn/wow-pvpwarn/releases)

> Note: If the Addon is not showing up in your ingame Addonlist make sure that the Addon is named `PVPWarn` in your Addons folder

## Demo

TODO should add a YouTube video with some examples

## Configuration

### Configure Combatlog Distance

Casts and auras are read from the combatlog. The default range for the combatlog to pick up such casts and auras is 40 yards. Using the following command can increase this up to 100 yards. This can have a negative effect on the performance if a lot of addons are reading the combat log and get overwhelmed with the amount of messages but can also be very helpful picking up events from players that are far away.

`/console SET CombatLogRangeHostilePlayers "100"`

To revert, run the same command with a value of 40.

### Configure Spells

Configurable spells are grouped into different categories. Other than the different class categories there are also categories for misc, racials and items.

![](/Docs/pvpw_doc_navigation.png)

| Category          | Description                                                                                                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------- |
| druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior | Category for class related spells                                     |
| racials           | Category for all spells that are considered a racial spell meaning it is only available to certain races                  |
| items             | Category for items such as trinkets and engineering items                                                                 |
| misc              | The misc category contains potions and usable consumables and everything else that doesn't fit any other category        |

Inside such a category a list of spells is displayed that can be enabled or disabled. Additionally a spell can be configured to have a sound and a visual warning played to the player upon detection in the combat log. The buttons to fire of such an alert are for testing purpose only.

The category itself is additionally separated into two tabs.

#### SpellWarn Tab

Inside this tab spells that are cast by the enemy can be configured.

![](/Docs/pvpw_doc_spellwarn.png)

#### SpellResist Tab

This tab is responsible for the configuration of spells that the player itself resisted. An example for this would be that a warning is fired whenever you resist an enemy mages's counterspell.

![](/Docs/pvpw_doc_spellresist.png)

For the opposite warning if an enemy player resisted an important spell of yours there is the "Enemy Avoid" configuration. The configuration itself is the same as for other categories. However based on your current class different spells are displayed inside this navigation point.

![](/Docs/pvpw_doc_enemy_avoid.png)

*Note:* A spell that is enabled but has no sound and no visual warning enabled will not show a warning to the player. The spell is tracked by the addon but never alerted to the player.

### Disable Addon

The addon can be configured to be either completely disabled or only disabled in all Battlegrounds. This includes `Warsong Gulch`, `Arathi Basin` and `Alterac Valley`. This can be useful to prevent the warnQueue to get to annoying in places where a lot of such events are triggered. Also consider reducing the spells that are enabled if this is the case.

### Ignore events while player is dead

Events can be ignored while the player is dead and wishes to not see any warning during this state.

### Show events only for the current target

This option allows to ignore surrounding events and only report events for your current target.

Note: Events with type `CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE` will always shown because they have no source. Events like that includes events such as Blind, Fear, Polymorph and have the form of You are afflicted by [some spell].

## FAQ

#### The addon is not showing up in WoW. What can I do?

Make sure to recheck the installation part of this Readme and check that the addon is placed inside `[WoW-installation-directory]\Interface\AddOns` and is correctly named as `PVPWarn`.

#### I'm getting the following warning: Skipping warn message because max age was reached. Why is that?

When a warning event is detected it is put into a queue before it is played to the user. This prevents the addon to play multiple of those warning at the same time to the user. However this means that it can take some time until an event is played when there is already an event playing. The more warning events that are active the higher the chance that an event has to wait until it is played to the player. This can lead to a point that a warning event might be considered as no longer relevant because it happened some seconds ago. While this should usually not be the case if you see this warning often you should consider disabling some of the warning events in the options menu.

This is also more likely to happen in a crowded place with lots of players. You can either temporarily disable the addon in the settings or use the option to disable the addon in battlegrounds.

#### No Sound is played when a player used [certain spell]. What should I do?

This can have different reasons. Make sure to check that the spell you would like to be alerted is configured and active in the addon. If you cannot find the spell in the list chances are the spell cannot be tracked or is not yet included in the addon. While certain spells are untraceable others might simply be missing. Before creating an issued please make sure to check the [limitations](#Limitations) chapter for an explanation why your spell might not be available in the configuration. If you cannot find an entry for that spell feel free to create a Github issue with an enhancement request and I will look into it if it is possible to support that spell.

#### I get a red error (Lua Error) on my screen. What is this?

This is what we call a LUA error and it usually happens because of an oversight or error by the developer (in this case me). Take a screenshot off the error and create a Github Issue with it and I will see if I can resolve it. It also helps if you can add any additional information of what you we're doing at the time and what other addons you have active. Also if you are able to reproduce the error make sure to check if it still happens if you disable all others addons.

## Wording

Definition of wording throughout the project:

### Event

An event is a state that is detected by the addon. The event itself doesn't necessarily has to be alerted to the user. Depending on the configuration of the player events might be ignored.

#### Spell cast event

A spell cast event can be triggered by certain spells that are tracked by this addon.

#### Spell avoid event

A spell avoid event is triggered by spells that are avoided by the player itself.

#### Spell enemy avoid event

A spell enemy avoid event is fired for spells that are resisted by an enemy player. Depending on the class of the player different spells can be configured.

### Warning

A warning is fired based on an event that is detected by the addon and also configured to be active by the player. A warning can be both visually and acoustically alerted to the user.

### Avoid

Avoid is used in the context as either the player or an enemy avoided a certain spell. Avoiding capsules multiple possibilities of avoiding the effects of a spell. WoW has the following ways that are all considered as avoided by this addon.

* dodge
* resist
* parry
* immune
* miss
* block

Additionally we differentiate between self avoid and enemy avoid. While enemy avoid means that an enemy avoided a spell by the player itself - self avoid means the opposite that you as a player avoided an enemy spell.

#### Enemy avoid

E.g. you're casting Frost Nova as a Mage and the enemy player resists your Frost Nova.

> "Your Frost Nova was resisted by SomeEnemyPlayer."

This is considered an enemy avoid. Based on the class you are the configurable spells inside the addon option menu differ. You can only configure spells that your class can learn.

#### Self avoid

Turning things around and you are a Warrior that walks into a Frost Nova of an enemy Mage but not before getting a Blessing of Freedom from a friendly Paladin might result in the following combat message.

> "SomeEnemyPlayer's Frost Nova failed. You are immune."

This is considered a self avoid. You as a player resisted an enemy spell.

## Limitations

This addon has certain limitations for some spells. As a rule of thumb if an event is not showing up in your combat log it cannot be tracked by the addon. This applies to some really important spells such as `Vanish`, `Feign Death` and others. For an overview of supported and unsupported spells see [Spelllist](Docs/SPELLLIST.md).

## License

Copyright (c) 2018 Michael Wiesendanger

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
