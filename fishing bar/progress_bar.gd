extends NinePatchRect


@export var bar_height: float
@export var bar_area: Area2D
@export var progress_speed: float

var _touching_target := false

var progress: float = 0.2:
	set(new_progress):
		if new_progress >= 1:
			reached_full.emit()
		elif new_progress <= 0:
			reached_empty.emit()
		progress = clampf(new_progress, 0, 1)
		size.y = roundf(bar_height * progress)

signal reached_full
signal reached_empty


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bar_area.body_entered.connect(on_enter)
	bar_area.body_exited.connect(on_exit)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _touching_target:
		progress += delta * progress_speed
	else:
		progress -= delta * progress_speed


func on_enter(other: Node) -> void:
	if other.name == &"TargetRigidBody2D":
		_touching_target = true


func on_exit(other: Node) -> void:
	if other.name == &"TargetRigidBody2D":
		_touching_target = false
