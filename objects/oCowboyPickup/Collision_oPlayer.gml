add_to_inventory(global.items.cowboyHat);

sysNPC.say.GotCowboy.dialog();

with oPlayer
{
	sprIdleDown = sPlayerFrontIdleCowboy;
	sprIdleUp = sPlayerBackIdleCowboy;
	sprIdleSides = sPlayerSideIdleCowboy;

	sprRunDown = sPlayerFrontRunCowboy;
	sprRunUp = sPlayerBackRunCowboy;
	sprRunSides = sPlayerSideRunCowboy;
	
}

instance_destroy();

