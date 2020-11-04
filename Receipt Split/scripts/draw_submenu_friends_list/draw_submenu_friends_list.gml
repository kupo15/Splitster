
function draw_submenu_friends_list(yy,ww,ysep,ref_list,offsetStr) {
	
var searchbar_hh = ysep*0.75;
var xx = 120;
var height = 45;

yy += searchbar_hh;

var hh = room_height-yy;
var rows = hh/ysep;


scr_searchbar(ref_list);

// if searching for a name, swap lists
if searched_name != ""
ref_list = searchedList;

var list_size = ds_list_size(ref_list);
var kvoff = kvHeight/ysep;
var test_passed = yy+(list_size*ysep)+kvHeight > room_height;
var list_ext = list_size+(kvoff*test_passed);

// push the list up out of the way of the keyboard
if scr_timer_highlight_action(highlightAction.newFriend)
	{
	click_textbox_set(friend_name_entry,0,kbv_type_default,kbv_returnkey_next);
	mode_new_member = true;
	
	var test_passed = yy+(list_size*ysep)+kvHeight > room_height;
	var list_ext = list_size+(kvoff*test_passed);

db(test_passed)
	if test_passed
	scrollbar_speed[0] = -flick_max*1.1;
	}

	
if !mode_new_member && (list_ext < rows)
variable_instance_set(id,offsetStr,0);
		
var offset_value = variable_instance_get(id,offsetStr);
var pos_start = floor(offset_value);
var pos_end = min(list_size,ceil(offset_value)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-offset_value;
	var off_pos = (off_ind*ysep);
	var friend_pointer = ref_list[| i];
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
	if click_region_released_clamp(0,yy,off_pos,ww,ysep,hh,mb_left,true,submenu,i,ref_list,undefined)
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
var offset_start_pointer = [self,offsetStr+"_start"];
var offset_pointer = [self,offsetStr];
var scrollbar_index = 0;
var sub = submenu;

funct_screen_scrolling(0,yy,ww,hh,ysep,list_ext,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

	
if virtual_keyboard_enter
	{
	if friend_name_entry == ""
		{
		mode_new_member = false;
		vk_hide();
		}
	else
		{
		searched_name = "";
		scr_friend_create(capitalize(friend_name_entry),undefined);
		variable_instance_set(id,offsetStr,offset_value+1);
		}
	}

// draw search bar
var col = make_color_rgb(140,238,255);
draw_list_searchbar(0,yy-searchbar_hh,"Enter name",height,ww,searchbar_hh,col,submenu);

// if no results
if searched && (list_size == 0) 
	{
	draw_text_height(xx+30,yy+10,"no results!",height); // draw no results
	}

if androidBack && mode_new_member
	{
	//androidBack = false;
	mode_new_member = false;
	}

return false;
}