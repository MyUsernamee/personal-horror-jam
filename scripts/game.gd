# More of a global state node. Stores reference to objects
# Which need to referenced by other objects give or take.
extends Node3D

const DEBUG = false;

@onready var world = $/root/World;
@onready var vhs_effect: ShaderMaterial = get_node( "/root/World/%VHS" ).material
@onready var environment: WorldEnvironment = get_node("/root/World/%WorldEnvironment")
@onready var player_spawn: Marker3D = $%PlayerSpawn;


var player: Player;
var animals: Array[Animal];

var tip: Label;
var reverb_effect: AudioEffectReverb;

func get_enviroment():
	return environment

func get_player():
	return player

func respawn_player():
	# TODO: Make nicer.
	player.global_position = player_spawn.global_position;

func set_player(obj):
	player = obj
	tip = player.get_node("Control/Tip")

func set_vhs_intensity(wiggle: float, smear: float):
	vhs_effect.set_shader_parameter("wiggle", wiggle);
	vhs_effect.set_shader_parameter("smear", smear);

func display(text: String):
	tip.text = text

func get_time():
	return Time.get_ticks_msec() / 1000.0
