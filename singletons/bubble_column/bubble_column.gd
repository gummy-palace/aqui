extends Control

@onready var line_edit = $LineEdit
@onready var open_stream_player = $OpenStreamPlayer
@onready var close_stream_player = $CloseStreamPlayer
@onready var success_stream_player = $SuccessStreamPlayer
@onready var error_stream_player = $ErrorStreamPlayer


func _unhandled_input(event):
	if event.is_action_pressed("bubble_column_command"):
		show()
		open_stream_player.play()
		line_edit.text = "/"
		line_edit.call_deferred("grab_focus")
		line_edit.caret_column = 1
		accept_event()
	
	if event.is_action_released("ui_cancel") and visible:
		hide_and_clear()
		close_stream_player.play()
		accept_event()


func _on_line_edit_text_submitted(new_text):
	var split_command = new_text.split(' ')
	
	if split_command.size() > 0:
		match split_command[0]:
			
			"/iamapirate": 
				cmd_piracy()
			"/piracy": 
				cmd_piracy()
			"/imapirate": 
				cmd_piracy()
			"/ididnotbuythisgame": 
				cmd_piracy()
			"/dmca": 
				cmd_piracy()
			"/reportme": 
				cmd_piracy()
			"/illegal": 
				cmd_piracy()
			"/arrestme": 
				cmd_piracy()
			"/tellmeaboutpiracy":
				cmd_piracy()
			"/ididntbuythisgame":
				cmd_piracy()
			
			"/crash":
				OS.crash("UH OH")
			
			"/mainmenu":
				cmd_main_menu()
			
			"/tumadre":
				OS.call_deferred("alert", "es un pupitre", "Tu madre")
			
			_:
				error_stream_player.play()
	else:
		error_stream_player.play()
	
	hide_and_clear()


func hide_and_clear():
	hide()
	line_edit.text = ""

# Changes the scene immediately to the Piracy Screen, without saving or transitioning.
func cmd_piracy():
	success_stream_player.play()
	get_tree().change_scene_to_file("res://scenes/piracy_screen/piracy_screen.tscn")
	
# Changes the scene immediately to the Main Menu Screen, without saving or transitioning.
func cmd_main_menu():
	success_stream_player.play()
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
