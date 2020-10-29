
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,sep,col) {

	for(var i=0;i<3;i++)
	draw_line_width_color(xx,yy+(i*(sep+hh)),xx+ww,yy+(i*(sep+hh)),hh,col,col);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col) {

draw_line_width_color(xx,yy,xx+ww,yy+hh,thick,col,col); // line top left to bottom right
draw_line_width_color(xx,yy+hh,xx+ww,yy,thick,col,col); // line bot left to top right
}
	
function draw_menu_dots(xx,yy,rr,sep,col) {

	for(var i=0;i<3;i++)
	draw_circle_color(xx,yy+(i*(sep+rr)),rr,col,col,false);

}

function draw_menu_arrow(xx,yy,ww,hh,thickness,dir,col) {
	
var half = hh*0.5;
var diag_ll = ww*0.3;

draw_line_width_color(xx,yy,xx+diag_ll,yy-half,thickness,col,col); // diagonal up
draw_line_width_color(xx,yy,xx+ww,yy,thickness,col,col); // horizontal line
draw_line_width_color(xx,yy,xx+diag_ll,yy+half,thickness,col,col); // diagonal down line
	
}