extends Area

var Consts = preload("res://scripts/Consts.gd")

# bullet properties
export var speed := 1
export var direction := Vector3(1,0,1)
export var damage := 1

func _ready():
	$Timer.start()

func _physics_process(delta):
	translation += direction * speed * delta

func _on_Timer_timeout():
	# only alive for a while
	queue_free()


func _on_Bullet_body_entered(body : Node):
	# if bullet hit some one, free the bullit
	print ("bullet hit ", body.name)
	if (body.has_node(Consts.HEALTH_NAME)):
		var stats : Stats = body.find_node(Consts.HEALTH_STAT_NAME) 
		stats.take_hit(damage);
		
		
	queue_free()
