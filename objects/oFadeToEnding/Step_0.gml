depth = -20;
global.StopMoving = true;
x = oPlayer.x;
y = oPlayer.y;
audio_sound_gain(mscInGame,1-(fade/200),120);

if fade < 200
{
	fade++;	
	image_alpha = fade/200;
}
else
{
	room_goto(theEnding);
}