instance_destroy(oPlayer);
instance_destroy(oShotgun);
audio_stop_all();

oGame.inventory = array_create(0);

alarm[0] = 60;