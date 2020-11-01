
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,thick,col) {
// centered vertically

var sep = hh/3;

for(var i=-1;i<2;i++)
draw_line_width_color(xx,yy+(i*(sep+thick)),xx+ww,yy+(i*(sep+thick)),thick,col,col);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col) {

draw_line_width_color(xx,yy,xx+ww,yy+hh,thick,col,col); // line top left to bottom right
draw_line_width_color(xx,yy+hh,xx+ww,yy,thick,col,col); // line bot left to top right
}
	
function draw_menu_dots(xx,yy,rr,sep,col) {
// centered vertically

for(var i=-1;i<2;i++)
draw_circle_color(xx,yy+(i*(sep+rr)),rr,col,col,false);

}

function draw_menu_arrow(xx,yy,ww,hh,thickness,dir,col) {
	
var half = hh*0.5;
var diag_ll = ww*0.3;

draw_line_width_color(xx,yy,xx+diag_ll,yy-half,thickness,col,col); // diagonal up
draw_line_width_color(xx,yy,xx+ww,yy,thickness,col,col); // horizontal line
draw_line_width_color(xx,yy,xx+diag_ll,yy+half,thickness,col,col); // diagonal down line
	
}
	
function draw_calendar_icon(xx,yy,sq_yoff,sq_size,date) {
	
var day = date_get_day(date);
var weekday = date_get_weekday(date);
var day_str = funct_convert_day(weekday,false);

// draw calendar icon
draw_roundrect_color(xx+1,yy+sq_yoff,xx+sq_size,yy+sq_size-1+sq_yoff,c_gray,c_gray,true);
draw_roundrect_color(xx,yy+sq_yoff,xx+sq_size,yy+sq_size+sq_yoff,c_gray,c_gray,true);
	
draw_set_halign(fa_center);
draw_text_height_color(xx+(sq_size*0.5),yy+10+sq_yoff,day_str,c_red,25);
draw_text_height_color(xx+(sq_size*0.5),yy+40+sq_yoff,day,c_black,46);

draw_set_halign(fa_left);
}