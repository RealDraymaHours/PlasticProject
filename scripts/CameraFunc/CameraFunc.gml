// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_shake(Time,Intensity)
{
	with(oGame)
	{
		oGame.Intensity = Intensity;
		alarm[0] = Time;
		screenShake = true;
	}
}


function camera_zoom(Amount, Speed)
{

	oGame.Multiplier = Amount;
	oGame.Speed = Speed;

}

function camera_reset(Speed)
{
	oGame.Multiplier = 12;
	oGame.Speed = Speed;
}
