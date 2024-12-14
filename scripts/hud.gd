extends Control

var use_narrative: Array[Dictionary]
var use_achievement: Array[Dictionary]

var narrative_index:int = 0
var achievement_index:int = 0

@onready var target = $Target

func _ready() -> void:
	%AchievementHolder.visible = false
	GlobalSignal.set_narrative.connect(_set_narrative)
	GlobalSignal.set_achievement.connect(_set_achievement)

func _set_narrative(narrative):
	use_narrative = narrative
	narrative_index = 0
	_narrate()

func _set_achievement(achievement):
	use_achievement = achievement
	achievement_index = 0
	_achieve()
	%Achive_Text_Timer.start()

func _narrate():
	if narrative_index == use_narrative.size():
		%NarrativeHolder.visible = false
		return
	
	%Narrative.text = use_narrative[narrative_index]["text"]
	#var text_colour: String = speakers[use_narrative[narrative_index]["speaker"]]
	#%Narrative.add_theme_color_override("default_color",text_colour)
	%NarrativeHolder.visible = true
	narrative_index += 1
	
func _achieve():
	if achievement_index == use_achievement.size():
		%AchievementHolder.visible = false
		return
	
	%Achievement.text = use_achievement[achievement_index]["text"]
	#var text_colour: String = speakers[use_narrative[narrative_index]["speaker"]]
	#%Narrative.add_theme_color_override("default_color",text_colour)
	%AchievementHolder.visible = true
	achievement_index += 1
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("narrative"):
		if %NarrativeHolder.visible:
			_narrate()
	

func target_state(state):
	if state:
		target.modulate.a = 1.0
	else:
		target.modulate.a = 0.2
	


func _on_achive_text_timer_timeout() -> void:
	_achieve()
