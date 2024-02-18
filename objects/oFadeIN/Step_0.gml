depth = -200;

if fade > 0
{
	fade -= 0.2;	
	image_alpha = (fade / 100);
}
else
{
	instance_destroy()
}