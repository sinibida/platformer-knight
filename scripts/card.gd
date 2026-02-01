@tool
extends Node2D

@export var text: String

@onready var content: Label = $Content;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if content:
		content.text = text;
