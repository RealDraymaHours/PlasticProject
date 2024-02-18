if sprite_index != sUncleBlood
{
 NpcGoesBoom();
 sprite_index = sUncleBlood;
 instance_create(x,y,oFadeToEnding).theEnding = Rm_Ending_A;
}
