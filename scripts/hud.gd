extends Control

var use_narrative: Array[Dictionary]

var narrative_index:int = 0

@onready var target = $Target

var speakers= {
	"player" : "#007eca",
	"hacker" : "#ffff00"
}

func _ready() -> void:
	GlobalSignal.set_narrative.connect(_set_narrative)

func _set_narrative(narrative):
	use_narrative = narrative
	narrative_index = 0
	_narrate()

func _narrate():
	if narrative_index == use_narrative.size():
		%NarrativeHolder.visible = false
		return
	
	%Narrative.text = use_narrative[narrative_index]["text"]
	var text_colour: String = speakers[use_narrative[narrative_index]["speaker"]]
	%Narrative.add_theme_color_override("default_color",text_colour)
	%NarrativeHolder.visible = true
	narrative_index += 1
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("narrative"):
		if %NarrativeHolder.visible:
			_narrate()
	

func target_state(state):
	if state:
		target.modulate.a = 1.0
	else:
		target.modulate.a = 0.5
	
