extends Area2D


func _on_RedKey_body_entered(body):
	body.item_grabbed(self)
