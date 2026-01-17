extends Node3D

@export var target: Node3D;
@export var speed = 0.5;

@onready var local_global_position = Vector3(position)

func _process(delta: float) -> void:
	local_global_position = lerp(local_global_position, target.global_position - get_parent().global_position, speed * delta)
	global_position = get_parent().global_position + local_global_position
