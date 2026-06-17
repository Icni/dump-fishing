extends RigidBody2D


enum State {
	FIXATING,
	LEAPING,
}

@export var play_area: Rect2
@export var fixation: float
@export var leap: float
@export var speed: float

var _state := State.FIXATING
var _time_in_state: float = 0
var _leap_to: float = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match _state:
		State.FIXATING:
			if randf_range(0, _time_in_state) > fixation:
				_state = State.LEAPING
				_time_in_state = 0
				_leap_to = position.y + randf_range(-leap, leap)
				_leap_to = clampf(_leap_to, play_area.position.y, play_area.end.y)
		State.LEAPING:
			var difference = (position.y - _leap_to) * Vector2.UP
			move_and_collide(speed * delta * difference)
			
			if abs(difference.y) < 0.5 or _time_in_state > 2.0:
				_state = State.FIXATING
				_time_in_state = 0
				
	_time_in_state += delta
