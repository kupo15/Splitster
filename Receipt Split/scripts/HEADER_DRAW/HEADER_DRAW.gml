
function draw_screen_header(header_left,header_right,header_string,height) {

if height == undefined
height = header_font_height;

var xx = room_width*0.5;
var yy = (header_height-height)*0.5;
var ww = 540;
var hh = header_height;

draw_rectangle_color(0,0,ww,hh,header_color,header_color,header_color,header_color,false);

if header_string != ""
	{
	draw_set_halign(fa_center);	
	draw_text_height_color(xx,yy,header_string,height,c_white);
	draw_set_halign(fa_left);
	}

var xpos = 0;
var region = header_height;
var header_type = header_left;
repeat 2
	{
	if header_type == headerType.bars
		{
		// draw the 3 bars
		var ww = 30;
		var hh = 24;
		var xx = (region-ww)*0.5;
		
		draw_menu_bars(xpos+xx,header_height*0.5,ww,hh,2,c_white);

		// clicked on bars
		if (submenu < 0) && !mode_delete
		if click_region_released(xpos,0,region,region,true,submenu)
			{
			submenu_previous = submenu;
			submenu = navbar.sidebar;
	
			submenu_menu_xpos = 0;
			screen_darken_value = darken_index.sidebar;
			}
		}
	else if header_type == headerType.dots
		{
		// draw the 3 dots
		draw_menu_dots(xpos+(region*0.5),header_height*0.5,3,7,c_white);
		
		click_region_released(xpos,0,region,region,true,submenu)

		}
	else if header_type == headerType.back
		{
		draw_menu_arrow(xpos+20,header_height*0.5,40,30,4,1,c_white);

		if click_region_released(xpos,0,region,region,true,submenu)
		screen_goto_prev();
		}
		
	var header_type = header_right;
	var xpos = room_width-region;
	}
	
// other header overwrite
draw_header_delete(0,0,ww,hh);
}

function draw_header_delete(xx,yy,ww,hh){
	
draw_set_alpha(header_delete_offset_disp);

var col = c_gray;
draw_rectangle_color(0,0,ww,hh,col,col,col,col,false);

draw_menu_xout(xx+32,yy+35,35,35,5,c_white); // draw xout

if mode_delete && click_region_released(0,0,hh,hh,c_yellow,navbar.hidden)
mode_delete = false;


var height = 50;
var count = 0;
var size = ds_list_size(delete_list);

for(var i=0;i<size;i++)
count += delete_list[| i];

draw_set_color(c_white);
draw_text_height(xx+120,yy+35,string(count)+" selected",height); // draw number of items to delete

// clicked on trash
draw_sprite_ext(ico_trash2,0,xx+450,yy+20,0.7,0.7,0,c_white,header_delete_offset_disp); // trash icon

if mode_delete && click_region_released(room_width-125,0,125,hh,c_yellow,navbar.hidden)
delete_list_delete(delete_list,mode_delete_list_id);

draw_set_color(c_black);
draw_set_alpha(1);
}







