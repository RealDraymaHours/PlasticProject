function add_textbox_text(Text)
{
	//makeTheFaceEnum()
	text_set_defaults_for_dialog();
	
	text[page_number] = Text;
	myName[page_number] = "";
	
	
	voice[page_number] = sndVoice;
	speaker_side[page_number] = 0;
	speaker_sprite[page_number] = sPointer;

		
	if argument_count > 1
	{
		play_Effect[page_number] = argument[1];
	}
	else
	{
		play_Effect[page_number] = function(){};	
	}

	
	page_number++;
	
}

function text_set_defaults_for_dialog()
{
	for (var c = 0; c < 500; c++)
	{
		col_1[c,page_number] = c_white;	
	}
	
	line_break_pos[0,page_number] = 0;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
		
}

function add_text_color(c_)
{
	var startPos = -1;
	var endPos = -1;
	var whichOne = 0;
	
	if argument_count > 1
	{
		whichOne = argument[1] * 2;
	}
	
	var txt = text[page_number-1];
	var pagenum = page_number-1;
	
	var i = 0;
	while (i < string_length(txt))
	{
		var check_char = string_char_at(text[pagenum], i);
		if check_char == "$"
		{
			if whichOne != 0
			{
				whichOne--;
			}
			else
			{
				if startPos = -1
				{
					startPos = i;
				}
				else if endPos = -1
				{
					endPos = i-1;	
				}
				else
				{
					break;	
				}
			}
		}
		
		i++;
	}
	
	if ((startPos != -1) && (endPos != -1))
	{
		for (var c = startPos; c <= endPos; c++)
		{
			col_1[c, pagenum] = c_;	
		}
	}
	//for (var c = string)	
}