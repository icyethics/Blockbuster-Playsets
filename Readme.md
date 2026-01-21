## Blockbuster: Playsets

Blockbuster is a series of API mods that offer features from the Balatro Goes Kino mod as stand-alone packages. They're set up to support other mods' use of these features without needing to also interact with Balatro Goes Kino's themes and playable content. 

Blockbuster Mods:
- Balatro Goes Kino (Source Content mod)
- [Blockbuster: Counters](https://github.com/icyethics/Blockbuster-Counters)
- [Blockbuster: Spellcasting](https://github.com/icyethics/Blockbuster-Spellcasting)
- [Blockbuster: Value Manipulation](https://github.com/icyethics/Blockbuster-ValueManipulation)
- Blockbuster: Playsets (This Mod)

!! IMPORTANT: This mod is currently a Work in Progress and not intended for player-use. The repository is shared for purposes of feedback and improvement. !!

Blockbuster: Playsets is an API mod that adds the ability to create and share custom content packages and rulesets for your mods and modpacks, and share those with other players.

Intended Mechanics:
- During the new run set up, when a player selects a deck and stake, they will also be able to select a Playset. Playsets contain a set of inclusion and exclusion rules for all objects that can naturally spawn in the game, such as jokers, consumables, boss blinds and tags. It is set up to also allow new object types a mod may add to be possible to add. The rules only bar natural spawn conditions, so forced spawn conditions will still allow content to show up. If a Joker exists with an effect that reads 'when a blind is selected, create a Pluto', but Pluto itself is banned, Pluto can still be created by the joker. 
- Rulesets are associated objects that can be included in a Playset. They contain a calculate function and various starting parameters, allowing you to enable and disable custom rules to improve a playsets experience. Examples of these rules are ante scaling, card area size, shop pricing, etc., but should also allow for fully custom rules to be implemented. 
- Content Packages are pre-constructed sub-packages of content, to allow playsets to be modular, and as a tool for the procedural playset generation. Content Packages pre-package content based on mechanical use or theme, so that it can be included or excluded all at once, rather than needing to be done on a per joker basis. This is intended to make it easier to share playset configurations, but also to allow content packages of associated and dependant content to be made, so it can be in- or excluded as a whole. Example: When removing Stone Cards as an enhancement from a Playset, a content package focused on Stone Cards that includes Marble Joker, Stone Joker, The Tower, and the stone card enhancement can be excluded instead. This ensures there is no situation in which a joker that is dependant on other content to function is included without its associated suite of content.
- In-Game Playset and Content Package creator tools will be included to let non-mod developers make their own playsets with ease, rather than needing to use a code editor and add keys manually.
- Playsets and Content Packages should be shareable by being converted into standardized format files that can be loaded in game. Ideally, a way to copy and paste a string without needing to go to your mods folder at all will also exist.