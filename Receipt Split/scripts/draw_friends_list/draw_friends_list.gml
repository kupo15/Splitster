
function draw_friends_list() {
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Friends List");

if draw_submenu_friends_list(header_height,room_width,20)
screen_change(screen.friendsProfile)

if androidBack
	{
	if !kvActive
	screen_goto_prev();
	}

if keyboard_check_pressed(vk_enter)
scr_friend_create();

}