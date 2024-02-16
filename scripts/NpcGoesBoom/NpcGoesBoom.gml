// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NpcGoesBoom()
{
	ww = sprite_get_width(sprite_index); //we need to know how wide
	hh = sprite_get_height(sprite_index); //and how tall our sprite is
	chunk = 4; //this is how big your chunks will be in pixels

	for (i=0;i<ww;i+=chunk) { //we loop 4 pixel at a time all the way across
		for (j=0;j<hh;j+=chunk) { //while picking all the vertical pixels in each column
				    particle = instance_create(x-sprite_get_xoffset(sprite_index)+i,y-sprite_get_yoffset(sprite_index)+j,oDeathParticle); //we create a particle relative to the object, offset by the proper amount
				    particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
				    particle.size = chunk;
				    particle.xx = i; //we'll need the particles to have these values so they can draw the right part of the sprite
				    particle.yy = j;
		}
	}
}