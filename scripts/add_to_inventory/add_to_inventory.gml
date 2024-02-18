// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_to_inventory(thingToAdd)
{
	array_push(oGame.inventory,thingToAdd);
	
	if array_length(oGame.inventory) > 5
	{
		instance_create(x,y,oFadeToEnding).theEnding = Rm_Ending_B;
	}
}

function check_inventory(ThingToCheck)
{
	for (var i = 0; i < array_length(oGame.inventory); i++)
	{
		if ThingToCheck == oGame.inventory[i]
		{
			return true;
			break;
		}
	}
	
	return false;
}