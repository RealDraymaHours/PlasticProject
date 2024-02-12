var kLeft = global.kUp;
var kRight = global.kDown;
var accept_key = global.kAction;
var kQuick = global.kRun;




if kQuick
{
	drawIt = true;
	accept_key = global.kAction;
}
else
{
	accept_key = global.kActionRelease;
}




textbox_x = camera_get_view_x(view_camera[0])-2;

if down
{
	textbox_y = camera_get_view_y(view_camera[0]) + 106;
}
else
{
	textbox_y = camera_get_view_y(view_camera[0]) + 4;
}

if !setup
{
	setup = true;
	
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	page_number = array_length(text);
	for (var i = 0; i < page_number; i += 1)
	{
		//find how many characters
		text_length[i] = string_length(text[i]);
		
		//get offset 
		text_x_offset[i] = 61 //with portrait on right
		portrait_x_offset[i] = 4 //with portrait on right
				
		if speaker_side[i] == 1
		{
			text_x_offset[i] = 4 //with portrait on left
			portrait_x_offset[i] = 228 //with portrait on left
		}
		else if speaker_sprite[i] == sPointer
		{
			text_x_offset[i] = 34 //with portrait on left
			portrait_x_offset[i] = 0 //with portrait on left
		}
		//text_x_offset[i] = 16; //without portrait	
		
		var backstorage = 0;
		for (var c = 0; c < text_length[i]; c++)
		{
			var _char_pos = c+1;
			
			char[c,i] = string_char_at(text[i],_char_pos);

			
			//get current width
			 var txt_up_to_char = string_copy(text[i],1,_char_pos);
			 var _current_txt_w = string_width(txt_up_to_char) - string_width(char[c,i]);
			 
			 //get last free space
			 if char[c,i] == "\n" 
			 {
				line_break_pos[line_break_num[i] ,i] = last_free_space;
				line_break_num[i]++;
			};
			
			if char[c,i] == "$"
			{
				backstorage += string_width("$");
			}
			
			 if char[c,i] == " " {last_free_space = _char_pos+1};
			 
			 //get the line breaks
			 if _current_txt_w - line_break_offset[i]-backstorage > line_width-3
			 {
				backstorage = 0;
				line_break_pos[line_break_num[i] ,i] = last_free_space;
				line_break_num[i]++;
				var txt_up_to_last_space = string_copy(text[i],1,last_free_space);
				var last_free_space_string = string_char_at(text[i], last_free_space);			
				line_break_offset[i] = string_width(txt_up_to_last_space) - string_width(last_free_space_string);
			 }		 
		}
		
		var curLine = 0;
		backstorage = 0;
		
		for(var c = 0; c < text_length[i]; c++)
		{				
			var char_pos = c+1;

			
			var txt_x = text_x_offset[i] + border;
			var txt_y = textbox_y + border;
			
			//get current width
			 var txt_up_to_char = string_copy(text[i],1, char_pos);
			 var _current_txt_w = string_width(txt_up_to_char) - string_width(char[c,i]);
			 var txt_line = 0;
			 
			 for (var lb = 0; lb < line_break_num[i]; lb++)
			 {
				if char_pos >= line_break_pos[lb,i]
				{
					var str_copy = string_copy(text[i], line_break_pos[lb,i], char_pos-line_break_pos[lb,i]);
					_current_txt_w = string_width(str_copy);
					
					
					txt_line = lb+1;
				}
			 }
			 
			 if curLine != txt_line
			 {
				curLine = txt_line;
				backstorage = 0;
			 }
			 
			
			if char[c,i] == "$"
			{
				backstorage += string_width("$");
				char[c,i] = "";
			}
			
			
			 
			 char_x[c,i] = txt_x+_current_txt_w-backstorage;
			 char_y[c,i] = txt_line*line_sep;
			
		}
	}
	
	
	
	
}


if drawIt
{

#region text typewriter effect

//typing
if text_pause_timer <= 0
{
	if draw_char < text_length[page]
	{
		endOfTextbox = false;
		draw_char += text_spd;
		draw_char = clamp(draw_char,0,text_length[page]);
		var check_char = string_char_at(text[page], draw_char);
		if check_char == "." || check_char == "!" || check_char == "?" || check_char == "," || check_char == "-"
		{
			text_pause_timer = text_pause_time;
			voice_count++;
		}
		else
		{
			//typing sound
			if voice_count < voice_delay
			{
				voice_count++;
			}
			else
			{
				voice_count = 0;
				var pitch = random_range(0.8, 1.2);
				audio_play_sound(voice[page],100,false,1,0,pitch);
			}
		}
	}
	else
	{
		endOfTextbox = true;
	}
}
else
{
	text_pause_timer--;	
}

if accept_key
{
	//check if typing is done
	if draw_char == text_length[page]
	{	
		
		if page < page_number-1
		{
			play_Effect[page+1]();
			page++;
			draw_char = 0;
			audio_play_sound(EquipSomething,100,false);
		}
		else
		{
			
			
			global.StopMoving = false;
			
			if kQuick
			{
				if option_number > 0
				{
					if option[option_pos] != ""
					{
						skipSave = true
						alarm[2] = 3;
					}
					else
					{
						create_textbox(option_link_id[option_pos],Caster_id);	
						instance_destroy();
						//audio_play_sound(EquipSomething,100,false);
					}
				}
				else
				{
					//disable_accept();
					instance_destroy();
				}
			}
			else if !skipSave
			{
				//link text with options
				if option_number > 0
				{
					create_textbox(option_link_id[option_pos]);	
					audio_play_sound(EquipSomething,100,false);
				}
				//alarm[1] = 20;
				instance_destroy();
			}
			
		}
	}
	else
	{
		draw_char = text_length[page];
		
	}
}

#endregion




#region draw the textbox

//box variable
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);


#region options
if ((draw_char == text_length[page]) && (page == page_number - 1))
{
	
	if down
	{
		option_pos += kRight - kLeft;
	}
	else
	{
		option_pos += kLeft - kRight;
	}

	option_pos = clamp(option_pos,0, option_number-1);		
	var _op_space = 15;
	var _op_bord = 4;
	for(var op = 0; op < option_number; op++)
	{
		if down
		{
			var theY = _txtb_y - _op_space*option_number + _op_space*op;
		}
		else
		{
			var theY = (_txtb_y + txtb_spr_h*2) + _op_space*option_number - _op_space*op;
		}
		
		if option[op] != ""
		{
			endOfTextbox = false;
			
			//option box
			var _o_w = string_width(option[op]) + _op_bord*2;
			draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 10, theY, _o_w/txtb_spr_w,(_op_space-1)/txtb_spr_h,0,c_white,1);
		
			//arrow
			if option_pos == op
			{
				draw_sprite(sPointer,0,_txtb_x, theY);	
			}
		
			//option text
			if op != option_pos
			{
				draw_text_color(_txtb_x + 10 +_op_bord,theY + 2, option[op],c_white, c_white, c_white,c_white,1);
			}
			else
			{
				draw_text_color(_txtb_x + 10 +_op_bord,theY + 2, option[op],c_red, c_red, c_red,c_red,1);
			}
		}
	}
}
#endregion

#region Portrait

if speaker_sprite[page] != sPointer
{
	//Portrait
	sprite_index = speaker_sprite[page];
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1{_speaker_x += sprite_width;}
	
	draw_sprite_ext(txtp_spr, txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w,sprite_height/txtb_spr_h,0,c_white,1);
	
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page],1,0,c_white,1);
	
	//Name
	if myName[page] != ""
	{
		
		var strLength = string_width(myName[page]);
	
		var theFuckingY = textbox_y+54;
		
		if down
		{
			theFuckingY = textbox_y-18;
		}
		
		var theFuckingX = textbox_x + portrait_x_offset[page]+29-(strLength/2);
		//58
		draw_sprite_stretched(sMenu,0,theFuckingX-2,theFuckingY,strLength+7,16);
		draw_text_color(theFuckingX+2,theFuckingY+3,myName[page],c_white,c_white,c_white,c_white,1);
	}
	
}


#endregion

//the box
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0,c_white,1);

//text variables
//var _drawtext = string_copy(text[page], 1, draw_char);
//the text
//draw_text_ext_color( _txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width,c_white,c_white,c_white,c_white,1);


for(var c = 0; c < draw_char; c++)
{
	var c_ = col_1[c,page];
	//draw_text_ext_color( _txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width,c_white,c_white,c_white,c_white,1);
	draw_text_ext_color(textbox_x+char_x[c,page],(textbox_y + border)+char_y[c,page],char[c,page],line_sep,line_width,c_,c_,c_,c_,1);
}

if endOfTextbox
{
	var strLength = string_width("SPACE");
	
	
	var txtx = textbox_x+(camera_get_view_width(view_camera[0])/2)-strLength/2;
	
	var txty = textbox_y+44;
	
	var boxx = txtx-3;
	var boxy = txty-3;
	
	draw_sprite_stretched(sMenu,0,boxx,boxy,strLength+5,14);
	draw_text_color(txtx,txty,"SPACE",c_red,c_red,c_red,c_red,1);		
}
//draw_text_color(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, c_white,c_white,c_white,c_white,1);

#endregion

}