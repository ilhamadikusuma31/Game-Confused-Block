extends KinematicBody

var gravitasi = -1
var percepatan = 2
const maxGravitasi = -10
const zonaJatuh = -100
var jalan = 10
var movement = Vector3()

var kondisi = false

func _physics_process(delta):
	movement.y += gravitasi
	
	if is_on_floor():
		movement.y = 0
	
	if Input.is_action_pressed("Depan"):
		movement.z = -jalan*percepatan
		
	elif Input.is_action_pressed("Belakang"):
		movement.z = jalan*percepatan
	
	
	else:
		movement.x=0
		movement.z=0
	
	if movement.y == zonaJatuh:
		get_node("../CanvasLayer").pilihan()
		
		
	if Input.is_action_pressed("Kanan"):
		movement.x = jalan

	elif Input.is_action_pressed("Kiri"):
		movement.x = -jalan
	
	if Input.is_action_pressed("Lompat") and is_on_floor():
		movement.y -= 25*gravitasi
		
	movement.x = lerp(movement.x, 0, 0.01)
	
	move_and_slide(movement, Vector3.UP)

func lompat():
	$SuaraPemainLoncat.playing = true
