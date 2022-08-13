extends KinematicBody


const SPEED = 10;
var velocity = Vector3()


func _physics_process(delta):
	velocity = Vector3()
	if Input.is_action_pressed("ui_up"):
		velocity.z += 1
	if Input.is_action_pressed("ui_down"):
		velocity.z -= 1
	if Input.is_action_pressed("ui_left"):
		velocity.x += 1
	if Input.is_action_pressed("ui_right"):
		velocity.x -= 1
	
	velocity = velocity.normalized() * SPEED
	move_and_slide(velocity)
