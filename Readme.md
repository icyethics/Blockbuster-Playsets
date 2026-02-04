## Blockbuster: Playsets

Blockbuster is a series of API mods that offer features from the Balatro Goes Kino mod as stand-alone packages. They're set up to support other mods' use of these features without needing to also interact with Balatro Goes Kino's themes and playable content. 

Blockbuster Mods:
- Balatro Goes Kino (Source Content mod)
- [Blockbuster: Counters](https://github.com/icyethics/Blockbuster-Counters)
- [Blockbuster: Spellcasting](https://github.com/icyethics/Blockbuster-Spellcasting)
- [Blockbuster: Value Manipulation](https://github.com/icyethics/Blockbuster-ValueManipulation)
- Blockbuster: Playsets (This Mod)

Documentation for usage is added below.

Blockbuster: Playsets is an API mod that adds the ability to create and share custom content packages and rulesets for your mods and modpacks, and share those with other players.

Intended Mechanics:
- During the new run set up, when a player selects a deck and stake, they will also be able to select a Playset. Playsets contain a set of inclusion and exclusion rules for all objects that can naturally spawn in the game, such as jokers, consumables, boss blinds and tags. It is set up to also allow new object types a mod may add to be possible to add. The rules only bar natural spawn conditions, so forced spawn conditions will still allow content to show up. If a Joker exists with an effect that reads 'when a blind is selected, create a Pluto', but Pluto itself is banned, Pluto can still be created by the joker. 
- Rulesets are associated objects that can be included in a Playset. They contain a calculate function and various starting parameters, allowing you to enable and disable custom rules to improve a playsets experience. Examples of these rules are ante scaling, card area size, shop pricing, etc., but should also allow for fully custom rules to be implemented. 
- Content Packages are pre-constructed sub-packages of content, to allow playsets to be modular, and as a tool for the procedural playset generation. Content Packages pre-package content based on mechanical use or theme, so that it can be included or excluded all at once, rather than needing to be done on a per joker basis. This is intended to make it easier to share playset configurations, but also to allow content packages of associated and dependant content to be made, so it can be in- or excluded as a whole. Example: When removing Stone Cards as an enhancement from a Playset, a content package focused on Stone Cards that includes Marble Joker, Stone Joker, The Tower, and the stone card enhancement can be excluded instead. This ensures there is no situation in which a joker that is dependant on other content to function is included without its associated suite of content.
- In-Game Playset and Content Package creator tools will be included to let non-mod developers make their own playsets with ease, rather than needing to use a code editor and add keys manually.
- Playsets and Content Packages should be shareable by being converted into standardized format files that can be loaded in game. Ideally, a way to copy and paste a string without needing to go to your mods folder at all will also exist.

Mod Dependency:
- The current implementation will be dependant on Galdur. Depending on the UI system required, a system may be made that provides a way for the mod to work without Galdur.

# Documentation

The mod add two object types:
- Content Packages
- Playsets

_Content Packages_
```
Blockbuster.Playset.ContentPackage {
    key = "example_content_package",
    name = "ExamplePackage",
    displayImage = 'j_joker',
    types = {
        -- "Aesthetic"
        },
    sets = {
        -- "Joker"
        },
    items = {
        -- Jokers
        j_joker = true -- This is now included
        --
    },
    mods = {
        "Vanilla",
        "mod_id"
    }
}
```
Content Packages are the object type that allows you to group content together. It will then be present in the run-setup menu where players can manually disable or enable all the content in the package, and it will be able to be passed through to Playsets. 

Content Packages can be manually defined, but will also be automatically generated for every mod that is installed. Generated content packages will group each type of content, as well as the total content from a mod into a package. 

A Content Package will contain a list of keys in the items table, set up with a boolean value. To add content to your Content Package, you must add the key to the ``items`` table. 

The ``sets`` table contains a list of strings that match with the set type for items. This sets the scope for the ContentPackage. Only content that matches the included types will be included. If a joker's key is included in the items table, but the ``Joker`` set is not included in the sets table, the joker will not be included.

The ``types`` table is for organizational purposes, and includes a list of strings, each functioning as a tag to specify what defines the grouping for the Content Package. By default, the following types are added, but new types can be added freely:
- Mechanical. For content grouped based on mechanical identity
- Aesthetic. For content grouped based on aesthetic elements
- Balanced. For content grouped for purposes of being used in a balanced experience.
- Broken. For content grouped for purposes of being used in a game-breaking experience. 
- Vanilla-Only. For content groupings that only contains vanilla objects.
- Modded-Only. For content groupings that only contains modded content.

The ``mods`` table includes the sources of content in the Content Package. If a package contains content for a mod that is not currently loaded, it will not be loaded itself.

To set the image used for a content package, you can either set default_image to the key of an existing object, or pass along an atlas and pos.

_Playsets_
```
Blockbuster.Playset.Playset {
    key = "example_playset",
    types = {"Standard"},
    sets = {},
    displayImage = "c_fool",
    packages = {

    },
    mods = {
        "Vanilla",
    }
}
```


Playsets are the object type that contains cards and content packages to set rules 

Playsets contain a list of content packages and a list of sets. The defined list of sets determines the playset's scope. If a set isn't included in a Playset, the playset will not interact with its content. Playsets inherit the sets of the included content packages.

Playsets work based on inclusion. If a set is within a Playset's scope, all content within it will be banned, unless it is included in a Content Package. 

The ``packages`` table is an array of keys for Content Packages, with an associated boolean value. If ``True``, a Content Package will be included within the run. If set to ``False``, it will be banned. While content that is not listed in a content package will be banned by default, it can be good to ban a package in cases of overlapping account. If an object is banned through any Content Package, it will be banned, even if it is set to be included by another Content Package.

_In-Game Usage_

While starting a new run using Galdur, players will their current playset on the right, with all content packages on the left. They can select a preset by cycling through the Playsets, and change the details of their run by clicking on Content Packages to Ban them, Include them, or set them to neutral, which will let the standard Playset choice for it matter.