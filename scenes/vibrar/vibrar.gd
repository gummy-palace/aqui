extends Control

@export var weak_force: float
@export var strong_force: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_joy_button_pressed(1, JOY_BUTTON_Y):
		_on_button_button_down()
	if Input.is_action_just_released("ui_select"):
		_on_button_button_up()


func _on_button_button_down():
	Input.start_joy_vibration(1,weak_force,strong_force,0)


func _on_button_button_up():
	Input.stop_joy_vibration(1)


func _on_h_slider_2_drag_ended(value_changed):
	strong_force = value_changed


func _on_h_slider_drag_ended(value_changed):
	weak_force = value_changed
