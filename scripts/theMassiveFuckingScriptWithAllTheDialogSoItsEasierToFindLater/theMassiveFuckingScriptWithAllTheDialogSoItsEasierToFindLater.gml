// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function theMassiveFuckingScriptWithAllTheDialogSoItsEasierToFindLater()
{

say = 
{
	#region All the game text
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
	
	Welcome : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		add_textbox_text("Its that time of the day again when its way too late but you remember you are starving!");
		add_textbox_text("You set your gaming time on hold to get something to eat!");
		add_textbox_text("Sadly there is very little to eat in this house.");
		add_textbox_text("You remember however there should still be some $Plastic Noodles in the fridge$.");
		add_text_color(c_red);
		add_textbox_text("Your quest to eat plastic noodles BEGINS NOW!!!");

	}}),
	
	Computer : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		if check_inventory(global.items.videoGame)
		{
			instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding).theEnding = Rm_Ending_G;
		}
		else
		{
			add_textbox_text("Some random person on reddit said 8 years ago that the true number is $7$. Whatever that means...");
			add_text_color(c_red);
		}
	}}),	
	
	GotBowl : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_textbox_text("You got THE $Bowl$!");
		add_text_color(c_red);
		add_textbox_text("The holy artifact hidden by your family \nis now finally in your hands!");
	}}),
	
	GotGame : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_textbox_text("You got the $newest AAA Game$!");
		add_text_color(c_red);
	}}),
	
	GotBucket : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		
		
		add_textbox_text("You got a $Bucket$!");
		add_text_color(c_red);
	}}),
	
	//Main Hall
	CatHello : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		if check_inventory(global.items.fish) && !check_inventory(global.items.lighter) && !check_inventory(global.items.WaterWarm) 
		{
			audio_play_sound(sndNewItem,999,false,0.5);
			
			add_textbox_text("The cat ate the fish, finally full it pooped out your lighter so... \nYOU GOT A $LIGHTER$!!!");
			add_text_color(c_red);
			
			for (var i = 0; i < array_length(oGame.inventory); i++)
			{
				if oGame.inventory[i] = global.items.fish
				{
					array_delete(oGame.inventory,i,1);
				}
			}
			
			add_to_inventory(global.items.lighter);
			
		}
		else
		{
			add_textbox_text("Meow, Meow. \n$(I pooped on your pillow and there is nothing you can do about it)$ ");
			add_text_color(c_aqua);
		}
		

	}}),
	
	MainHallSink : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("Its moments like these where you really wish you would pay your water bills.");
	}}),
	
	MainHallFire : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		
		if check_inventory(global.items.WaterWarm)
		{
			add_textbox_text("You realize that paying bills is important.");
		}
		else if !check_inventory(global.items.lighter)
		{
			add_textbox_text("You still have gas, but you cannot light it without the $lighter the cat ate$...");
			add_text_color(c_red);
		}
		else if !check_inventory(global.items.Water)
		{
			add_textbox_text("You have nothing that needs fire.");	
		}
		else
		{
			
			for (var i = 0; i < array_length(oGame.inventory); i++)
			{
				
				if oGame.inventory[i] = global.items.lighter
				{
					array_delete(oGame.inventory,i,1);
				}
			}
			
			for (var i = 0; i < array_length(oGame.inventory); i++)
			{
				if oGame.inventory[i] = global.items.Water
				{
					array_delete(oGame.inventory,i,1);
				}
			}
			
			
			
			
			add_to_inventory(global.items.WaterWarm);
			
			audio_play_sound(sndNewItem,99,false);
			
			add_textbox_text("You got $Boiling water$!");	
			add_text_color(c_red);
		}
	}}),
	
	MainHallFridge : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		if check_inventory(global.items.noodles)
		{
			add_textbox_text("Nothing of value in the fridge");
		}
		else
		{
			add_textbox_text("You found $Plastic Noodles$!!!");
			add_text_color(c_red);
			
			audio_play_sound(sndNewItem,999,false,0.5);
			add_to_inventory(global.items.noodles);
		}
		
	}}),
	
	MainHallNote : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		add_textbox_text("Before eating the $noodles at the table$ remember the \n$3 tenants of eating plastic noodles$. ");
		add_text_color(c_red);
		add_text_color(c_red,1);
		add_textbox_text("1: Eat from a bowl!");
		add_textbox_text("2: Always cook the noodles in hot water!");
		add_textbox_text("3: Wait *@&*)@ times so the noodles \nare just right!");
		add_textbox_text("Those who do not follow these tenants shall #&@#*@ after consum#*(@ the @*(#)(@%()");
		add_textbox_text(" $Some of the text seems to have \n been eaten by a cat.$ ");
		add_text_color(c_aqua);

	}}),
	
	
	Table : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		if check_inventory(global.items.noodles)
		{
			add_textbox_text("You combine everything you have and sit down at the table.");
			add_textbox_text("Do you eat the noodles now or wait for a bit?");
				add_textbox_option("Eat", "TableEat");
				add_textbox_option("Wait", "TableWait");	
		}
		else
		{
			add_textbox_text("You have no noodles to eat.");
		}
		
			

	}}),
	
	TableWait : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		
		
		add_textbox_text("Wait some more or eat?");
			add_textbox_option("Eat", "TableEat");
			add_textbox_option("Wait", "TableWait");	

	}}),
	
	
	//Uncle
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
				with instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding)
				{
					theEnding = Rm_Ending_D;
					fade = 100;
				}
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
				NpcGoesBoom();	

				state = 3;
				
			}
		}
		add_textbox_text("Hmmm...",endfunc);

	}}),
	GotShotgun : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_textbox_text("You got a $Shotgun$!");
		add_text_color(c_red);
	}}),
	GotCowboy : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_textbox_text("You got a $Cowboy hat$!");
		add_text_color(c_red);
		add_textbox_text("Now you are a real cowgirl!");
	}}),
	
	
	//Outside
	
	GotRod : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_textbox_text("You got a $Fishing Rod$!");
		add_text_color(c_red);
	}}),
	
	GotWater : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		for (var i = 0; i < array_length(oGame.inventory); i++)
		{
			if oGame.inventory[i] = global.items.Bucket
			{
				array_delete(oGame.inventory,i,1);
			}
		}
		
		add_to_inventory(global.items.Water)
		
		add_textbox_text("You got $Cold Water$!");
		add_text_color(c_red);
	}}),
	
	
	Fish : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){
		if check_inventory(global.items.fishingRod)
		{
			add_textbox_text("Fish?");
				add_textbox_option("YA!", "FishYes");
				add_textbox_option("Nuh uh!", "FishNo");
			
			if check_inventory(global.items.Bucket)
			{
				add_textbox_option("Take the water into the bucket", "FishBucket");
			}
		}
		else if check_inventory(global.items.Bucket)
		{
			add_textbox_text("Take the water?");
				add_textbox_option("YA!", "FishBucket");
				add_textbox_option("Nuh uh!", "FishNo");
		}
		else
		{
			add_textbox_text("Water? \nWater!");	
		}

	}}),
	
	FishYes : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		add_textbox_text("You got a $Fish$!!!");
		add_text_color(c_red);
		
		audio_play_sound(sndNewItem,999,false,0.5);
		
		add_to_inventory(global.items.fish);
		
		var fishCount = 0;
		
		for(var i = 0; i < array_length(oGame.inventory); i++)
		{
			if oGame.inventory[i] = global.items.fish
			{
				fishCount++;	
			}
		}
		
		if fishCount > 2
		{
			instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding).theEnding = Rm_Ending_F;	
		}
	}}),
	
	GoOut : new speech(function(){var txt = instance_create(x,y,oTextbox);with (txt){		
		
		add_textbox_text("This is the road to the great outside world.");
		add_textbox_text("A world where there is no respawning nor can you get items by selling funny pictures of yourself to depraved losers.");
		add_textbox_text("Okey maybe that last one still applies to the real world.");
		
		
		if check_inventory(global.items.cowboyHat)
		{
			var func2 = function()
			{
				oPlayer.hspeed = -1;
				oPlayer.sprite_index = sPlayerSideRunCowboy;
				oPlayer.image_xscale = -1;
				
				instance_create_layer(oPlayer.x,oPlayer.y,"game_layer",oFadeToEnding).theEnding = Rm_Ending_C;	
				
				instance_destroy();
			}
			
			add_textbox_text("But you who faced great dangers.");
			add_textbox_text("You who managed to change yourself into a REAL COWGIRL.");
			add_textbox_text("You now can truly face the real world!");
			add_textbox_text("...",func2);
		}
		else
		{
			var func = function(){oPlayer.x += 5;}
			add_textbox_text("Either way you are not confident enough to face the real world.",func);
			add_textbox_text("Only a real cowgirl can face the real world!",func);	
		}
		
		//add_text_color(c_red);
	}}),
	#endregion
	
	#region Endings
		EndingA : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			save_trigger("EndingA");
			
			add_textbox_text("You didn't see your cat. You saw Bena, your old army comrade.");
			add_textbox_text("You remembered how he once stole your chocolate bar.");
			add_textbox_text("Back then in the trenches you only shot him in the leg... and then 23 times in the chest and head, needing to reload multiple times.");
			add_textbox_text("After that you went to the freshly occupied enemy town to drink your sorrows away.");
			add_textbox_text("But the image of your chocolate bar being eaten right in front of you never left your mind.");
			add_textbox_text("You killed all the civilians and prisoners of war...");
			add_textbox_text("You didn't destroy any building that wasn't a hospital, church or orphanage.");
			add_textbox_text("You basicly used the geneva convention as a checklist.");
			add_textbox_text("All of this could have been avoided if Bena just didn't eat your chocalate bar.");
			add_textbox_text("When you saw your cat eating, it reminded you of all of this and just like with Bena, you pulled the trigger.");
			add_textbox_text("Ending $A$: \n$A$ctual Warcrimes.");
			add_text_color(c_red);
			add_text_color(c_red,1);

		}}),	
		
		EndingB : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			save_trigger("EndingB");
			
			add_textbox_text("Before going on this adventure you forgot one important fact... \nYou are a true gamer.");
			add_textbox_text("You would think that the weight of all these small items wouldn't be a problem but you are not a normal person.");
			add_textbox_text("Never leaving your home and always sitting in front of your PC made your body weak.");
			add_textbox_text("Only eating cupped noodles and drinking mounten dew made it so that your bones where practicly made out of paper.");
			add_textbox_text("In short: You would lose an arm wrestling contest to a todler even if you where doping.");
			add_textbox_text("The items pinned you down but didn't kill you.");
			add_textbox_text("You lay there forever more. After a while you get reminded of another aspect of your gamerhood.");
			add_textbox_text("The fact that you shower once every 3 months became a real problem now that in this situation you started to actually smell yourself.");
			add_textbox_text("Ending $B$: \n$B$ad under presure.");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),	
		
		
		EndingC : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			
			save_trigger("EndingC");
			
			add_textbox_text("A real cowgirl does whatever she pleases!");
			add_textbox_text("A real cowgirl takes whatever she pleases!");
			add_textbox_text("If that horse looks nice then you just take it!");
			add_textbox_text("But damn the law is trying to tame the wild west!");
			add_textbox_text("You still manage to outshoot the funny blue people. The city is still overrun by them so its time to hit the road!");
			add_textbox_text("Being in the wild with only your horse made you realize how lonely you always where.");
			add_textbox_text("However you still managed to find companion ship in your horse.");
			add_textbox_text("He gives you that look at night... \nWell... \nYou ARE a white woman after all.");
			add_textbox_text("Ending $C$: \n$C$owgirl Rampage.");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),	
		
		EndingD : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			save_trigger("EndingD");
			
			add_textbox_text("...");
			add_textbox_text("Ending $D$: \nLuck of the $D$raw.");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),	
		
		EndingE : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			
			save_trigger("EndingE");
			
			add_textbox_text("However you cooked the noodles really made it a mess.");
			add_textbox_text("It tastes like nothing but also bad at the same time.");
			add_textbox_text("You throw up all over the floor before going back to your room in shame and defeat.");
			add_textbox_text("Ending $E$: \nStill an $E$mpty stomach.");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),	
		
		EndingF : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			
			save_trigger("EndingF");
			
			add_textbox_text("You played a game once. One where you wanted to fish.");
			add_textbox_text("Your pc at the time made it so you where watching a powerpoint presentation each time you played.");
			add_textbox_text("Thats why you enjoyed fishing so much, because it didn't need any frames.");
			add_textbox_text("But other people swarmed your fishing spot making it impossible for you to actually catch anything.");
			add_textbox_text("Now you can finally realize your dreams of a fishing spot that only you can use.");
			add_textbox_text("Ending $F$: \nThis is MY $F$ishing spot!");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),	
		
		EndingG : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			
			save_trigger("EndingG");
			
			add_textbox_text("You got your hands on the newest live service game called. Biggy Shooty 18!");
			add_textbox_text("You wanted to try it out before dinner.");
			add_textbox_text("What should have been a 10 minute playtest ended up as a 689 hour long marathon.");
			add_textbox_text("You forgot about everything, food, family, bathing and all that other crap that doesn't really matter.");
			add_textbox_text("You may have abandoned your quest for the noodles but you found a far greater quest:");
			add_textbox_text("That quest being to actually find something enjoyable in a bloody live service game...");
			add_textbox_text("Ending $G$: \nMuch $G$ame, No life!");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),
		
		EndingS1 : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			var func = function()
			{
				oFinalEndingThing.alarm[0] = 180;	
				instance_destroy();
			}
			
			add_textbox_text("The taste was perfect.");
			add_textbox_text("Perfect warmth with in a perfect bowl.");
			add_textbox_text("Yet you still don't know why there where so many steps to make it.");
			add_textbox_text("Its not like it tastes THAT good to make the effort worth it.");
			add_textbox_text("At least your stomach is filled.");
			add_textbox_text("...");
			add_textbox_text("You think you got a stomach ache from those noodles.");
			add_textbox_text("Your stomach is feeling weird and your vision is blurry.");
			add_textbox_text("Something is happening and you don't know what but one thing is for certain...");
			add_textbox_text("Its those noodle's fault!");
			add_textbox_text("Your head itches...");
			add_textbox_text("Your head itches unbearably...");
			add_textbox_text("GOD IT ITCHES SO BADLY!!!");
			add_textbox_text("AAAAAAH!!!",func);
			
		}}),
		EndingS2 : new speech(function(){var txt = instance_create(x,y,oTextboxEnding);with (txt){
			
			save_trigger("EndingS");
			
			add_textbox_text("Ending $S$: \nGod's $S$illiest Experiment!");
			add_text_color(c_red);
			add_text_color(c_red,1);
		}}),
	#endregion
}

}