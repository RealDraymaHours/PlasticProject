#region Textbox parameters

depth = -9998;
skipSave = false;
mySpeech = "";
EffectColor = c_white;
endOfTextbox = false;
/*
vw = oCamera.view_width;
vh = oCamera.view_height;

txWdiff = 69.1;
txHdiff = 34.7; 

textbox_width = (vw / 100) * txWdiff;//220; //288
textbox_height = (vh / 100) * txHdiff; //52; //150
*/



Caster_id = self;
caster = self;

textbox_width = 255; 
textbox_height = 52; 

down = pointer_null;

txtb_spr = sMenu;
txtp_spr = sMenu;
txtb_img = 0;
txtb_img_spd = 6/60; //fps of sprite / fps of game

border = 6;
line_sep = 12;
line_width = textbox_width - border*2;

#endregion


#region Text

page = 0;
page_number = 0;
text[0] = "";

text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

#endregion



#region options

option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

#endregion


#region portrait

speaker_sprite[page_number] = sPointer;
speaker_side[page_number] = 1;

voice[page_number] = sndVoice;
voice_delay = 4;
voice_count = 3;

//names
myName[page_number] = "";

//effect shit
char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;
last_free_space = 0;

text_set_defaults_for_dialog();

play_Effect[page_number] = function(){};

#endregion
setup = false;
drawIt = false;

alarm[0] = 5;

text_pause_time = 16;
text_pause_timer = 0;
