extends CharacterBody2D

@export var speed: float = 100.0
@export var dash_speed: float = 250.0
@export var jump_power: float = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");
var remaining_jump = 2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta;
	var current_speed = dash_speed if Input.is_key_pressed(KEY_SHIFT) else speed;
	velocity.x = Input.get_axis("left", "right") * current_speed;

	if is_on_floor():
		remaining_jump = 2;
	if Input.is_action_just_pressed("jump") and remaining_jump > 0:
		velocity.y = -jump_power;
		remaining_jump -= 1

	if move_and_slide():
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if (collision.get_collider() as Node2D).name == "DeathZone":
				position = Vector2(0,-30)
	pass
