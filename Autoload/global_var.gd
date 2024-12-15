extends Node

var start_zombie_chase = false

var player_have_key = false

var torch_collected = false
var drink_water = false
var ate_fruit = false
var fuse_box_opened = false
var drower_opened = false
var ket_collected = false
var trap_opened = false
var new_fuse_collected = false

var locked_text:Array[Dictionary] = [
	{"text": "It is locked"},
	{"text": "I need a key to open"}
	
]

var search_fusebox:Array[Dictionary] = [
	{"text": "I should see"},
	{"text": "The FuseBox"}
	
]

var zombie_sound_text:Array[Dictionary] = [
	{"text": "Huh..."},
	{"text": "What was that."},
	{"text": "I should hurry up"}
	
]

var ket_text:Array[Dictionary] = [
	{"text": "Retro left his keys..."},
	{"text": "I can use this to OPEN things"}
	
]

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


var old_fuse_text:Array[Dictionary] = [
	{"text": "This fuse is ruined"},
	{"text": "I need to find a new one"}
	
]

var new_fuse_text:Array[Dictionary] = [
	{"text": "I got a new fuse"},
	
]


var collect_torch_text:Array[Dictionary] = [
	{"text": "I can see Now.."},
	
]
