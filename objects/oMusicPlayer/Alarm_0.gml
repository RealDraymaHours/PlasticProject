audio_stop_all();
if !audio_is_playing(song)
{
	audio_play_sound(song,999,true,1);
}