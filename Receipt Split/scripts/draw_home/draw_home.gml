
function draw_home() {
var col = c_lt_gray;
set_background_color;

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");

// draw pending box
var xx = 10;
var yy = 300;
var ww = room_width-xx-xx;
var hh = 150;
var col = c_white;
var sub = navbar.hidden;

if dialogue
screen_change(screen.expensesPending);

var xoff = 120;
var height = 40;
var yoff = (hh-height)*0.5;
var size = ds_list_size(squareup_list);

if size == 0
	{
	var str = "No expenses pending!!";
	draw_text_height(xx+xoff,yy+yoff,str,height);

	}
else
	{
	var spr_hh = sprite_get_height(spr_icon_megaphone)
	var scale = hh/spr_hh*0.8;
	
	draw_sprite_ext(spr_icon_megaphone,0,xx+20,yy+5,scale,scale,0,c_white,1); // draw megaphone

	var str = plural(" Expense",size," pending");
	
	draw_text_height(xx+xoff,yy+yoff,string(size)+str,height);
	}

// create expense button
var xx = 20;
var yy = 875;
var ww = room_width-xx-xx;
var hh = 60;
var height = 40;
var col = make_color_rgb(28,164,109);

if click_button(xx,yy,"New Expense",height,c_white,ww,hh,col,true,false,navbar.hidden) || keyboard_check_pressed(vk_enter)
scr_navbar_click(screen.expenseCreate);

if click_region(xx,yy-60-60,ww,hh,true,mb_left,navbar.main)
db("released");

if click_region_released(xx,yy-60,ww,hh,true,mb_left,navbar.hidden)
db("released");

#region debug testing
exit;
draw_rectangle(50,250,250,450,true);

var ww = display_get_width();
var hh = display_get_height();

draw_text_height(150,400+(0*40),"display: "+string(ww)+" x "+string(hh),30);

var ww = window_get_width();
var hh = window_get_height();
draw_text_height(150,400+(1*40),"window: "+string(ww)+" x "+string(hh),30);

var ww = surface_get_width(application_surface);
var hh = surface_get_height(application_surface);
draw_text_height(150,400+(2*40),"app surf: "+string(ww)+" x "+string(hh),30);

var ww = display_get_gui_width();
var hh = display_get_gui_height();
draw_text_height(150,400+(3*40),"gui window: "+string(ww)+" x "+string(hh),30);

draw_text_height(150,400+(4*40),"window xpos: "+string(window_get_x),30);
draw_text_height(150,400+(5*40),"window ypos: "+string(window_get_y),30);
#endregion
}
