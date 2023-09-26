class_name TestClass
extends Node
## A test class for testing things.
##
## This class has absolutely no purpose other than to see how this all works. Isn't that truly something?




## This is the speed of this node. Are we testing fast or nah?
@export_category("TestClass")
@export_range(0,100)
var speed : int

## Pls describe me
@export var nope : String


## This is a theme to select. Now why would you need to do that? jajaja
@export var theme : Theme

## These are the dieases that [TestClass] may have.
@export_flags("Heart Failure", "Cancer", "Depression", "Foot Fungus") var diseases = 0


@export_enum("Rebecca", "Mary", "Leah") var character_name: String = "Rebecca"



func _consume() -> void:
	pass
