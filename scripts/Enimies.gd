extends Node

var EnemyNode = preload("res://assets/Enemy.tscn")

# genreate enemies
export var max_enemy_nums := 5;
export var second_gap_genearate := 0.5

# number of enimies
var enemies_total_num = 0;
var enimies_killed_num = 0;

# record ready to destroy nodes
var destruction_nodes : Array= []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = second_gap_genearate;
	$Timer.start()

func _on_destruction_free(shards: Spatial):
	$DestrunctionFreeTimer.start()

	if (shards) : 
		destruction_nodes.append(shards)

func _on_Timer_timeout():
	if (enemies_total_num < max_enemy_nums):
		# generate a enemy
		var enemy = EnemyNode.instance()
		# set ememy ground and player
		enemy.player = $"../Player"
		enemy.ground_navigation = $"../GroundNavigation"
		enemy.connect("enemy_free_with_destrunction_signal", self, "_on_destruction_free")
		add_child(enemy);
		
		enemies_total_num += 1


func _on_DestrunctionFreeTimer_timeout():
	for i in range(destruction_nodes.size()):
		var s_n = destruction_nodes[i] as Spatial;
		s_n.queue_free()
		
	destruction_nodes.clear()
