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
			
			shootDirX = x;
			shootDirY = y-50;

		break;
		case(dir.left):
			image_angle = 270;
			sprite_index = sShotgunSide;
			//image_yscale = -1;
			image_xscale = -1;
			depth = oPlayer.depth-1;
			
			shootDirX = x-50;
			shootDirY = y;

		break;
		case(dir.right):
			image_angle = 90;
			sprite_index = sShotgunSide;
			depth = oPlayer.depth+1;
			
			shootDirX = x+50;
			shootDirY = y;

		break;
		case(dir.down):
			image_angle = 0;
			sprite_index = sShotgun;
			x += 6;
			y -= 6;
			
			shootDirX = x;
			shootDirY = y+50;

			
		break;
	}
	
	shootX = x;
	shootY = y;
	
	
	
	
	if global.kActionRelease && global.kRun && !oPlayer.moving && alarm[0] == -1
	{
		alarm[0] = 60;
		audio_play_sound(sndShotgun,99,false,1,0,irandom_range(1,2))
		var bull1 = instance_create(shootX,shootY,oShotgunShell);
		var bull2 = instance_create(shootX,shootY,oShotgunShell);
		var bull3 = instance_create(shootX,shootY,oShotgunShell);
		
		var vrDirX = shootDirX;
		var vrDirY = shootDirY;
		
		
		with bull1{move_towards_point(vrDirX,vrDirY,irandom_range(4,5))}
		with bull2{move_towards_point(vrDirX+irandom_range(1,3),vrDirY+irandom_range(1,3),irandom_range(4,5))}
		with bull3{move_towards_point(vrDirX-irandom_range(1,3),vrDirY-irandom_range(1,3),irandom_range(4,5))}
		

	}
}
