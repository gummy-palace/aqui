extends Control

@onready var tab_bar = $TabBar
@onready var rich_text_label = $TabBar/Confirm/Panel/RichTextLabel

enum SaveState {ERROR, NO_SAVE_FOUND, SAVE_FOUND}

func _ready():
	hide()


func check_save_and_update():
	var save_state: SaveState
	save_state = SaveState.SAVE_FOUND
	match save_state:
		SaveState.ERROR:
			tab_bar.set_tab_title(0, tr("K_MAIN_MENU_SAVE_CONFIRMATION_ERROR_HEADER"))
			rich_text_label.text = tr("K_MAIN_MENU_SAVE_CONFIRMATION_ERROR_TEXT")
		
		SaveState.NO_SAVE_FOUND:
			tab_bar.set_tab_title(0, tr("K_MAIN_MENU_SAVE_CONFIRMATION_NO_SAVE_HEADER"))
			rich_text_label.text = tr("K_MAIN_MENU_SAVE_CONFIRMATION_NO_SAVE_TEXT")
		
		SaveState.SAVE_FOUND:
			tab_bar.set_tab_title(0, tr("K_MAIN_MENU_SAVE_CONFIRMATION_SAVE_FOUND_HEADER"))
			rich_text_label.text = tr("K_MAIN_MENU_SAVE_CONFIRMATION_SAVE_FOUND_TEXT")
	show()
