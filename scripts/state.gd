# Represents the Game's state.
# Does things like the night system, managing and orchestrating other objects.
extends Node
class_name State

var NIGHTLY_AMMO_COUNT = 3;

var total_nights: int;
var night_timer: Timer;
var gun: Gun;

var monster_killed = false

func _ready():

	night_timer.timeout.connect(end_night)
	start_night()

func start_night():
	pass # TODO

func end_night():

	await do_night_transistion()

	reset_game()
	total_nights += 1

	start_night()

func do_night_transistion():
	print("Night Transistion")

func reset_player():

	Game.respawn_player()
	gun.set_ammo(NIGHTLY_AMMO_COUNT)
	# Ensure the player has gun TODO
	if not Game.get_player().has_item(gun):
		Game.get_player().add_item(gun)

func reset_game():

	Game.respawn_monster()

	if not monster_killed:
		Game.get_monster().increase_agressivness()
	else:
		Game.get_monster().set_agressivness(0)

	if is_luna_alive():
		Game.respawn_luna()

	reset_animals()

	monster_killed = false
