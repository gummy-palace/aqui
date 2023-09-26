extends SubViewport

@export var size_level = 1

@onready var tank_collision_frames = $TankCollisionFrames


func _process(_delta: float) -> void:
	setup_tank()

func setup_tank():
	# Manage the size property to set it to the correct resolution
	# Should only happen during setup_tank()
	var group = "Stage"
	match size_level:
		0: 
			size_2d_override = Vector2(128,72)
			group += "0"
		1: 
			size_2d_override = Vector2(256,144)
			group += "1"
		2: 
			size_2d_override = Vector2(384,216)
			group += "2"
		3: 
			size_2d_override = Vector2(512,288)
			group += "3"
		4: 
			size_2d_override = Vector2(768,432)
			group += "4"
		5: 
			size_2d_override = Vector2(1536,864)
			group += "5"
		_: 
			Printer.send("size_level entered for TankSubViewport not valid. 
			Must be between 0 and 6.")
	
	# Set all border collision frames to disabled.
	var frames = tank_collision_frames.get_children()
	for frame in frames:
		frame.set_deferred("disabled", true)
	
	# Set only the active size group (as determined above) to enabled.
	var group_frames = get_tree().get_nodes_in_group(group)
	for frame in group_frames:
		frame.set_deferred("disabled", false)
