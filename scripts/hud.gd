extends CanvasLayer

@onready var score_label: Label = $score_label
@onready var heart_1: Sprite2D = $anchor_control/heart_1
@onready var heart_2: Sprite2D = $anchor_control/heart_2
@onready var heart_3: Sprite2D = $anchor_control/heart_3

var heart_filled: Texture2D = preload("res://assets/heart/heart-filled.png")
var heart_empty: Texture2D = preload("res://assets/heart/heart-empty.png")

func update_score(score, max_score) -> void:
	score_label.text = str(score) + "/" + str(max_score) + " Cheese"

func update_health(new_health) -> void:
	# Save all sprite in array
	var hearts = [heart_3, heart_2, heart_1]
	
	# Loop through all hearts and update sprites according to new_health
	for i in range(hearts.size()):
		if i < new_health:
			hearts[i].texture = heart_filled
		elif i == new_health:
			hearts[i].texture = heart_empty
			bounce_heart(hearts[i])
		else: 
			hearts[i].texture = heart_empty

# Give a visual feedback on which heart is being removed
func bounce_heart(heart: Sprite2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(heart, "scale", Vector2(10.0, 10.0), 0.15).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(heart, "scale", Vector2(8.0, 8.0), 0.15).set_trans(Tween.TRANS_BOUNCE)
