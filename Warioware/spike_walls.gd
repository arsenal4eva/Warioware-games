extends Node2D
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

# make a signal
signal spikes_hit

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("spikes_hit") #signal broadcast
		
