extends QuakeMover
class_name Animal

var behavior: AnimalDescriptor;
var model: AnimalModel;

var chatter_sound: AudioStream;
var death_sound: AudioStream;
var scare_sound: AudioStream;

var state: AnimalState;

enum AnimalState {
	WANDER,
	SCARED,
	INTERESTED,
}

# Represents a singular animal. Must implement non implemented methods base class.
enum ScareReason { 
	DOG, 
	POKE, 
	DEATH, # Death of another animal nearby 
	MONSTER_TRANSFORM # Animal was near when the monster transformed.
}

signal on_scare(reason: ScareReason)
signal on_kill()
signal on_shown_food(food_item: Item)

func get_chatter_sound() -> AudioStream:
	return 
func get_death_sound():
	pass

# TODO: Figure out nice way to represent animal behavior.
# I was thinking a set of changable parameters, or a abstract
