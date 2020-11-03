/*
function draw_submenu_friends_list(yy,ww,rows) {
	
var xx = 120;
var ysep = 90;
var height = 45;

yy += ysep;

var hh = room_height-yy;
rows = hh/ysep;

scr_searchbar(master_friends_list);

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
		var off_ind = i-master_friends_list_offset;
		var off_pos = (off_ind*ysep)-(kvActive*mode_new_member*400);
		var friend_pointer = master_friends_list[| i];
		var name = friend_pointer.dispName;
		var initial = string_char_at(name,1);	
		
		if name == "z"
			{
			draw_icon_enclosed(spr_icon_friend_add,0,35,yy+off_pos,60,60,ysep,c_orange,0);
			
			var text_yoff = (ysep-height)*0.5;

			if mode_new_member
			draw_text_height_ext_cursor(xx+5,yy+off_pos+text_yoff,friend_name_entry,"Type in friend's name",-1,ww,0,height,0);
			else
			draw_text_height_middled(xx,yy+off_pos,"New friend",ysep,height); // draw name

			draw_line_pixel(xx,yy+off_pos+ysep,room_width,1,c_black,0.7);

			if !mode_new_member && !mode_delete
			if click_region_released_clamp(0,yy,off_pos,ww,ysep,hh,mb_left,true,submenu,i,undefined,undefined)
				{
				click_highlight_action = highlightAction.newFriend;
				timer[timerIndex.highlightAction] = 5;
				}
				
			continue;
			}
			
		var col = c_lt_gray;
		draw_set_halign(fa_center);
		draw_circle_color(65,yy+off_pos+(ysep*0.5),30,col,col,false);
		draw_text_height_middled(65,yy+off_pos,initial,ysep,height);
		
		draw_set_halign(fa_left);
		draw_text_height_middled(xx,yy+off_pos,name,ysep,height); // draw name
	
		draw_line_pixel(xx,yy+off_pos+ysep,room_width,1,c_black,0.7);
								
		// click released on friend
		if click_region_released_clamp(0,yy,off_pos,ww,ysep,hh,mb_left,true,submenu,i,master_friends_list,undefined)
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
		
if virtual_keyboard_enter
	{
	if friend_name_entry == ""
		{
		mode_new_member = false;
		vk_hide();
		}
	else
		{
		scr_friend_create(capitalize(friend_name_entry),undefined);
		master_friends_list_offset ++;
		}
	}

// draw search bar
var col = make_color_rgb(140,238,255);
draw_list_searchbar(0,yy-ysep,"Enter name",height,ww,ysep,col,submenu);

if androidBack && mode_new_member
	{
	//androidBack = false;
	mode_new_member = false;
	}

return false;
}