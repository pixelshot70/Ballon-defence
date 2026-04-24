extends Area2D

var score = 0.0

func _physics_process(delta):
	if not get_tree().paused:
		score += delta * 10
		var label = get_parent().get_node("ScoreLabel")
		if label:
			label.text = "Score: " + str(int(score))
		
		# Передаем счет в Main для сложности
		get_parent().update_difficulty(int(score))

func _on_body_entered(body):
	if body is RigidBody2D:
		get_tree().reload_current_scene()
