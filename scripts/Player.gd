extends KinematicBody

# player move
const SPEED = 10;
var velocity = Vector3()

# player weapon 


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
	
	check_shot(delta)
	
func check_shot(delta):
	if Input.is_action_just_pressed("ui_shoot"):
		$Hand/Weapon.shot()
