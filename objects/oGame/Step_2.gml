///@description camera

#macro view view_camera[0]



if view_height != Bview_height
{
	if view_height < Bview_height
	{
		if ((view_height - Bview_height) > (1 * Speed))
		{
			view_height = Bview_height;
		}
		else
		{
			view_height += 1 * Speed;
		}
		
	}
	else
	{
		if ((view_height - Bview_height) < (1 * Speed))
		{
			view_height = Bview_height;
		}
		else
		{
			view_height -= 1 * Speed;
		}
		
	}
}
	
if view_width/view_height != 16/9
{
	view_width = view_height*(16/9);	
}

if instance_exists(oPlayer)
{
	var followSpeed = 7;
	var prevX = followX;
	var prevY = followY;
		
	followX = Approach(prevX,oPlayer.x,followSpeed);
	followY = Approach(prevY,oPlayer.y,followSpeed);
		
}

camera_set_view_size(view, view_width, view_height);

var _x = clamp(followX-view_width/2,0,room_width-view_width);
var _y = clamp(followY-view_height/2,0,room_height-view_height);
			
			
camera_set_view_pos(view,_x,_y);
//
camera_set_view_speed(view, -1, -1);
camera_set_view_border(view, 32, 32);
			
var _cur_x = camera_get_view_x(view);
var _cur_y = camera_get_view_y(view);
var _spd = .01;
	
camera_set_view_pos(view,
			lerp(_cur_x,_x,_spd),
			lerp(_cur_y,_y,_spd)
			)
									
			


// Screenshake
if (screenShake) 
{
	var intmult = Intensity*0.6;
	var xrange = camera_get_view_x(view)+floor(random_range(-intmult, intmult));
	var yrange = camera_get_view_y(view)+floor(random_range(-intmult, intmult));
	camera_set_view_pos(view_camera[0],xrange,yrange);
} 
else 
{
    // Reset
   camera_set_view_pos(view_camera[0],camera_get_view_x(view), camera_get_view_y(view));
   
}