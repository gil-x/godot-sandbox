extends Control

var user_name = "Gil"

onready var display_text = $VBoxContainer/Display
onready var text_input = $VBoxContainer/HBoxContainer/TextInput
onready var confirmation_dialog = $ConfirmationDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello {user_name}".format({"user_name": user_name}))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_display(new_text):
	display_text.text = display_text.text + new_text + "\n"
	text_input.clear()

func empty_display():
	display_text.text = ""

func _on_TextInput_text_entered(new_text):
	update_display(new_text)

func _on_Submit_pressed():
	update_display(text_input.text)

func _on_TextureButton_pressed():
	confirmation_dialog.popup_centered()

func _on_ConfirmationDialog_confirmed():
	print_txt()
	empty_display()
	
func print_txt():
	print(display_text.text)
	var file = File.new()
	file.open("output/export.txt", File.READ)
	var previous_text = file.get_as_text()
	file.open("output/export.txt", File.WRITE)
	file.store_string(previous_text + display_text.text)
	file.close()
