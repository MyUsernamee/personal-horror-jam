extends Area3D
class_name LevelLoader

@export var level: PackedScene;

func _ready():
	collision_mask = 128 # Bit 7 Player layer
	body_entered.connect(load_level)

func load_level(_body):
	# TODO: Maybe check to make sure the body is actually the Player
	Game.load_scene(level, global_position)
