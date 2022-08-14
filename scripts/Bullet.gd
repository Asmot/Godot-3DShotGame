extends MeshInstance

export var speed := 1
export var direction := Vector3(1,0,1)

func _ready():
	$Timer.start()

func _physics_process(delta):
	translation += direction * speed


func _on_Timer_timeout():
	# only alive for a while
	queue_free()
