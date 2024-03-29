
function draw_screen_header(header_left,header_right,header_string,height) {

if argument[3] == undefined
height = header_font_height;

var xx = room_width*0.5;
var yy = (header_height-height)*0.5;
var ww = 540;
var hh = header_height;

draw_rectangle_color(0,0,ww,hh,header_color,header_color,header_color,header_color,false);

if header_string != ""
	{
	draw_set_halign(fa_center);	
	draw_text_height_color(xx,yy,header_string,c_white,height);
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
			submenuPrevious = submenu;
			submenu = navbar.sidebar;
	
			submenu_menu_xpos = 0;
			screen_darken_value = darken_index.sidebar;
			}
		}
	else if header_type == headerType.dots
		{
		// draw the 3 dots
		draw_menu_dots(xpos+(region*0.5),header_height*0.5,3,7,c_white);
		
		if (submenu < 0) && !mode_delete
		if click_region_released(xpos,0,region,region,true,submenu)
			{}
		}
	else if header_type == headerType.back
		{
		draw_menu_arrow(xpos+20,header_height*0.5,40,30,4,1,c_white);

		if (submenu < 0) && !mode_delete
		if click_region_released(xpos,0,region,region,true,submenu)
		screen_goto_prev();
		}
		
	var header_type = header_right;
	var xpos = room_width-region;
	}
	
// other header overwrite
draw_header_delete(0,ww,hh);
}

function draw_header_delete(yy,ww,hh){
	
draw_set_alpha(headerDeleteOffsetDisp);

var col = make_color_rgb(0,137,123);
draw_rectangle_color(0,0,ww,hh,col,col,col,col,false);

var xx = 0;
var size = 23;
var xoff = (hh-size)*0.5;

draw_menu_xout(xx+xoff,yy+xoff,size,size,3,c_white); // draw xout

if mode_delete && click_region_released(0,0,hh,hh,true,navbar.hidden)
	{
	mode_delete = false;
	androidBack = false;
	}

var xx = 120;
var height = 40;
var yoff = (hh-height)*0.5;
var count = 0;
var size = ds_list_size(delete_list);

for(var i=0;i<size;i++)
count += delete_list[| i];

draw_set_color(c_white);
draw_text_height(xx,yy+yoff,string(count)+" selected",height); // draw number of items to delete

// clicked on trash
var xx = room_width-hh-20;
draw_icon_height_centered(ico_trash3,0,xx,yy,hh,hh,40,headerDeleteOffsetDisp); // trash icon

if click_region_released(xx,0,hh,hh,true,navbar.hidden) && mode_delete
delete_list_delete(delete_list,mode_delete_list_id);

draw_set_color(c_black);
draw_set_alpha(1);
}







