extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var bulletbill_scene = preload("res://bullet_bill.tscn")

var timer_end := false
var is_hit := false


func _ready() -> void:
	$SpikeWalls.spikes_hit.connect(hit)

	spawn_bulletbill()

	await themed_timer.Timer(30.0)

	if is_instance_valid(self) and is_inside_tree() and not is_hit:
		timer_end = true


func _process(_delta: float) -> void:
	if timer_end:
		timer_end = false

		Global.minigames_done += 1

		get_tree().change_scene_to_file("res://timer_screen.tscn")


func hit() -> void:
	if is_hit:
		return

	is_hit = true

	Global.lives -= 1

	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://lose.tscn")


func spawn_bulletbill() -> void:
	if is_hit or timer_end:
		return

	var new_bulletbill = bulletbill_scene.instantiate()

	add_child(new_bulletbill)

	new_bulletbill.position = Vector2(
		1150,
		randf_range(100, 300)
	)
