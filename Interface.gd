extends Control

var user_name = "Gil"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello {user_name}".format({"user_name": user_name}))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextInput_text_entered(new_text):
	$"VBoxContainer/Display".text = new_text
