extends Area

export var speed := 1
export var direction := Vector3(1,0,1)

func _ready():
	$Timer.start()

func _physics_process(delta):
	translation += direction * speed * delta


func _on_Timer_timeout():
	# only alive for a while
	queue_free()


func _on_Bullet_body_entered(body):
	# if bullet hit some one, free the bullit
	print ("bullet hit ", body.name)
	queue_free()
