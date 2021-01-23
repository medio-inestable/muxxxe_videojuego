extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var richText = $RichTextLabel
var numeroTimer = 0
var numeroStop
var texto_n = 0

var can_next = true
# Called when the node enters the scene tree for the first time.
#func _ready():
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func cambia_texto(texto):
	print('d')
	
func _on_Timer_timeout():
	numeroTimer += 1
	if numeroStop > numeroTimer:
		richText.visible_characters = numeroTimer
		#print(richText.visible_characters)
		$Timer.start()
	else:
		$Timer.stop()
