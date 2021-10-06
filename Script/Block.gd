extends KinematicBody

var Level = 1
var Movement = Vector3()

func _ready():
	var material = $MeshInstance.get_surface_material(0)
	material.albedo_color = "9e9fdc"
	$MeshInstance.set_surface_material(0, material)
	

func _physics_process(delta):
	var Movement = rand_range(50*Level,60*Level)
	if transform.origin.z > 10:
		queue_free()
	move_and_slide(Vector3(0,0,Movement))    

func hancur():
	$EfekBlockPecah/Particles.emitting = true
	$MeshInstance.queue_free()
	$CollisionShape.queue_free()
	$AreaPemainMasuk.queue_free()


func _on_Area_body_entered(body):
	if body.is_in_group("objek"):
		body.hancur()
		Movement = 100
		yield(get_tree().create_timer(1.0), "timeout")
		queue_free()
		
func random_color():
	var warna = ["00ff58","ebff00","ffabab","00dbff"]
	warna = warna[randi()%warna.size()]
	var material = $MeshInstance.get_surface_material(0)
	material.albedo_color = warna
	get_node("../CanvasLayer").update_score(warna)
	$MeshInstance.set_surface_material(0, material)
	

func _on_AreaPemainMasuk_body_entered(body):
	if body.is_in_group("pemain"):
		random_color()
		body.lompat()
		
		
	
