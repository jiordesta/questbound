extends Node2D
class_name CustomCamera

var shake_strength = 0.0
var rng = RandomNumberGenerator.new()
var shake_time = 0
var active = false

func _ready() -> void:
	var camera:Camera2D = $Camera2D
	camera.zoom = Constant.MAX_CAMERA_ZOOM
	Global.custom_camera = self
func applyShake(amount: float, time: float):
	shake_strength = amount
	shake_time = time
func _process(delta):
	if shake_time <= 0: return
	shake_time -= delta
	if shake_strength > 0:
		$Camera2D.offset = Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
		shake_strength = lerp(shake_strength, 0.0, delta * 5)  # Smoothly reduce shake
