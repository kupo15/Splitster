
function draw_numpad(variable) {

var xx = 0;
var yy = 580+(numpad_yoff*381);
var vsep = 95;
var hsep1 = 105;

// draw number button background
var col = c_white;
draw_rectangle_color(xx,yy,room_width,room_height,col,col,col,col,false);

// draw dark button background
var col = make_color_rgb(247,247,247);
draw_rectangle_color(xx,yy,xx+(1*hsep1),room_height,col,col,col,col,false);

var hsep2 = 145;
draw_rectangle_color(xx,yy+(3*vsep),xx+105+(1*hsep2),room_height,col,col,col,col,false);
draw_rectangle_color(xx+hsep1+(2*hsep2),yy+(3*vsep),room_width,room_height,col,col,col,col,false);

// draw lines
var col = make_color_rgb(237,237,237);
for(var i=0;i<3;i++)
	{
	draw_line_color(0,yy+((i+1)*vsep),room_width,yy+((i+1)*vsep),col,col); // hor lines
	draw_line_color(hsep1+(i*hsep2),yy,hsep1+(i*hsep2),room_height,col,col); // vert lines
	}
	
var height = 50;
var yoff = (vsep-height)*0.5;

draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(0*vsep),"/",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(1*vsep),"x",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(2*vsep),"+",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(3*vsep),"-",height);

draw_set_color(c_black);
for(var i=0;i<3;i++)
for(var n=0;n<3;n++)
	{
	draw_text_height(xx+hsep1+(i*hsep2)+(0.5*hsep2),yy+yoff+(n*vsep),(n*3)+i+1,height);
	
	if click_region_released(xx+hsep1+(i*hsep2),yy+(n*vsep),hsep2,vsep,c_yellow,submenu)
	variable += string((n*3)+i+1);
	}

// draw 00
draw_text_height(xx+hsep1+(hsep2*0.5),yy+yoff+(3*vsep),"00",height);
if click_region_released(xx+hsep1+(0*hsep2),yy+(3*vsep),hsep2,vsep,c_yellow,submenu)
variable += "00";

// draw 0
draw_text_height(xx+hsep1+(hsep2*1.5),yy+yoff+(3*vsep),"0",height);
if click_region_released(xx+hsep1+(1*hsep2),yy+(3*vsep),hsep2,vsep,c_yellow,submenu)
variable += "0";

// delete
draw_sprite_ext(ico_backspace,0,xx+(1*hsep1)+(2*hsep2)+(hsep2*0.5),yy+(3.5*vsep),0.25,0.25,0,c_white,1);
if click_region_released(xx+hsep1+(2*hsep2),yy+(3*vsep),hsep2,vsep,c_yellow,submenu)
	{
	var length = string_length(variable);
	variable = string_delete(variable,length,1);
	}

return variable;
}