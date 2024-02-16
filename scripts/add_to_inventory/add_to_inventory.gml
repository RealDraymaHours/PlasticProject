// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_to_inventory(thingToAdd)
{
	array_push(oGame.inventory,thingToAdd);
	
	if array_length(oGame) > 5
	{
		//DO THING FOR ENDING		
	}
}