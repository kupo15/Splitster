
function draw_friends_list() {
	
// draw the 3 bars
draw_screen_header("Friends List",60);

var ysep = 85;

if draw_submenu_friends_list(30,header_height+ysep,room_width,60,ysep,8)
screen_change(screen.friendsProfile)

if android_back
	{
	if !kv_active
	screen_goto_prev();
	}

if keyboard_check_pressed(vk_enter)
scr_friend_create();

}