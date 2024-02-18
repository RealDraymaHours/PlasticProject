//You do this via here if you want to have options in dialog. 
//If not then just do it via sysNPC.say.[THEDIALOG].dialog();

function create_textbox(Dialog_id)
{
	txtbox = instance_create(x,y,oTextbox);
	with (txtbox)
	{
			pick_dialog(Dialog_id);	
	}
}

function pick_dialog(Dialog_id)
{	
	switch(Dialog_id)
	{
		case("Test"):
			sysNPC.say.TestChoice.dialog();
		break;
		case("TestYes"):
			sysNPC.say.TestYes.dialog();
		break;
		case("TestNo"):
			sysNPC.say.TestNo.dialog();
		break;
		
		case("UncleYes"):
			sysNPC.say.UncleYes.dialog();
		break;
		
		case("FishYes"):
			sysNPC.say.FishYes.dialog();
		break;
		case("FishNo"):
		break;
		case("FishBucket"):
			sysNPC.say.GotWater.dialog();
		break;
		case("TableEat"):
			if npcTable.waitCount = 7 && check_inventory(global.items.WaterWarm) && check_inventory(global.items.bowl)
			{
				instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding).theEnding = Rm_Ending_S;		
			}
			else
			{
				instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding).theEnding = Rm_Ending_E;	
			}
		break;
		case("TableWait"):
			npcTable.waitCount++;
			sysNPC.say.TableWait.dialog();
		break;
	}
}