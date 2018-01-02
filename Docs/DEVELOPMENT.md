# Development

## Spellmaps

### SpellMap

Spelltemplate:

["category"] = {
  ["spellname"] = {
    ["name"] = "",
    ["soundFileName"] = "",
    ["spellID"] = ,
    ["spellIcon"] = "",
    ["hasFade"] = ,
    ["active"] =
  },

For a full explanation of the fields see `PVPW_SpellMap.lua`

### SpellAvoidMap

The SpellAvoidMap contains spells that can be avoided by either the player itself
or and enemy.


For a full explanation of the fields see `PVPW_SpellAvoidMap.lua`

## Adding new spells

Adding a new spell that is not out of the ordinary and can already be detected by the addon
can be achieved with the following steps.

A new spell requires at least one new sound file that needs to be categorized in one of the available categories. Depending on whether the new spell is a `enemy_avoid` or `self_avoid` or a normal `spell` it has to be placed in the correct folder.

normal_spell:

`Assets\Sounds\[Category]\[spellname].mp3`

normal_spell_down:

`Assets\Sounds\[Category]\[spellname]_down.mp3`

enemy_avoid:

`Assets\Sounds\[Category]\enemy_avoid\enemy_avoided_[spellname].mp3`

self_avoid:

`Assets\Sounds\[Category]\enemy_avoid\you_avoided_[spellname].mp3`
