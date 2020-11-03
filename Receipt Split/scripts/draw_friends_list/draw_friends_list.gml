
function draw_friends_list() {

if keyboard_check_pressed(vk_enter) && !mode_new_member
scr_friend_create("",undefined);

if draw_submenu_friends_list(header_height,room_width,90,master_friends_list,"master_friends_list_offset")
screen_change(screen.friendsProfile)

// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Friends List");

if androidBack && !mode_new_member
	{
	if !kvActive
	screen_goto_prev();
	}


}