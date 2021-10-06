extends Spatial

onready var Level = get_tree().current_scene


func spawn():
	var Block = load("res://Scene/Block.tscn")
	var Blocknya = Block.instance()
	Level.add_child(Blocknya)
	Blocknya.transform.origin = transform.origin + Vector3(rand_range(-6,6),rand_range(-2,2),0)

func _on_Timer_timeout():
	spawn()
