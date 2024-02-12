// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function theMassiveFuckingScriptWithAllTheDialogSoItsEasierToFindLater()
{

say = 
{
	TestChoice : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		var func = function(){camera_shake(10,10)}
		add_textbox_text("Testing the $first$ text.");
		add_text_color(c_red)
		add_textbox_text("Testing if the amount of text spills out to the next line on the right places and the like I am just typing probably shit will spill over the screen but you just need to do some shit you know.");
		add_textbox_text("With this one you will get a camera shake.", func);
		add_textbox_text("Finally you should get a choice.");
			add_textbox_option("I want to hear yes", "TestYes");
			add_textbox_option("I want to hear no", "TestNo");	
	}}),	
	TestNo : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("NO.");
	}}),	
	TestYes : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("YES.");
	}}),	
	
	CatHello : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("Meow, Meow. \n$(I pooped on your pillow and there is nothing you can do about it)$ ");
		add_text_color(c_aqua)

	}}),
	
	MainHallNote : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("Remember the \n$3 tenants of eating plastic noodles$. ");
		add_text_color(c_red);
		add_textbox_text("1: Eat from a bowl!");
		add_textbox_text("2: Always cook the noodles in hot water!");
		add_textbox_text("3: Wait *@&*)@ times so the noodles \nare just right!");
		add_textbox_text("Those who do not follow these tenants shall #&@#*@ after consum#*(@ the @*(#)(@%()");
		add_textbox_text(" $Some of the text seems to have \n been eaten by a cat.$ ");
		add_text_color(c_aqua);

	}}),
	
	UncleStart : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("Hey little one! \nWill you help your uncle out?");
		add_textbox_text("I need to check something but I need two people for that.");
			add_textbox_option("YA! I'll help you uncle!", "UncleYes");
			add_textbox_option("Nuh uh!", "UncleNo");	

	}}),
	UncleYes : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		var changetogun = function(){npcUncle.sprite_index = sUncleShotgun;}
		
		add_textbox_text("Thats my girl!");
		add_textbox_text("You see I have this shotgun but I forgot if I loaded it with blanks or live rounds!",changetogun);
		add_textbox_text("Stand still so I can test it out!");
		
		if irandom(100) > 30
		{
			var func = function()
			{
				audio_play_sound(sndNoAmmo,999,false);
			}
		}
		else
		{
			var func = function()
			{
				audio_play_sound(sndShotgun,999,false,10);
				instance_destroy(oTextbox);
				game_restart();
			}
		}
		add_textbox_text("...",func);
		add_textbox_text("Hmmm");
		add_textbox_text("I swear there where live rounds in there...");
		
		var anofunc = function(){npcUncle.sprite_index = sUncleShotgunSelf;}
		
		add_textbox_text("Maybe the gun is just broken?",anofunc);
		add_textbox_text("Hmmm...");
		
		var endfunc = function()
		{
			with npcUncle
			{
				audio_play_sound(sndShotgun,999,false);
				var gun = instance_create(x-20,y+3,oShotgunPickup);
				gun.image_angle = 90;
				
				//ADD DESTRUCTION ANIMATIONS LATER!
				instance_destroy(oTextbox);
				ww = sprite_get_width(sprite_index); //we need to know how wide
				hh = sprite_get_height(sprite_index); //and how tall our sprite is
				chunk = 4; //this is how big your chunks will be in pixels

				for (i=0;i<ww;i+=chunk) { //we loop 4 pixel at a time all the way across
				    for (j=0;j<hh;j+=chunk) { //while picking all the vertical pixels in each column
				        		particle = instance_create(x-sprite_get_xoffset(sprite_index)+i,y-sprite_get_yoffset(sprite_index)+j,oDeathParticle); //we create a particle relative to the object, offset by the proper amount
				        		particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
				        		particle.size = chunk;
				        		particle.xx = i; //we'll need the particles to have these values so they can draw the right part of the sprite
				        		particle.yy = j;
				    }
				}

				state = 3;
				
			}
		}
		add_textbox_text("Hmmm...",endfunc);

	}}),
	
	GotShotgun : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false);
		
		add_textbox_text("You got a $Shotgun$!");
		add_text_color(c_red);
	}}),
}

}