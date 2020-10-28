
function draw_home() {
	
// draw the 3 bars
draw_screen_header("Home",60);

// create expense button
var xx = 20;
var yy = 875;
var ww = room_width-xx-xx;
var hh = 60;
var height = 40;
var col = make_color_rgb(28,164,109);

if click_button(xx,yy,"New Expense",height,c_white,ww,hh,col,true,false,submenu)
scr_navbar_click(screen.expenseCreate);
}