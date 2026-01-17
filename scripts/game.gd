extends Node3D

const DEBUG = false;

@onready var world = $/root/World;
@onready var vhs_effect: ShaderMaterial = get_node( "/root/World/%VHS" ).material
@onready var environment: WorldEnvironment = get_node("/root/World/%WorldEnvironment")

var player: Player;

var tip: Label;
var reverb_effect: AudioEffectReverb;

func get_player():
	return player

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
