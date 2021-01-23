extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var texto_vendedor_toro = ['change da world','my final message.','Goodbye', '']
var n = 0
var puede_hablar = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed == true && puede_hablar:
			hablar()


func _on_Area_area_entered(area):	
	puede_hablar = true
	area.get_node('../Camroot/h/v/Camera').current = false
	$Camera_interact.current = true
	#print($'../Player'.puede_hablar)


func _on_Area_area_exited(area):		
	puede_hablar = false
	$Camera_interact.current = false
	$Camera_hablar.current = false
	area.get_node('../Camroot/h/v/Camera').current = true

func hablar():	
	#print(texto_vendedor_toro.size())
	if $'../Player'.hablando:
		n = (n+1)%texto_vendedor_toro.size()
		if n == texto_vendedor_toro.size()-1:
			$'../Player'.hablando = false
			$Camera_interact.current = true
			$Camera_hablar.current = false
			$'../Player'.puede_moverse = true
			$'../Player'.visible = true
			$'../Control'.cambia_texto(texto_vendedor_toro)
		else:
			#print(texto_vendedor_toro[n],n)
			$'../Control'.cambia_texto(texto_vendedor_toro)
		
	else:
		n = 0
		$Camera_interact.current = false
		$Camera_hablar.current = true
		$'../Player'.puede_moverse = false
		$'../Player'.visible = false
		$'../Player'.hablando = true
		#print('i ',texto_vendedor_toro[n],n)
		$'../Control'.cambia_texto(texto_vendedor_toro)
		
