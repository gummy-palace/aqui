extends Control

@onready var tab_bar = $TabBar

func _ready():
	tab_bar.set_tab_title(0, tr("K_MAIN_MENU_SETTINGS_HEADER"))

