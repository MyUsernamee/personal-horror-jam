extends Interactable

@export var properties: Dictionary;

func holding_right_item():
	return (not properties.has("item") or properties.get("item") == "") or (Game.get_player().get_selected_item() and properties.get("item") == Game.get_player().get_selected_item().item.id)
	

func _ready() -> void:

	on_interact.connect(_on_interact)
	on_hover.connect(_on_hover);
	stop_hover.connect(_stop_hover)

func _on_hover():
	if not holding_right_item():
		Game.display("Requires " + properties["item_name"])
	else:
		Game.display("Interact to open.")

func _stop_hover():

	Game.display("")

func _on_interact():

	queue_free(); # For now
	Game.display("")

	# # We create a rigidbody at the same spot and delete the interactable
	# var body = RigidBody3D.new()

	# var joint_position = Vector3.ZERO
	# for child in get_children():
	# 	body.add_child(child)

	# var joint = HingeJoint3D.new()

	# joint.node_b = body
