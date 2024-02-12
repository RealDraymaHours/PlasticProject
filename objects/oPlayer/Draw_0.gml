draw_self();

if !moving
{
	switch(facing)
	{
		case(dir.up):
			sprite_index = sprIdleUp;
		break;
		case(dir.left):
			sprite_index = sprIdleSides;
			image_xscale = -1;
		break;
		case(dir.right):
			sprite_index = sprIdleSides;
			image_xscale = 1;
		break;
		case(dir.down):
			sprite_index = sprIdleDown;
		break;
	}
}