
function draw_submenu_friends_list(yy,ww,rows) {
	
var xx = 50;
var ysep = 90;
var height = 45;
var text_yoff = (ysep-height)*0.5;

yy += ysep;

var hh = room_height-yy;
rows = hh/ysep;
db("88")
if searched_name != ""
	{
	if draw_search_list(xx,yy,ww,ysep,rows,height)
	return true;
	}
else
	{
	var list_size = ds_list_size(master_friends_list);
	var pos_start = floor(master_friends_list_offset);
	var pos_end = min(list_size,ceil(master_friends_list_offset)+rows);
	for(var i=pos_start;i<pos_end;i++)
		{
		var off_pos = i-master_friends_list_offset;
		var friend_pointer = master_friends_list[| i];
		var name = friend_pointer.dispName;
			
		draw_text_height(xx,yy+text_yoff+(off_pos*ysep),name,height); // draw name
	
		draw_line_pixel(xx,yy+((off_pos+1)*ysep),room_width,1,c_black,0.7);
				
		// click released on friend
		if click_region_released_clamp(0,yy,(off_pos*ysep),ww,ysep,hh,mb_left,true,submenu,i,master_friends_list,undefined)
			{
			if mode_delete
				{
				if can_delete
				delete_list[| i] = !delete_list[| i]; // toggle selected
			
				can_delete = true;
				}
			else // clicking on a friend
				{
				textboxIndex = noone;
				keyboard_string = "";
				vk_hide();
				
				friend_index = i;
				friend_id = friend_pointer;
				
				return true;
				}
			}
		}
	
	#region scrolling
	var offset_start_pointer = [self,"master_friends_list_offset_start"];
	var offset_pointer = [self,"master_friends_list_offset"];
	var scrollbar_index = 0;
	var sub = submenu;

	//funct_dialogue_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
	funct_screen_scrolling(0,yy,ww,hh,ysep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
	#endregion
	}
	
// type in search bar
if kvActive
switch textboxIndex
	{
	case -1: searched_name = string_capitalize(keyboard_string,22); break; // scr_input_text(22); break;
	}
	
scr_searchbar(master_friends_list);

#region draw search bar
xx = 0;
var col = make_color_rgb(140,238,255);
var text_yoff = (ysep-(height*0.8))*0.5;

draw_rectangle_color(xx,yy-ysep,xx+ww,yy,col,col,col,col,false);

// clicked on search bar
if click_region_released(xx,yy-ysep,ww-ysep-10,ysep,true,submenu)
	{
	searching = true;
	click_textbox_set(searched_name,-1,kbv_type_default,kbv_returnkey_done);
	}

// clear
var xWidth = 25;
draw_menu_xout(room_width-ysep+18,yy-ysep+30,xWidth,xWidth,4,c_black);

if click_region_released(room_width-ysep,yy-ysep,ysep,ysep,true,submenu)
	{
	keyboard_string = "";
	searched_name = "";
	}

draw_set_color(c_white);
if searched_name != ""
draw_text_height_ext_cursor(xx+70,yy+text_yoff-ysep,searched_name,searched_name,0,-1,ww-ysep-10,height*0.8,-1); // draw searched name
else
draw_text_height_entry(xx+70,yy+text_yoff-ysep,"Enter name",height*0.8,noone,-1,height*0.8,fn_italic); // draw course label

draw_sprite_ext(ico_search,0,xx+15,yy-ysep+25,0.35,0.35,0,c_white,1); // searchbar ico
#endregion

return false;
}