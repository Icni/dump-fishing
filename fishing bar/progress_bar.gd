extends NinePatchRect


@export var bar_height: float
@export var bar_area: Area2D
@export var progress_speed: float

var _colliding := false

var progress: float = 0:
	set(new_progress):
		if new_progress >= 1:
			reached_full.emit()
		progress = clampf(new_progress, 0, 1)
		size.y = roundf(bar_height * progress)

signal reached_full


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bar_area.body_entered.connect(on_enter)
	bar_area.body_exited.connect(on_exit)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _colliding:
		progress += delta * progress_speed
	else:
		progress -= delta * progress_speed


func on_enter(other: Node) -> void:
	_colliding = true


func on_exit(body: Node) -> void:
	_colliding = false
