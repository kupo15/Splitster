
function draw_home() {
var col = c_lt_gray;
set_background_color;

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");

// draw pending box
var xx = 10;
var yy = 300;
var ww = room_width-xx-xx;
var hh = 80;
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

// debug_device_info(150,500,30,30);
}
