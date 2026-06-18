class_name Item
extends RefCounted


var data: ItemData
var attributes: Array[ItemAttribute]


func _init(p_data: ItemData) -> void:
	data = p_data
	attributes = p_data.inherent_attributes.duplicate()


## Adds an attribute to the item's list of attributes.
## Returns whether or not the attribute could be added.
## There are no duplicate attributes, and some attributes
## are incompatible with each other.
func add_attribute(attribute: ItemAttribute) -> bool:
	for other in attributes:
		if (attribute == other
				or attribute in other.incompatible_with
				or other in attribute.incompatible_with):
			return false
	
	attributes.append(attribute)
	return true


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


## Removes an the first attribute with the given name from
## the item's list of attributes. Inherent attributes can
## never be removed. Returns whether or not the item had
## said attribute before removal.
func remove_attribute_by_name(name: StringName) -> bool:
	for i in range(0, attributes.size()):
		if attributes[i].name == name:
			attributes.remove_at(i)
			return true
	return false
