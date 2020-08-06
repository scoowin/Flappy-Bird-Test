extends Area2D

func _on_Pipe_body_entered(body: Node) -> void:
	get_parent().kill()
