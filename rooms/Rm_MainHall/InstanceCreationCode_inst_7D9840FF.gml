endFunc = function()
{
	if !instance_exists(oLadder)
	{
		with instance_create_layer(688,60,"Terrain_layer",oLadder)	
		{
			xx = 360;
			yy = 389;
			next_room = Rm_Solder;
		}
	}
}