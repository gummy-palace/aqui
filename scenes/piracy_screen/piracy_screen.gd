extends Control

@onready var top_label = $TopLabel
@onready var middle_label = $MiddleLabel
@onready var bottom_label = $BottomLabel
@onready var animation_player = $AnimationPlayer

func _ready():
	middle_label.text = '''[center] 

At ''' + Time.get_datetime_string_from_system(false, true) + ''', Aqui detected unauthorized behavior.
Evidence of your infringement, along with your location, has been reported to the respective authorities.
[/center]'''
	
	animation_player.play("tick")

