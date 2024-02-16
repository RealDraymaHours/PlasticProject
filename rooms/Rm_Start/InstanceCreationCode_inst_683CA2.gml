endFunc = function()
{
	hole = instance_create(x+10,y+10,oShotgunShellHole);	
	hole.image_angle = 0;
	hole.image_xscale = 10;
	hole.image_yscale = hole.image_xscale;
	hole.depth = 250;
}