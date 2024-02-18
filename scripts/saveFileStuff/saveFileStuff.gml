// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_trigger(ThingToSave)
{
	ini_open("Savefile.sav");
		ini_write_real("Save1",ThingToSave, true);
	ini_close();
}

function load_triggers()
{
	if (file_exists("Savefile.sav"))
	{
		ini_open("Savefile.sav");
			oMainMenu.GotEndingA = ini_read_real("Save1","EndingA",false);
			oMainMenu.GotEndingB = ini_read_real("Save1","EndingB",false);
			oMainMenu.GotEndingC = ini_read_real("Save1","EndingC",false);
			oMainMenu.GotEndingD = ini_read_real("Save1","EndingD",false);
			oMainMenu.GotEndingE = ini_read_real("Save1","EndingE",false);
			oMainMenu.GotEndingF = ini_read_real("Save1","EndingF",false);
			oMainMenu.GotEndingG = ini_read_real("Save1","EndingG",false);
			oMainMenu.GotEndingS = ini_read_real("Save1","EndingS",false);
		ini_close();
	}
}