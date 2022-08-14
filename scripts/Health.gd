extends Spatial

# same with stats hp zero signal
signal health_hp_zero_signal

var hp = 0;

func _ready():
	hp = $Stats.hp;

func _physics_process(delta):
	if (hp != $Stats.hp) :
		hp = $Stats.hp
		# change bill board
		var percent = hp * 1.0 / $Stats.max_hp
		change_health_billboard(percent)

# change scale to show health
func change_health_billboard(percent):
	$Billboard.scale = Vector3(percent, 1, 1)

func _on_Stats_hp_zero_signal():
	emit_signal("health_hp_zero_signal")
