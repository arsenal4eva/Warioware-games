extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var timer_end := false
var is_hit := false


func _ready() -> void:
	$SpikeWalls.spikes_hit.connect(hit)

	# Wait 30 seconds
	await themed_timer.Timer(30.0)

	# Only trigger if the player hasn't already lost
	if is_instance_valid(self) and is_inside_tree() and not is_hit:
		timer_end = true


func _process(_delta: float) -> void:
	if timer_end:
		timer_end = false

		# Player survived for 30 seconds → WIN
		Global.minigames_done += 1

		get_tree().change_scene_to_file("res://timer_screen.tscn")


func hit() -> void:
	if is_hit:
		return

	is_hit = true
	Global.minigames_done -=1 #go back a minigame
	Global.lives -= 1 # lose ur lives
	get_tree().change_scene_to_file("res://timer_screen.tscn")
