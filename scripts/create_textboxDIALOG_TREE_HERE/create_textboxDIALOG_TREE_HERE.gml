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
	}
}