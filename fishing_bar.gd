class_name FishingBar
extends Node2D


@onready var progress_bar := $ProgressBar

var hooked_item: Item

signal catch(item: Item)
signal loss


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.reached_full.connect(_on_catch)
	progress_bar.reached_empty.connect(_on_loss)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_catch():
	catch.emit(hooked_item)


func _on_loss():
	loss.emit()
