extends Node

var start_zombie_chase = false

var player_have_key = false

var torch_collected = false
var drink_water = false
var ate_fruit = false
var fuse_box_opened = false
var drower_opened = false

var starting_text:Array[Dictionary] = [
	{"text": "It is Dark..."},
	{"text": "I need the torch"}
	
]

var drinking_text:Array[Dictionary] = [
	{"text": "I am Thirsty"},
	{"text": "I need a glass of water."}
	
]


var eating_text:Array[Dictionary] = [
	{"text": "I am hungry"},
	{"text": "I need to eat something"}
	
]


var old_fuse_test:Array[Dictionary] = [
	{"text": "This fuse is ruined"},
	{"text": "I need to find a new one"}
	
]


var collect_torch:Array[Dictionary] = [
	{"text": "Get the torch", "speaker":"player"},
	{"text": "HELLO!!!", "speaker":"hacker"}
	
]
