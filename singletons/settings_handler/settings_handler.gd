extends Object

var settings = {
}

var default_settings_path = "res://data/default_settings.ini"
var settings_path = "user://settings.ini"


func _init():
	var config_file = ConfigFile.new()
	if !FileAccess.file_exists("user://settings.ini"):
		config_file.load("res://data/default_settings.ini")
		config_file.save("user://settings.ini")
	else:
		config_file.load("user://settings.ini")
	var sections = config_file.get_section_keys("Settings")
	for setting in sections:
		var grabbed_setting = config_file.get_value("Settings", setting)
		settings[setting] = grabbed_setting


func change_setting(setting, value):
	set_deferred(setting, value)
	var error
	var config_file = ConfigFile.new()
	error = config_file.load("user://settings.ini")
	config_file.set_value("Settings", setting, value)
	config_file.save("user://settings.ini")
	if error != 0:
		Printer.send("Settings Loading Error: " + error, 2, 3)
