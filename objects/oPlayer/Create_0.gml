enum dir
{
	up,
	left,
	right,
	down
	
}

facing = dir.up;
moving = false;


sprIdleDown = sPlayerFrontIdle;
sprIdleUp = sPlayerBackIdle;
sprIdleSides = sPlayerSideIdle;

sprRunDown = sPlayerFrontRun;
sprRunUp = sPlayerBackRun;
sprRunSides = sPlayerSideRun;

//I know this is stupid but I am lazy
touchedOther = false;

if place_meeting(x,y,oPlayer)
{
	touchedOther = true;
}
