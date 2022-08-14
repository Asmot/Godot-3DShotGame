extends Node

var EnemyNode = preload("res://assets/Enemy.tscn")

# genreate enemies
export var max_enemy_nums := 5;
export var second_gap_genearate := 0.5

# number of enimies
var enemies_total_num = 0;
var enimies_killed_num = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = second_gap_genearate;
	$Timer.start()


func _on_Timer_timeout():
	if (enemies_total_num < max_enemy_nums):
		# generate a enemy
		var enemy = EnemyNode.instance()
		# set ememy ground and player
		enemy.player = $"../Player"
		enemy.ground_navigation = $"../GroundNavigation"
		
		add_child(enemy);
		
		enemies_total_num += 1
