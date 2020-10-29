
function draw_splitcost() {
		
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Split Cost",60);
		
// draw friends list
var ysep = 85;
var xx = 30;
var ypos = header_height+(ysep*4)
var diff = room_height-ypos+ysep;
var yy = ypos+(diff*friendsbar_yoff_start);

draw_submenu_friends_list(xx,yy,room_width,60,ysep,6)


if android_back
	{
	if !kv_active
	screen_goto_prev();
	}
	
}