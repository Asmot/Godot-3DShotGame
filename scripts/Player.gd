extends KinematicBody



# player move
const SPEED = 10;
var velocity = Vector3()

# player weapon bullet
var BulletNode = preload("res://assets/Bullet.tscn")


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
	
	
	check_shoot(delta)
	
	
func check_shoot(delta):
	if Input.is_action_just_pressed("ui_shoot"):
		var muzzle_node = $Position3D/Weapon/Muzzle
		var shot_pos = muzzle_node.global_transform.origin
		var shot_pos_basis = muzzle_node.global_transform.basis
		
		# new bullet and set the pos ,speed , and direction
		var bullet_node = BulletNode.instance()
		bullet_node.translation = shot_pos
		bullet_node.speed = 1
		bullet_node.direction = shot_pos_basis.z
		
		# bullet need add to root node, as it move with golbal transform
		var root_node = get_tree().root;
		root_node.add_child(bullet_node)
