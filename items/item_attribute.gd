class_name ItemAttribute
extends Resource


## The name of the attribute
@export var name: StringName
## Some short and sweet text to add flare to the attribute
@export var flavor: String
## A longer description of the effects of this attribute
@export var desc: String
## This will show up in the player's inventory so they can
## see what attributes an item has at a glance
@export var icon: Texture2D
## How much does this attribute change the affected item's
## monetary value?
@export var value_multiplier: float = 1
## The relative probability that this attribute will adorn
## a caught item
@export var rarity: float = 1
## An item cannot have this attribute and any of the
## attributes on this list
@export var incompatible_with: Array[ItemAttribute]
