extends Node2D

const DEFAULT_INTERP_WEIGHT = 0.1
const VECT_DEFAULT_INTERP_WEIGHT = Vector2(DEFAULT_INTERP_WEIGHT, 0.0)
const REACHED_THRESHOLD = 0.05

@onready var animation_player = $AnimationPlayer
@onready var gpu_particles_2d = $GPUParticles2D
@onready var transition_player = $TransitionPlayer
@onready var save_confirmation_main_menu = $SaveConfirmationMainMenu

@export_range(0.0, 0.9999) var depth := 0.0

var random = RandomNumberGenerator.new()
var target_depth := 0.5
var interp_weight := DEFAULT_INTERP_WEIGHT

func _ready():
	random.randomize()
	animation_player.current_animation = "logo_color_change"
	find_new_location()
	var fish_to_find = "MrE"
	var test_fish = load(FishData.PATHS[fish_to_find]).instantiate()
	print(test_fish.cost)


func _process(delta):
	# because godot doesn't have a lerp function for 1D floats...make it a vector~!
	var vect_depth: Vector2 = Vector2(depth, 0.0)
	var vect_target_depth: Vector2 = Vector2(target_depth, 0.0)
	vect_depth = vect_depth.lerp(vect_target_depth, interp_weight * delta)
	
	depth = vect_depth.x
	
	animation_player.seek(depth, true)
	
	# Finds new target depth when the animation has gotten close enough to its current target.
	if abs(depth - target_depth) < REACHED_THRESHOLD:
		find_new_location()
	
	# By pressing space, the "camera" will jump to a new place smoothly.
	var vect_interp_weight = Vector2(interp_weight, 0.0)
	vect_interp_weight = vect_interp_weight.lerp(VECT_DEFAULT_INTERP_WEIGHT, 10 * delta)
	interp_weight = vect_interp_weight.x


func _unhandled_input(event):
	if event.is_action_released("main_menu_jump"):
		find_new_location()
		interp_weight = 4.0


func find_new_location():
	target_depth = randf()


func _on_exit_button_pressed():
	get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func _on_language_button_pressed():
	transition_player.play("fade_language_selection_transition")


func _on_options_button_pressed():
	transition_player.play("fade_settings_transition")


func _on_back_button_pressed():
	var current_transition = transition_player.assigned_animation
	transition_player.play_backwards(current_transition)


func _on_play_button_pressed():
	save_confirmation_main_menu.show()
	transition_player.play("fade_save_confirmation_transition")


func _on_cancel_button_pressed():
	
	# So that check_save_and_updates() does not occur twice
	transition_player.advance(1.0) 
	transition_player.play_backwards("fade_save_confirmation_transition")
	
