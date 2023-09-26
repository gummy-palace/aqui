@icon("res://classes/fish2d/Fish2D.svg")
extends CharacterBody2D
class_name Fish2D
## A standard fish object for swimming.
##
## This standard fish object has options for [i]all[/i] fish movement types.
## It is to be implemented and extended onto specific fish classes.


## These are the key Fish2D movement patterns.
enum MovementPattern {
	SIDE_SWIMMER, ## The detault pattern
	FLOATER, ## Fully free-floating.
	STATIC, ## Does not move.
	JUMPER, ## Jellyfish-like movement
	SIDE_JUMPER, ## Squid-like movement
	ERRATIC, ## Fully random movement.
	ATTATCHING, ## Follows the movement of another fish perfectly.
}

@export_range(0,9223372036854775807) var id : int
@export_range(0,9223372036854775807) var variant : int
@export var fish_name : String
@export var fish_localized_name : String
@export var cost : int
@export_group("Tanks")

@export var tank_compat_bools = {
	"Open Ocean Surface": false,
	"Open Ocean Reef": false,
	"Open Ocean Depths": false,
	"Open Ocean Abyss": false,
	"Open Ocean Floor": false,
}

@export var special_tags = {
	
}
