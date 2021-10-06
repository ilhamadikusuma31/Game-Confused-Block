extends CanvasLayer

var kondisi = false
var skor = 0
onready var BestScore = get_node("/root/BestScore")
var tambahan = " "
func _ready():
	$Panel_Score/Label_Score.text = str(skor)
	$Label_info.text = tambahan
	$Label_info.visible = true
	$Panel_Best_Score/Label.text = str(BestScore.fungsi_bestscore())
	yield(get_tree().create_timer(0.4), "timeout")
	$Label_info.visible = false
	

func update_score(warna):
	
	if warna == "00ff58":
		skor *=2
		tambahan = "x2"
	
	elif warna == "ebff00":
		skor -=2
		tambahan = "-2"
	
	elif warna == "ffabab":
		skor /=2
		tambahan = ":2"
		
	else:
		skor +=2
		tambahan = "+2"
	
	if skor > BestScore.fungsi_bestscore():
		BestScore.set_bestscore(skor)
	
	_ready()
	

func pilihan():
	$Restart_Button.visible = true
	$Main_Menu_Button.visible = true

func _on_Restart_Button_pressed():
	get_tree().change_scene("res://Scene/Level.tscn")

func _on_Main_Menu_Button_pressed():
	get_tree().change_scene("res://Scene/MainMenu.tscn")
