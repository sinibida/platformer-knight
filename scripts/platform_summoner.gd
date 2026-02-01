extends Node

@export var summon_into: Node2D;
@export var summon_origin: Node2D;

@onready var summon_timer: Timer = $SummonTimer
@onready var rng = RandomNumberGenerator.new();
var platforms:Array[PackedScene] = [
	preload("res://objects/platform.tscn")
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	summon_timer.timeout.connect(_summon_timeout)
	pass # Replace with function body.

func _summon_timeout() -> void:
	var platform: Node2D = platforms[0].instantiate()
	summon_into.add_child(platform);
	platform.position.x = summon_origin.position.x + 500;
	platform.position.y = summon_origin.position.y + rng.randf_range(-300, 300)
	pass
