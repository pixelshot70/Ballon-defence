extends Area2D

var score = 0.0

func _physics_process(delta):
	if not get_tree().paused:
		var main_node = get_parent()
		# Начисление очков (x3 во время ульты)
		if main_node.is_ultra_active:
			score += delta * 30 
		else:
			score += delta * 10
			
		var label = main_node.get_node("ScoreLabel")
		if label:
			label.text = "Score: " + str(int(score))
		
		# Запуск проверки сложности
		main_node.update_difficulty(int(score))

func _on_body_entered(body):
	if body is RigidBody2D:
		get_tree().reload_current_scene()
