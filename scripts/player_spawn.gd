extends Marker3D
class_name PlayerSpawn

func _ready():
	Game.set_player_spawn(global_position)
