extends Node

# in other gd script can cast some to to Stats by the class_name
class_name Stats

# the Stas have the health stats
export var max_hp := 10
export var hp := 10

signal hp_zero_signal

func _ready():
	pass

func take_hit(damage):
	hp -= damage;
	if hp <= 0:
		emit_no_hp()

func emit_no_hp() :
	emit_signal("hp_zero_signal")
