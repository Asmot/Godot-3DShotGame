extends KinematicBody

class_name Enemy

# move speed
export var speed := 5;

signal enemy_free_with_destrunction_signal

# ememy need know the ground navigation and the player
# use them to find a way to palayer
export(PackedScene) var ground_navigation
var player : KinematicBody
var path : PoolVector3Array 

# for move along the path
var currentPathIndex = 0;

# reocrd if player in attack area
var isAttacking = false;

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if currentPathIndex < path.size():
		var next_pos = path[currentPathIndex];
		next_pos.y = global_transform.origin.y
		var toward_dir : Vector3 = next_pos - global_transform.origin
		
		if toward_dir.length() <= 1:
			currentPathIndex += 1
		else:
			var velocity = toward_dir.normalized()
			move_and_slide(velocity * speed)
	
	checkAttacking()
	
# if is attacking change the color
func checkAttacking():
	if isAttacking:
		$AttackRadius/Body.visible = true
	else:
		$AttackRadius/Body.visible = false

func update_path():
	if (ground_navigation and player) :
		var start_pos = global_transform.origin;
		var end_pos = player.global_transform.origin;
		
		path = ground_navigation.get_simple_path(start_pos, end_pos)


func _on_Timer_timeout():
	update_path()
	currentPathIndex = 0


func _on_health_hp_zero_signal():
	# hp is zeor need to die
	# destruction the body, destroy will queue_free this
#	queue_free()s
	$CubeDestruction.destroy_with_free_signal("enemy_free_with_destrunction_signal")


func _on_AttackRadius_body_entered(body : Node):
	# play enter the attack area
	if body == player:
		isAttacking = true;
	

func _on_AttackRadius_body_exited(body):
	if body == player:
		isAttacking = false;

