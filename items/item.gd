class_name Item
extends RefCounted


var data: ItemData
var attributes: Array[ItemAttribute]


func _init(p_data: ItemData) -> void:
	data = p_data
	attributes = p_data.inherent_attributes.duplicate()

## Adds an attribute to the item's list of attributes.
## Returns whether or not the item already had said
## attribute.
func add_attribute(attribute: ItemAttribute) -> bool:
	if attribute in attributes:
		return true
	else:
		attributes.append(attribute)
		return false

## Removes an attribute from the item's list of attributes.
## Inherent attributes can never be removed. Returns whether
## or not the item had said attribute before removal.
func remove_attribute(attribute: ItemAttribute) -> bool:
	if attribute in data.inherent_attributes:
		return true
	else:
		var was_contained = attribute in attributes
		attributes.erase(attribute)
		return was_contained
