if instance_exists(oPlayer)
{
	x = oPlayer.x;
	y = oPlayer.y;
	depth = oPlayer.depth-1;
	image_yscale = 1;
	image_xscale = 1;
	
	switch(oPlayer.facing)
	{
		case(dir.up):
			image_angle = 180;
			sprite_index = sShotgun;
			depth = oPlayer.depth+1;
			x -= 6;
		break;
		case(dir.left):
			image_angle = 270;
			sprite_index = sShotgunSide;
			//image_yscale = -1;
			image_xscale = -1;
			depth = oPlayer.depth-1;
		break;
		case(dir.right):
			image_angle = 90;
			sprite_index = sShotgunSide;
			depth = oPlayer.depth+1;
		break;
		case(dir.down):
			image_angle = 0;
			sprite_index = sShotgun;
			x += 6;
			y -= 6;
			
			
		break;
	}
}
