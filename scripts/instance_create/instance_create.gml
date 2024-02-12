function instance_create(argument0, argument1, argument2) {
	var myDepth = object_get_depth( argument2 );
	return instance_create_depth( argument0, argument1, myDepth, argument2 );
}
function object_get_depth(argument0) {

	var objID = argument0;
	var ret = 0;
	if (objID >= 0) && (objID < array_length_1d(global.__objectID2Depth)) {
		ret = global.__objectID2Depth[objID];
	} // end if
	return ret;


}

function __view_set_internal(argument0, argument1, argument2) {
	var __prop = argument0;
	var __index = argument1;
	var __val = argument2;

	switch(__prop)
	{
	case e__VW.XView: var __cam = view_get_camera(__index); camera_set_view_pos(__cam, __val, camera_get_view_y(__cam)); break;
	case e__VW.YView: var __cam = view_get_camera(__index); camera_set_view_pos(__cam, camera_get_view_x(__cam), __val); break;
	case e__VW.WView: var __cam = view_get_camera(__index); camera_set_view_size(__cam, __val, camera_get_view_height(__cam)); break;
	case e__VW.HView: var __cam = view_get_camera(__index); camera_set_view_size(__cam, camera_get_view_width(__cam), __val); break;
	case e__VW.Angle: var __cam = view_get_camera(__index); camera_set_view_angle(__cam, __val); break;
	case e__VW.HBorder: var __cam = view_get_camera(__index); camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam)); break;
	case e__VW.VBorder: var __cam = view_get_camera(__index); camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val); break;
	case e__VW.HSpeed: var __cam = view_get_camera(__index); camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam)); break;
	case e__VW.VSpeed: var __cam = view_get_camera(__index); camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val); break;
	case e__VW.Object: var __cam = view_get_camera(__index); camera_set_view_target(__cam, __val); break;
	case e__VW.Visible: __res = view_set_visible(__index, __val); break;
	case e__VW.XPort: __res = view_set_xport(__index, __val); break;
	case e__VW.YPort: __res = view_set_yport(__index, __val); break;
	case e__VW.WPort: __res = view_set_wport(__index, __val); break;
	case e__VW.HPort: __res = view_set_hport(__index, __val); break;
	case e__VW.Camera: __res = view_set_camera(__index, __val); break;
	case e__VW.SurfaceID: __res = view_set_surface_id(__index, __val); break;
	default: break;
	};

	return 0;


}


function __view_set(argument0, argument1, argument2) {
	var __prop = argument0;
	var __index = argument1;
	var __val = argument2;

	__view_set_internal(__prop, __index, __val);

	var __res = __view_get(__prop, __index);

	return __res;


}

function __view_get(argument0, argument1) {
	var __prop = argument0;
	var __index = argument1;

	var __res = -1;

	switch(__prop)
	{
	case e__VW.XView: var __cam = view_get_camera(__index); __res = camera_get_view_x(__cam); break;
	case e__VW.YView: var __cam = view_get_camera(__index); __res = camera_get_view_y(__cam); break;
	case e__VW.WView: var __cam = view_get_camera(__index); __res = camera_get_view_width(__cam); break;
	case e__VW.HView: var __cam = view_get_camera(__index); __res = camera_get_view_height(__cam); break;
	case e__VW.Angle: var __cam = view_get_camera(__index); __res = camera_get_view_angle(__cam); break;
	case e__VW.HBorder: var __cam = view_get_camera(__index); __res = camera_get_view_border_x(__cam); break;
	case e__VW.VBorder: var __cam = view_get_camera(__index); __res = camera_get_view_border_y(__cam); break;
	case e__VW.HSpeed: var __cam = view_get_camera(__index); __res = camera_get_view_speed_x(__cam); break;
	case e__VW.VSpeed: var __cam = view_get_camera(__index); __res = camera_get_view_speed_y(__cam); break;
	case e__VW.Object: var __cam = view_get_camera(__index); __res = camera_get_view_target(__cam); break;
	case e__VW.Visible: __res = view_get_visible(__index); break;
	case e__VW.XPort: __res = view_get_xport(__index); break;
	case e__VW.YPort: __res = view_get_yport(__index); break;
	case e__VW.WPort: __res = view_get_wport(__index); break;
	case e__VW.HPort: __res = view_get_hport(__index); break;
	case e__VW.Camera: __res = view_get_camera(__index); break;
	case e__VW.SurfaceID: __res = view_get_surface_id(__index); break;
	default: break;
	};

	return __res;


}


function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_player
	global.__objectDepths[1] = 0; // obj_crate
	global.__objectDepths[2] = 0; // sys_transition
	global.__objectDepths[3] = 0; // obj_teleport


	global.__objectNames[0] = "obj_player";
	global.__objectNames[1] = "obj_crate";
	global.__objectNames[2] = "sys_transition";
	global.__objectNames[3] = "obj_teleport";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}

/// @description Sets the blend mode for drawing.
/// @param mode The blend mode constant to set to 
function draw_enable_alphablend(argument0) {
	gpu_set_blendenable( argument0 );


}

/// @description Sets the blend mode for drawing.
/// @param mode The blend mode constant to set to 
function draw_set_colour_write_enable(argument0, argument1, argument2, argument3) {
	gpu_set_colorwriteenable( argument0, argument1, argument2, argument3 );


}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_color_simple(x,y,text,color)
{
	draw_text_color(x,y,text,color,color,color,color,1);
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_small(mX,mY,text,maxWidth)
{
	draw_text_ext_transformed_color(mX,mY,text,12,maxWidth,0.5,0.5,0,c_white,c_white,c_white,c_white,1);
}

function draw_text_small_color(mX,mY,text,maxWidth,color)
{
	draw_text_ext_transformed_color(mX,mY,text,12,maxWidth,0.5,0.5,0,color,color,color,color,1);
}