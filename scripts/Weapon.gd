extends Spatial

export var bullet_speed := 1

var BulletNode = preload("res://assets/Bullet.tscn")

func shot(): 
	var muzzle_node = $Muzzle
	var shot_pos = muzzle_node.global_transform.origin
	var shot_pos_basis = muzzle_node.global_transform.basis
	
	# new bullet and set the pos ,speed , and direction
	var bullet_node = BulletNode.instance()
	bullet_node.translation = shot_pos
	bullet_node.speed = bullet_speed
	bullet_node.direction = shot_pos_basis.z
	
	# bullet need add to root node, as it move with golbal transform
	var root_node = get_tree().root;
	root_node.add_child(bullet_node)
