extends Node

var bestscore = 0 setget set_bestscore
const filepath = "user://bestscore.dat"

func _ready():
	load_bestscore()

func fungsi_bestscore():
	return bestscore

func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath):
		return
	file.open(filepath, File.READ)
	bestscore = file.get_var()
	file.close()

func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()

func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
