global.kUp = keyboard_check(ord("W"));
global.kLeft = keyboard_check(ord("A"));
global.kRight = keyboard_check(ord("D"));
global.kDown = keyboard_check(ord("S"));

global.StopMoving = false;

global.kRun = keyboard_check(vk_shift);
global.kAction = keyboard_check(vk_space);
global.kActionRelease = keyboard_check_released(vk_space);

global.GameState = new GameStateCreate();
global.font_main = font_add_sprite(sFontWhite, 32, true,1);


function item(_name, _desc, _icon, _effect) constructor
{
	name = _name;
	desc = _desc;
	icon = _icon;
	effect = _effect;
}

global.items =
{
	shotgun : new item(
	"Shotgun",
	"A stick that goes boom",
	sPlayerBackIdle,
	function(){}
	),
	fishingRod : new item(
	"Fishing rod",
	"A rod for fishing",
	sPlayerBackIdle,
	function(){}
	),
	cowboyHat : new item(
	"Cowboy hat",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	noodles : new item(
	"Plastic Noodles",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	bowl : new item(
	"Bowl",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	Water : new item(
	"Cold water",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	WaterWarm : new item(
	"Warm water",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	videoGame : new item(
	"Video Game",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	lighter : new item(
	"Lighter",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
	fish : new item(
	"Fish",
	"PLACEHOLDER",
	sPlayerBackIdle,
	function(){}
	),
}

inventory = array_create(0);
triggers = array_create(0);
saveData = array_create(0);

#region Camera

application_surface_draw_enable(true);

screenShake = false;
Speed = 1000;

followX = x;
followY = y;

Intensity = 1;

//base_width = 1920/6;
//base_height = 1080/6;

view_width = 1280
view_height = 720

//Bview_width = 1280/3
Bview_height = 720/4

window_scale = 5;

window_set_size(view_width*window_scale,view_height*window_scale);


surface_resize(application_surface,view_width*window_scale, view_height*window_scale);

alarm[1] = 1;

#endregion

/*
#region SHADER
	
	UCRTParams = shader_get_uniform(shdCRT, "params");
	CRT = global.GameState.CRT;
	application_surface_draw_enable(false);
	
#endregion

//window_set_size(view_width,view_height);

*/
window_set_size(view_width,view_height);
window_center();