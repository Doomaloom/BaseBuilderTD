extends Area2D

var left = 0
var right = 0
var up = 0
var down = 0
var own = 0

var placed = false
var placeable = false

func _process(delta):
	if own > 0:
		placeable = false
	else:
		placeable = true
	
	update_sprite()
	if !placed:
		position = get_global_mouse_position()
		if fmod(position.x , 64) != 0:
				position.x -= fmod(position.x, 64)
		if fmod(position.y , 64) != 0:
			position.y -= fmod(position.y, 64)
		if Input.is_action_just_pressed("left_click") and placeable:
			
			placed = true

func _on_up_area_entered(area):
	up += 1
	#update_sprite()

func _on_down_area_entered(area):
	down += 1
	#update_sprite()

func _on_right_area_entered(area):
	right += 1
	#update_sprite()

func _on_left_area_entered(area):
	left += 1
	#update_sprite()

func _on_up_area_exited(area):
	up -= 1
	#update_sprite()

func _on_down_area_exited(area):
	down -= 1
	#update_sprite()

func _on_left_area_exited(area):
	left -= 1
	#update_sprite()

func _on_right_area_exited(area):
	right -= 1
	#update_sprite()

func update_sprite():
	if left > 0 and right > 0 and up > 0 and down > 0:
		$pipe.frame = 0
	elif left > 0 and up > 0 and right > 0:
		$pipe.frame = 1
	elif left > 0 and down > 0 and right > 0:
		$pipe.frame = 2
	elif up > 0 and right > 0 and down > 0:
		$pipe.frame = 3
	elif up > 0 and left > 0 and down > 0:
		$pipe.frame = 4
	elif down > 0 and right > 0:
		$pipe.frame = 5
	elif down > 0 and left > 0:
		$pipe.frame = 6
	elif up > 0 and right > 0:
		$pipe.frame = 7
	elif up > 0 and left:
		$pipe.frame = 8
	elif left > 0 and right > 0:
		$pipe.frame = 9
	elif up > 0 and down > 0:
		$pipe.frame = 10
	elif up > 0:
		$pipe.frame = 10
	elif down > 0:
		$pipe.frame = 10
	elif left > 0 :
		$pipe.frame = 9
	elif right > 0:
		$pipe.frame = 9
	else:
		$pipe.frame = 0




func _on_Pipe_area_entered(area):
	own += 1


func _on_Pipe_area_exited(area):
	own -= 1
