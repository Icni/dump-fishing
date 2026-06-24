extends Node


@export var fishing_bar_scene: PackedScene
@export var item_collection: ItemCollection

@onready var click_area: Area2D = $ClickArea
@onready var catch_animation: AnimatedSprite2D = $CatchAnimation

var _fishing_bar
var _is_fishing := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	click_area.input_event.connect(_area_clicked)
	catch_animation.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _area_clicked(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.is_pressed() and not _is_fishing:
		if _fishing_bar != null:
			remove_child(_fishing_bar)
		_fishing_bar = fishing_bar_scene.instantiate()
		_is_fishing = true
		add_child(_fishing_bar)
		move_child(_fishing_bar, 1)
		_fishing_bar.position = Vector2(148, 22)
		
		var item_data = item_collection.get_random_item()
		_fishing_bar.hooked_item = Item.new(item_data)
		
		_fishing_bar.catch.connect(_on_catch)
		_fishing_bar.loss.connect(_on_loss)


func _on_catch(item: Item):
	print("CATCH! :) ", item.data.name)
	catch_animation.visible = true
	catch_animation.play(&"default")
	_fishing_bar.process_mode = PROCESS_MODE_DISABLED
	_is_fishing = false


func _on_loss():
	print("LOSS! :(")
	_fishing_bar.process_mode = PROCESS_MODE_DISABLED
	_is_fishing = false
