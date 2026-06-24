class_name ItemCollection
extends Resource


@export var all_items: Array[ItemData]
@export var all_attributes: Array[ItemAttribute]

var _total_item_weight = null
var _total_attr_weight = null


func _recalculate_total_weights() -> void:
	var sum: float
	
	sum = 0
	for item in all_items:
		sum += item.rarity
	_total_item_weight = sum
	
	sum = 0
	for attr in all_attributes:
		sum += attr.rarity
	_total_attr_weight = sum


func _get_total_item_weight() -> float:
	if _total_item_weight is not float:
		_recalculate_total_weights()
	
	return _total_item_weight


func _get_total_attr_weight() -> float:
	if _total_attr_weight is not float:
		_recalculate_total_weights()
	
	return _total_attr_weight


## Gets a random item from the collection, weighted by
## relative rarities
func get_random_item() -> ItemData:
	var rand = randf_range(0, _get_total_item_weight())
	var idx = 0
	for item in all_items:
		idx += item.rarity
		if idx >= rand:
			return item
	return null
