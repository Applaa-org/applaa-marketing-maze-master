extends Node

var score: int = 0
var behavior_keys: int = 0

func add_score(points: int) -> void:
	score += points

func reset_score() -> void:
	score = 0
	behavior_keys = 0