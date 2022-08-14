extends "res://addons/destruction/destruction.gd"


func destroy_with_free_signal(callbackSingal):
	var shards := DestructionUtils.create_shards(shard_scene.instance(), shard_template)
	get_node(shard_container).add_child(shards)
	shards.global_transform.origin = get_parent().global_transform.origin
	
	emit_signal(callbackSingal, shards)
	get_parent().queue_free()
	
	
	
