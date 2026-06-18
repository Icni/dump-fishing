extends RigidBody2D


@export var bar_speed: float = 2500


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("reel"):
		apply_force(Vector2(0, -bar_speed))
	else:
		apply_force(Vector2())
