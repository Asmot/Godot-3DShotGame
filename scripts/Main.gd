extends Spatial

# the ray form camera origin to camera target
var rayOrigin = Vector3()
var rayTarget = Vector3()
const RAY_LENGTH = 2000;

func _physics_process(delta):
	
	# mouse pos to world pos, the pos need on some object
	var mousePosition = get_viewport().get_mouse_position();
	rayOrigin = $MainCamera.project_ray_origin(mousePosition);
	rayTarget = rayOrigin + $MainCamera.project_ray_normal(mousePosition) * RAY_LENGTH;
	
	var spaceState = get_world().direct_space_state;
	var intersection = spaceState.intersect_ray(rayOrigin, rayTarget)
	
	# if have intersection, change the player's toward
	if not intersection.empty():
		var pos = intersection.position;
		# keep the eye height
		var look_at_pos = Vector3(pos.x, $Player.translation.y, pos.z);
		$Player.look_at(look_at_pos, Vector3.UP)
	
