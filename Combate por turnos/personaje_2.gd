extends Node2D



var vida = 5 #vida
var damage = 2 #daño
var vida_maxima = 5

var damage_recibido = 2

func _ready():
	$Node2D.visible = false
	$ProgressBar.value = vida * 100 / vida_maxima
	print("Label")


func _process(_delta):
	pass

func _damage():
	$Node2D.visible = true
	$Node2D/Label.text = str(damage_recibido)
	$AnimationPlayer.play("damage")
	$ProgressBar.value = vida * 100 / vida_maxima

	

func _on_cursor_mouse_shape_entered(shape_idx):
	$cursor.visible = true


func _on_cursor_mouse_shape_exited(shape_idx):
	$cursor.visible = false

func atacar():
	#$Node2D.visible = true
	$Node2D/Label.text = str(damage_recibido)
	#$AnimationPlayer.play("recibir_dano")
	$animacion_atacar.play("atacar")
	$ProgressBar.value = vida * 100 / vida_maxima
	



