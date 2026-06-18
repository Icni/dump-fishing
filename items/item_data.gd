class_name ItemData
extends Resource


## Name of the item
@export var name: StringName
## A description of the item, if the player wants to know
## what it's all about.
@export var desc: String
## What the item will look like in the player's inventory.
@export var texture: Texture2D
## This item will always have these attributes
@export var inherent_attributes: Array[ItemAttribute]
## The base for calculating how much money the item is worth.
## This does NOT include change from inherent attributes.
@export var base_value: float
