extends Control

@onready var tab_bar = $TabBar

# List of locale codes corresponding in order to the language selection menu.
const LANGUAGE_ARRAY = [
	"en", # 0, English (US)
	"es", # 1, Spanish (Latin America)
	"ja", # 2, Japanese
]


func _ready():
	tab_bar.set_tab_title(0, tr("K_MAIN_MENU_LANGUAGE_SELECTION_HEADER"))



func _on_item_list_item_selected(index):
	TranslationServer.set_locale(LANGUAGE_ARRAY[index])
	Printer.send("Language changed to " + LANGUAGE_ARRAY[index] + ".", Printer.MED, Printer.OK)
	get_tree().reload_current_scene()
