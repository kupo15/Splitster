
function draw_home() {
draw_clear(c_lt_gray);
exit
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
var size = array_length(pending_array);

if size == 0
	{
	var str = "No expenses pending!!";
	draw_text_height(xx+xoff,yy+yoff,str,height);
	}
else
	{
	var str = plural(" Expense",size," pending");
	
	draw_text_height(xx+xoff,yy+yoff,string(size)+str,height);
	draw_icon_height(spr_icon_megaphone,xx+20,yy+5,60,1); // draw megaphone
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
