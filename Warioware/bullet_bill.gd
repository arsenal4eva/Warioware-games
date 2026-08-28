extends StaticBody2D

@export var speed: float = 250.0
var has_spawned_next := false


func _physics_process(delta: float) -> void:
	position.x -= speed * delta

	if position.x <= -200 and not has_spawned_next:
		has_spawned_next = true
		get_parent().spawn_bulletbill()

	if position.x <= -600:
		queue_free()
