## Spelllist

| State               | Comment                                                    |
| ------------------- | ---------------------------------------------------------- |
| supported           | Spell is fully supported                                   |
| not supported       | Spell was checked and cannot be supported                  |
| partially supported | Spell is supported in some cases but not all               |

#### Supported

Supported spells are spells that are implemented and tested by the addon. They are expected to be working. If you feel like they don't work as expected please file a bug

#### Not supported

Spells can be unsupported for multiple reasons. For some spells Blizzard seems to have made a clear decision why they are not showing up. As an example spells like `Cold Snap` and `Preparation` are not showing up in the combat log at all. As of this the addon is not able to support those spells.

#### Partially supported

Partially supported spells might be supported in some cases but aren't in others. As an example a Mages's spell `Counterspell` is only showing up in the log if `Improved Counterspell` is skilled otherwise it is not possible to read it from the combat log messages.

Another reason that a spell is only partially supported is that it might not work as one expects it. For example a Warriors `Intercept` and `Charge` cannot be detected itself. However the stun can be detected. This means that the addon will only alert the player when he is afflicted of that stun and not at the exact moment the Warrior presses the spell.


| Category   | Icon                                                                                      | Spellname                        | State                 |
| -----------| ----------------------------------------------------------------------------------------- | -------------------------------- | --------------------- |
| warrior    | ![spell_nature_ancestralguardian](icons/spell_nature_ancestralguardian.jpg)               | Berserker Rage                   | `supported`           |
| warrior    | ![ability_criticalstrike](icons/ability_criticalstrike.jpg)                               | Recklessness                     | `supported`           |
| warrior    | ![ability_criticalstrike](icons/ability_criticalstrike.jpg)                               | Death Wish                       | `supported`           |
| warrior    | ![ability_warrior_shieldwall](icons/ability_warrior_shieldwall.jpg)                       | Shield Wall                      | `supported`           |
| warrior    | ![ability_warrior_offensivestance](icons/ability_warrior_offensivestance.jpg)             | Battle Stance                    | `supported`           |
| warrior    | ![ability_racial_avatar](icons/ability_racial_avatar.jpg)                                 | Berserker Stance                 | `supported`           |
| warrior    | ![ability_warrior_defensivestance](icons/ability_warrior_defensivestance.jpg)             | Defensive Stance                 | `supported`           |
| warrior    | ![ability_rogue_sprint](icons/ability_rogue_sprint.jpg)                                   | Intercept                        | `partially supported` |
| warrior    | ![spell_holy_ashestoashes](icons/spell_holy_ashestoashes.jpg)                             | Last Stand                       | `supported`           |
| warrior    | ![ability_warrior_disarm](icons/ability_warrior_disarm.jpg)                               | Disarm                           | `supported`           |
| warrior    | ![ability_thunderbolt](icons/ability_thunderbolt.jpg)                                     | Concussion Blow                  | `supported`           |
| warrior    | ![ability_racial_bloodrage](icons/ability_racial_bloodrage.jpg)                           | Bloodrage                        | `supported`           |
| warrior    | ![inv_gauntlets_04](icons/inv_gauntlets_04.jpg)                                           | Pummel                           | `supported`           |
| warrior    | ![ability_warrior_charge](icons/ability_warrior_charge.jpg)                               | Charge                           | `partially supported` |
| warrior    | ![ability_golemthunderclap](icons/ability_golemthunderclap.jpg)                           | Intimidating Shout               | `supported`           |
| warrior    | ![ability_defend](icons/ability_defend.jpg)                                               | Shield Block                     | `supported`           |
| warrior    | ![ability_warrior_shieldbash](icons/ability_warrior_shieldbash.jpg)                       | Shield Bash                      | `supported`           |
| warrior    | ![inv_shield_05](icons/inv_shield_05.jpg)                                                 | Shield Slam                      | `supported`           |
| priest     | ![spell_shadow_psychicscream](icons/spell_shadow_psychicscream.jpg)                       | Psychic Scream                   | `supported`           |
| priest     | ![spell_shadow_impphaseshift](icons/spell_shadow_impphaseshift.jpg)                       | Silence                          | `supported`           |
| priest     | ![spell_holy_powerinfusion](icons/spell_holy_powerinfusion.jpg)                           | Power Infusion                   | `supported`           |
| priest     | ![spell_holy_innerfire](icons/spell_holy_innerfire.jpg)                                   | Inner Fire                       | `supported`           |
| priest     | ![spell_shadow_unsummonbuilding](icons/spell_shadow_unsummonbuilding.jpg)                 | Vampiric Embrace                 | `supported`           |
| priest     | ![spell_holy_restoration](icons/spell_holy_restoration.jpg)                               | Desperate Prayer                 | `supported`           |
| priest     | ![spell_shadow_blackplague](icons/spell_shadow_blackplague.jpg)                           | Devouring Plague                 | `supported`           |
| priest     | ![spell_shadow_deadofnight](icons/spell_shadow_deadofnight.jpg)                           | Touch of Weakness                | `partially supported` |
| priest     | ![spell_holy_excorcism](icons/spell_holy_excorcism.jpg)                                   | Fear Ward                        | `supported`           |
| priest     | ![spell_holy_elunesgrace](icons/spell_holy_elunesgrace.jpg)                               | Elune's Grace                    | `supported`           |
| priest     | ![spell_arcane_starfire](icons/spell_arcane_starfire.jpg)                                 | Starshards                       | `supported`           |
| priest     | ![spell_shadow_fingerofdeath](icons/spell_shadow_fingerofdeath.jpg)                       | Hex of Weakness                  | `supported`           |
| rogue      | ![spell_shadow_mindsteal](icons/spell_shadow_mindsteal.jpg)                               | Blind                            | `supported`           |
| rogue      | ![ability_kick](icons/ability_kick.jpg)                                                   | Kick                             | `supported`           |
| rogue      | ![ability_rogue_sprint](icons/ability_rogue_sprint.jpg)                                   | Sprint                           | `supported`           |
| rogue      | ![spell_shadow_shadowward](icons/spell_shadow_shadowward.jpg)                             | Evasion                          | `supported`           |
| rogue      | ![ability_rogue_kidneyshot](icons/ability_rogue_kidneyshot.jpg)                           | Kidney Shot                      | `supported`           |
| rogue      | ![ability_cheapshot](icons/ability_cheapshot.jpg)                                         | Cheap Shot                       | `supported`           |
| rogue      | ![spell_shadow_shadowworddominate](icons/spell_shadow_shadowworddominate.jpg)             | Adrenaline Rush                  | `supported`           |
| rogue      | ![ability_warrior_punishingblow](icons/ability_warrior_punishingblow.jpg)                 | Blade Flurry                     | `supported`           |
| rogue      | ![spell_ice_lament](icons/spell_ice_lament.jpg)                                           | Cold Blood                       | `supported`           |
| rogue      | ![ability_vanish](icons/ability_vanish.jpg)                                               | Vanish                           | `not supported`       |
| rogue      | ![spell_shadow_antishadow](icons/spell_shadow_antishadow.jpg)                             | Preparation                      | `not supported`       |
| mage       | ![spell_frost_frost](icons/spell_frost_frost.jpg)                                         | Ice Block                        | `supported`           |
| mage       | ![spell_nature_polymorph](icons/spell_nature_polymorph.jpg)                               | Polymorph                        | `supported`           |
| mage       | ![spell_nature_polymorph_cow](icons/spell_nature_polymorph_cow.jpg)                       | Polymorph: Cow                   | `supported`           |
| mage       | ![spell_magic_polymorphpig](icons/spell_magic_polymorphpig.jpg)                           | Polymorph: Pig                   | `supported`           |
| mage       | ![ability_hunter_pet_turtle](icons/ability_hunter_pet_turtle.jpg)                         | Polymorph: Turtle                | `supported`           |
| mage       | ![spell_arcane_blink](icons/spell_arcane_blink.jpg)                                       | Blink                            | `supported`           |
| mage       | ![spell_fire_firearmor](icons/spell_fire_firearmor.jpg)                                   | Fire Ward                        | `supported`           |
| mage       | ![spell_frost_frostward](icons/spell_frost_frostward.jpg)                                 | Frost Ward                       | `supported`           |
| mage       | ![spell_frost_iceshock](icons/spell_frost_iceshock.jpg)                                   | Counterspell                     | `partially supported` |
| mage       | ![spell_shadow_detectlesserinvisibility](icons/spell_shadow_detectlesserinvisibility.jpg) | Mana Shield                      | `supported`           |
| mage       | ![spell_ice_lament](icons/spell_ice_lament.jpg)                                           | Ice Barrier                      | `supported`           |
| mage       | ![spell_frost_frostnova](icons/spell_frost_frostnova.jpg)                                 | Frost Nova                       | `supported`           |
| mage       | ![spell_nature_lightning](icons/spell_nature_lightning.jpg)                               | Arcane Power                     | `supported`           |
| mage       | ![spell_nature_purge](icons/spell_nature_purge.jpg)                                       | Evocation                        | `supported`           |
| mage       | ![spell_nature_enchantarmor](icons/spell_nature_enchantarmor.jpg)                         | Presence of Mind                 | `supported`           |
| mage       | ![spell_fire_sealoffire](icons/spell_fire_sealoffire.jpg)                                 | Combustion                       | `supported`           |
| mage       | ![spell_holy_excorcism_02](icons/spell_holy_excorcism_02.jpg)                             | Blast Wave                       | `supported`           |
| mage       | ![spell_frost_wizardmark](icons/spell_frost_wizardmark.jpg)                               | Cold Snap                        | `not supported`       |
| hunter     | ![spell_frost_stun](icons/spell_frost_stun.jpg)                                           | Concussive Shot                  | `supported`           |
| hunter     | ![spell_frost_stun](icons/spell_frost_stun.jpg)                                           | Improved Concussive Shot         | `supported`           |
| hunter     | ![ability_hunter_aspectofthemonkey](icons/ability_hunter_aspectofthemonkey.jpg)           | Aspect of the Monkey             | `supported`           |
| hunter     | ![spell_nature_ravenform](icons/spell_nature_ravenform.jpg)                               | Aspect of the Hawk               | `supported`           |
| hunter     | ![ability_hunter_runningshot](icons/ability_hunter_runningshot.jpg)                       | Rapid Fire                       | `supported`           |
| hunter     | ![ability_whirlwind](icons/ability_whirlwind.jpg)                                         | Deterrence                       | `supported`           |
| hunter     | ![spell_fire_selfdestruct](icons/spell_fire_selfdestruct.jpg)                             | Explosive Trap                   | `supported`           |
| hunter     | ![spell_frost_chainsofice](icons/spell_frost_chainsofice.jpg)                             | Freezing Trap                    | `supported`           |
| hunter     | ![spell_fire_flameshock](icons/spell_fire_flameshock.jpg)                                 | Immolation Trap                  | `supported`           |
| hunter     | ![spell_frost_freezingbreath](icons/spell_frost_freezingbreath.jpg)                       | Frost Trap                       | `supported`           |
| hunter     | ![inv_spear_02](icons/inv_spear_02.jpg)                                                   | Wyvern Sting                     | `supported`           |
| hunter     | ![ability_hunter_aimedshot](icons/ability_hunter_aimedshot.jpg)                           | Viper Sting                      | `supported`           |
| hunter     | ![ability_golemstormbolt](icons/ability_golemstormbolt.jpg)                               | Scatter Shot                     | `supported`           |
| hunter     | ![spell_fire_flare](icons/spell_fire_flare.jpg)                                           | Flare                            | `supported`           |
| hunter     | ![ability_druid_cower](icons/ability_druid_cower.jpg)                                     | Scare Beast                      | `supported`           |
| hunter     | ![ability_devour](icons/ability_devour.jpg)                                               | Intimidation                     | `supported`           |
| hunter     | ![ability_druid_ferociousbite](icons/ability_druid_ferociousbite.jpg)                     | Bestial Wrath                    | `supported`           |
| hunter     | ![ability_rogue_feigndeath](icons/ability_rogue_feigndeath.jpg)                           | Feign Death                      | `not supported`       |
| warlock    | ![spell_shadow_possession](icons/spell_shadow_possession.jpg)                             | Fear                             | `supported`           |
| warlock    | ![spell_nature_removecurse](icons/spell_nature_removecurse.jpg)                           | Fel Domination                   | `supported`           |
| warlock    | ![spell_shadow_scourgebuild](icons/spell_shadow_scourgebuild.jpg)                         | Shadowburn                       | `supported`           |
| warlock    | ![spell_shadow_antishadow](icons/spell_shadow_antishadow.jpg)                             | Shadow Ward                      | `supported`           |
| warlock    | ![spell_shadow_deathscream](icons/spell_shadow_deathscream.jpg)                           | Howl of Terror                   | `supported`           |
| warlock    | ![inv_misc_gem_sapphire_01](icons/inv_misc_gem_sapphire_01.jpg)                           | Spellstone                       | `supported`           |
| warlock    | ![inv_misc_gem_sapphire_01](icons/inv_misc_gem_sapphire_01.jpg)                           | Greater Spellstone               | `supported`           |
| warlock    | ![inv_misc_gem_sapphire_01](icons/inv_misc_gem_sapphire_01.jpg)                           | Major Spellstone                 | `supported`           |
| warlock    | ![spell_shadow_deathcoil](icons/spell_shadow_deathcoil.jpg)                               | Death Coil                       | `supported`           |
| warlock    | ![spell_shadow_contagion](icons/spell_shadow_contagion.jpg)                               | Amplify Curse                    | `supported`           |
| warlock    | ![inv_stone_04](icons/inv_stone_04.jpg)                                                   | Minor Healthstone                | `supported`           |
| warlock    | ![inv_stone_04](icons/inv_stone_04.jpg)                                                   | Lesser Healthstone               | `supported`           |
| warlock    | ![inv_stone_04](icons/inv_stone_04.jpg)                                                   | Healthstone                      | `supported`           |
| warlock    | ![inv_stone_04](icons/inv_stone_04.jpg)                                                   | Greater Healthstone              | `supported`           |
| warlock    | ![inv_stone_04](icons/inv_stone_04.jpg)                                                   | Major Healthstone                | `supported`           |
| warlock    | ![spell_shadow_grimward](icons/spell_shadow_grimward.jpg)                                 | Curse of Exhaustion              | `supported`           |
| warlock    | ![spell_shadow_curseoftounges](icons/spell_shadow_curseoftounges.jpg)                     | Curse of Tongues                 | `supported`           |
| warlock    | ![spell_shadow_soulgem](icons/spell_shadow_soulgem.jpg)                                   | Soulstone Resurrection           | `supported`           |
| warlock    | ![spell_shadow_mindrot](icons/spell_shadow_mindrot.jpg)                                   | Spell Lock                       | `supported`           |
| warlock    | ![spell_shadow_gathershadows](icons/spell_shadow_gathershadows.jpg)                       | Soul Link                        | `supported`           |
| warlock    | ![spell_shadow_mindsteal](icons/spell_shadow_mindsteal.jpg)                               | Seduction                        | `supported`           |
| paladin    | ![spell_holy_devotionaura](icons/spell_holy_devotionaura.jpg)                             | Devotion Aura                    | `supported`           |
| paladin    | ![spell_holy_auraoflight](icons/spell_holy_auraoflight.jpg)                               | Retribution Aura                 | `supported`           |
| paladin    | ![spell_holy_mindsooth](icons/spell_holy_mindsooth.jpg)                                   | Concentration Aura               | `supported`           |
| paladin    | ![spell_shadow_sealofkings](icons/spell_shadow_sealofkings.jpg)                           | Shadow Resistance Aura           | `supported`           |
| paladin    | ![spell_frost_wizardmark](icons/spell_frost_wizardmark.jpg)                               | Frost Resistance Aura            | `supported`           |
| paladin    | ![spell_fire_sealoffire](icons/spell_fire_sealoffire.jpg)                                 | Fire Resistance Aura             | `supported`           |
| paladin    | ![ability_thunderclap](icons/ability_thunderclap.jpg)                                     | Hammer of Wrath                  | `supported`           |
| paladin    | ![spell_holy_sealofprotection](icons/spell_holy_sealofprotection.jpg)                     | Blessing of Protection           | `supported`           |
| paladin    | ![spell_holy_sealofvalor](icons/spell_holy_sealofvalor.jpg)                               | Blessing of Freedom              | `supported`           |
| paladin    | ![spell_holy_sealofsacrifice](icons/spell_holy_sealofsacrifice.jpg)                       | Blessing of Sacrifice            | `supported`           |
| paladin    | ![spell_holy_sealofmight](icons/spell_holy_sealofmight.jpg)                               | Hammer of Justice                | `supported`           |
| paladin    | ![spell_holy_prayerofhealing](icons/spell_holy_prayerofhealing.jpg)                       | Repentance                       | `supported`           |
| paladin    | ![spell_holy_layonhands](icons/spell_holy_layonhands.jpg)                                 | Lay on Hands                     | `supported`           |
| paladin    | ![spell_holy_divineintervention](icons/spell_holy_divineintervention.jpg)                 | Divine Shield                    | `supported`           |
| paladin    | ![spell_holy_heal](icons/spell_holy_heal.jpg)                                             | Divine Favor                     | `supported`           |
| paladin    | ![spell_holy_removecurse](icons/spell_holy_removecurse.jpg)                               | Forbearance                      | `supported`           |
| druid      | ![spell_nature_stoneclawtotem](icons/spell_nature_stoneclawtotem.jpg)                     | Barkskin                         | `supported`           |
| druid      | ![spell_nature_natureswrath](icons/spell_nature_natureswrath.jpg)                         | Nature's Grasp                   | `supported`           |
| druid      | ![ability_druid_bash](icons/ability_druid_bash.jpg)                                       | Bash                             | `supported`           |
| druid      | ![ability_hunter_pet_bear](icons/ability_hunter_pet_bear.jpg)                             | Feral Charge                     | `supported`           |
| druid      | ![ability_bullrush](icons/ability_bullrush.jpg)                                           | Frenzied Regeneration            | `supported`           |
| druid      | ![spell_nature_nullifypoison_02](icons/spell_nature_nullifypoison_02.jpg)                 | Abolish Poison                   | `supported`           |
| druid      | ![spell_nature_lightning](icons/spell_nature_lightning.jpg)                               | Innervate                        | `supported`           |
| druid      | ![spell_nature_ravenform](icons/spell_nature_ravenform.jpg)                               | Nature's Swiftness               | `supported`           |
| druid      | ![spell_nature_faeriefire](icons/spell_nature_faeriefire.jpg)                             | Farie Fire                       | `supported`           |
| shaman     | ![spell_nature_wispheal](icons/spell_nature_wispheal.jpg)                                 | Elemental Mastery                | `supported`           |
| shaman     | ![spell_nature_ravenform](icons/spell_nature_ravenform.jpg)                               | Nature's Swiftness               | `supported`           |
| shaman     | ![spell_nature_tremortotem](icons/spell_nature_tremortotem.jpg)                           | Tremor Totem                     | `supported`           |
| shaman     | ![spell_nature_poisoncleansingtotem](icons/spell_nature_poisoncleansingtotem.jpg)         | Poison Cleansing Totem           | `supported`           |
| shaman     | ![spell_nature_groundingtotem](icons/spell_nature_groundingtotem.jpg)                     | Grounding Totem                  | `supported`           |
| shaman     | ![spell_fireresistancetotem_01](icons/spell_fireresistancetotem_01.jpg)                   | Fire Resistance Totem            | `supported`           |
| shaman     | ![spell_nature_guardianward](icons/spell_nature_guardianward.jpg)                         | Flametongue Totem                | `supported`           |
| shaman     | ![spell_nature_invisibilitytotem](icons/spell_nature_invisibilitytotem.jpg)               | Grace of Air Totem               | `supported`           |
| shaman     | ![spell_nature_natureresistancetotem](icons/spell_nature_natureresistancetotem.jpg)       | Nature Resistance Totem          | `supported`           |
| shaman     | ![spell_nature_stoneskintotem](icons/spell_nature_stoneskintotem.jpg)                     | Stoneskin Totem                  | `supported`           |
| shaman     | ![spell_nature_earthbindtotem](icons/spell_nature_earthbindtotem.jpg)                     | Strength of Earth Totem          | `supported`           |
| shaman     | ![spell_nature_windfury](icons/spell_nature_windfury.jpg)                                 | Windfury Totem                   | `supported`           |
| shaman     | ![spell_nature_earthbind](icons/spell_nature_earthbind.jpg)                               | Windwall Totem                   | `supported`           |
| shaman     | ![spell_nature_strengthofearthtotem02](icons/spell_nature_strengthofearthtotem02.jpg)     | Earthbind Totem                  | `supported`           |
| shaman     | ![spell_fire_sealoffire](icons/spell_fire_sealoffire.jpg)                                 | Fire Nova Totem                  | `supported`           |
| shaman     | ![spell_fire_selfdestruct](icons/spell_fire_selfdestruct.jpg)                             | Magma Totem                      | `supported`           |
| shaman     | ![spell_fire_searingtotem](icons/spell_fire_searingtotem.jpg)                             | Searing Totem                    | `supported`           |
| shaman     | ![spell_nature_stoneclawtotem](icons/spell_nature_stoneclawtotem.jpg)                     | Stoneclaw Totem                  | `supported`           |
| shaman     | ![spell_frostresistancetotem_01](icons/spell_frostresistancetotem_01.jpg)                 | Frost Resistance Totem           | `supported`           |
| shaman     | ![inv_spear_04](icons/inv_spear_04.jpg)                                                   | Healing Stream Totem             | `supported`           |
| shaman     | ![spell_nature_diseasecleansingtotem](icons/spell_nature_diseasecleansingtotem.jpg)       | Disease Cleansing Totem          | `supported`           |
| shaman     | ![spell_nature_manaregentotem](icons/spell_nature_manaregentotem.jpg)                     | Mana Spring Totem                | `supported`           |
| shaman     | ![spell_frost_summonwaterelemental](icons/spell_frost_summonwaterelemental.jpg)           | Mana Tide Totem                  | `supported`           |
| shaman     | ![spell_nature_brilliance](icons/spell_nature_brilliance.jpg)                             | Tranquil Air Totem               | `supported`           |
| racials    | ![spell_nature_sleep](icons/spell_nature_sleep.jpg)                                       | Perception                       | `supported`           |
| racials    | ![spell_shadow_raisedead](icons/spell_shadow_raisedead.jpg)                               | Will of the Forsaken             | `supported`           |
| racials    | ![spell_shadow_unholystrength](icons/spell_shadow_unholystrength.jpg)                     | Stoneform                        | `supported`           |
| racials    | ![ability_rogue_trip](icons/ability_rogue_trip.jpg)                                       | Escape Artist                    | `supported`           |
| racials    | ![ability_warstomp](icons/ability_warstomp.jpg)                                           | War Stomp                        | `supported`           |
| racials    | ![racial_troll_berserk](icons/racial_troll_berserk.jpg)                                   | Berserking                       | `supported`           |
| racials    | ![ability_ambush](icons/ability_ambush.jpg)                                               | Shadowmeld                       | `supported`           |
| items      | ![inv_misc_armorkit_04](icons/inv_misc_armorkit_04.jpg)                                   | Arena Grand Master               | `supported`           |
| items      | ![inv_jewelry_necklace_13](icons/inv_jewelry_necklace_13.jpg)                             | Zandalarian Hero Badge           | `supported`           |
| items      | ![inv_shield_23](icons/inv_shield_23.jpg)                                                 | The Burrower's Shell             | `supported`           |
| items      | ![inv_misc_stonetablet_11](icons/inv_misc_stonetablet_11.jpg)                             | Ephemeral Power                  | `supported`           |
| items      | ![inv_trinket_naxxramas06](icons/inv_trinket_naxxramas06.jpg)                             | Essence of Sapphiron             | `supported`           |
| items      | ![inv_misc_enggizmos_04](icons/inv_misc_enggizmos_04.jpg)                                 | Fire Reflector                   | `supported`           |
| items      | ![inv_misc_bone_elfskull_01](icons/inv_misc_bone_elfskull_01.jpg)                         | Skull of Impending Doom          | `supported`           |
| items      | ![inv_misc_enggizmos_02](icons/inv_misc_enggizmos_02.jpg)                                 | Frost Reflector                  | `supported`           |
| items      | ![inv_misc_gem_pearl_05](icons/inv_misc_gem_pearl_05.jpg)                                 | Gift of Life                     | `supported`           |
| items      | ![inv_belt_25](icons/inv_belt_25.jpg)                                                     | Spider Belt                      | `supported`           |
| items      | ![spell_nature_wispheal](icons/spell_nature_wispheal.jpg)                                 | Mind Quickening                  | `supported`           |
| items      | ![inv_helmet_49](icons/inv_helmet_49.jpg)                                                 | Goblin Rocket Helmet             | `supported`           |
| items      | ![inv_jewelry_necklace_13](icons/inv_jewelry_necklace_13.jpg)                             | Zandalarian Hero Medallion       | `supported`           |
| items      | ![inv_boots_02](icons/inv_boots_02.jpg)                                                   | Gnomish Rocket Boots             | `supported`           |
| items      | ![inv_gizmo_rocketboot_01](icons/inv_gizmo_rocketboot_01.jpg)                             | Goblin Rocket Boots              | `supported`           |
| items      | ![inv_misc_enggizmos_16](icons/inv_misc_enggizmos_16.jpg)                                 | Shadow Reflector                 | `supported`           |
| items      | ![inv_trinket_naxxramas03](icons/inv_trinket_naxxramas03.jpg)                             | Slayer's Crest                   | `supported`           |
| items      | ![inv_jewelry_necklace_13](icons/inv_jewelry_necklace_13.jpg)                             | Zandalarian Hero Charm           | `supported`           |
| items      | ![inv_misc_idol_03](icons/inv_misc_idol_03.jpg)                                           | Venomous Totem                   | `supported`           |
| items      | ![inv_misc_rune_01](icons/inv_misc_rune_01.jpg)                                           | Tidal Charm                      | `supported`           |
| items      | ![spell_nature_abolishmagic](icons/spell_nature_abolishmagic.jpg)                         | Earthstrike                      | `supported`           |
| items      | ![ability_ensnare](icons/ability_ensnare.jpg)                                             | Net-o-Matic                      | `supported`           |
| items      | ![inv_helmet_49](icons/inv_helmet_49.jpg)                                                 | Gnomish Mind Control Cap         | `supported`           |
| misc       | ![inv_drink_milk_05](icons/inv_drink_milk_05.jpg)                                         | Thistle Tea                      | `supported`           |
| misc       | ![inv_potion_01](icons/inv_potion_01.jpg)                                                 | Restorative Potion               | `supported`           |
| misc       | ![inv_misc_bandage_12](icons/inv_misc_bandage_12.jpg)                                     | First Aid                        | `supported`           |
| misc       | ![inv_potion_62](icons/inv_potion_62.jpg)                                                 | Limited Invulnerability Potion   | `supported`           |
| misc       | ![inv_potion_04](icons/inv_potion_04.jpg)                                                 | Free Action Potion               | `supported`           |
| misc       | ![inv_misc_bomb_08](icons/inv_misc_bomb_08.jpg)                                           | Thorium Grenade                  | `supported`           |
| misc       | ![inv_misc_bomb_08](icons/inv_misc_bomb_08.jpg)                                           | Iron Grenade                     | `supported`           |
| misc       | ![inv_potion_23](icons/inv_potion_23.jpg)                                                 | Greater Shadow Protection Potion | `supported`           |
| misc       | ![inv_potion_20](icons/inv_potion_20.jpg)                                                 | Greater Frost Protection Potion  | `supported`           |
| misc       | ![inv_potion_24](icons/inv_potion_24.jpg)                                                 | Greater Fire Protection Potion   | `supported`           |
| misc       | ![inv_potion_22](icons/inv_potion_22.jpg)                                                 | Greater Nature Protection Potion | `supported`           |
| misc       | ![inv_potion_83](icons/inv_potion_83.jpg)                                                 | Greater Arcane Protection Potion | `supported`           |
