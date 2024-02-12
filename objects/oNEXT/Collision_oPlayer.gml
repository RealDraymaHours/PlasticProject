if global.kActionRelease && canWarp
{
	oPlayer.x = xx;
	oPlayer.y = yy;
	oGame.followX = xx;
	oGame.followY = yy;
	room_goto(next_room);
}