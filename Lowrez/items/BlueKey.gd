extends Area2D





func _on_BlueKey_body_entered(body):
	body.item_grabbed(self)
