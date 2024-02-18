draw_text_color_simple(x,y,"Press SPACEBAR to start",c_red);

var startY = y+16;
var startX = x-62;


draw_sprite(sMenu,0,startX,startY);	
draw_sprite(sMenu,0,startX+32,startY);	
draw_sprite(sMenu,0,startX+64,startY);	
draw_sprite(sMenu,0,startX+96,startY);	
draw_sprite(sMenu,0,startX+128,startY);	
draw_sprite(sMenu,0,startX+160,startY);	
draw_sprite(sMenu,0,startX+192,startY);	
draw_sprite(sMenu,0,startX+224,startY);	

//Yes I know this would be easier with an array, I am just really lazy lol.
if GotEndingA
{
	draw_text_color_simple(startX+8,startY+6,"A",c_yellow);
}

if GotEndingB
{
	draw_text_color_simple(startX+32+8,startY+6,"B",c_green);
}

if GotEndingC
{
	draw_text_color_simple(startX+64+8,startY+6,"C",c_orange);
}

if GotEndingD
{
	draw_text_color_simple(startX+96+8,startY+6,"D",c_purple);
}

if GotEndingE
{
	draw_text_color_simple(startX+128+8,startY+6,"E",c_gray);
}

if GotEndingF
{
	draw_text_color_simple(startX+160+8,startY+6,"F",c_aqua);
}

if GotEndingG
{
	draw_text_color_simple(startX+192+8,startY+6,"G",c_lime);
}

if GotEndingS
{
	draw_text_color_simple(startX+224+8,startY+6,"S",c_red);
}