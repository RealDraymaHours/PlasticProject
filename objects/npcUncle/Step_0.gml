depth = 250;

switch(state)
{
	case(0):
		oControlsShotgun.visible = false;
		if distance_to_object(oPlayer) < 50
		{
			state = 1;	
			sysNPC.say.UncleStart.dialog();
		}
	break;
	case(1):
		if sprite_index == sUncleShotgun
		{
			if y != oPlayer.y
			{
				y = Approach(y,oPlayer.y-8,1);	
			}
		}
		
	break;
	case(3):
		sprite_index = sUncleBlood;
		oControlsShotgun.visible = true;
	break;

}
	
