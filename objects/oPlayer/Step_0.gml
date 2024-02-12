
var spd = 1;

if global.kRun
{
	spd = 2;
}

image_speed = spd;

moving = false;

if !global.StopMoving
{
	if global.kDown 
	{
		if !place_meeting(x,y+spd,oWall)
		{
			y += spd;
		}
	
		sprite_index = sprRunDown;
		moving = true;
		facing = dir.down;
	}
	else if global.kLeft 
	{
		if !place_meeting(x-spd,y,oWall)
		{
			x -= spd;
		}
	
		image_xscale = -1;
		sprite_index = sprRunSides;
		moving = true;
		facing = dir.left;
	}
	else if global.kRight
	{
	
		if !place_meeting(x+spd,y,oWall)
		{
			x += spd;
		}
	
		image_xscale = 1;
		sprite_index = sprRunSides;
		moving = true;
		facing = dir.right;
	}
	else if global.kUp
	{
		if !place_meeting(x,y-spd,oWall)
		{
			y -= spd;
		}
	
		sprite_index = sprRunUp;
		moving = true;
		facing = dir.up;
	}
}
