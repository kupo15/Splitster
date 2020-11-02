
function draw_submenu_friends_list(yy,ww,rows) {
	
var xx = 50;
var ysep = 90;
var height = 45;

yy += ysep;

var hh = room_height-yy;
rows = hh/ysep;

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
			
		draw_text_height_middled(xx,yy+(off_pos*ysep),name,ysep,height); // draw name
	
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

// draw search bar
var col = make_color_rgb(140,238,255);
draw_list_searchbar(0,yy-ysep,"Enter name",height,ww,ysep,col,submenu);

return false;
}