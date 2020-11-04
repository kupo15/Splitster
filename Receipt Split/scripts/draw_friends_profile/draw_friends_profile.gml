
function draw_friends_profile() {
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Profile Info");

var xx = room_width*0.5;
var yy = 175;
var ysep = 75;
var height = 80;
var text_yoff = (ysep-height)*0.5;

var name = friend_id.dispName;
draw_set_halign(fa_center);
draw_text_height(xx,yy,name,height);

// edit button
var xx = 330;
var yy = 800;
var ww = 540-xx;
var hh = 100;

var height = 30;

draw_text_height(xx+(ww*0.5),yy+80,"Edit",height);

var sca = 80/sprite_get_height(spr_icon_edit);

draw_sprite_ext(spr_icon_edit,0,xx+70,yy,sca,sca,0,c_white,1); // draw edit icon
click_region_released(xx,yy,ww,hh,true,navbar.hidden)

// clicked trash icon
var ww = 170;
var hh = 100;
var xx = 50;
var yy = 800;
	
if draw_button_trash(xx,yy,ww,hh,ico_trash1,c_red,screenIndex,navbar.hidden,true)
	{
	array_delete(master_friends_array,friend_index,1); // delete score
	// json_save(save_data);

	screen_goto_prev();
	friend_index = undefined;
	}


if androidBack
screen_goto_prev();

}