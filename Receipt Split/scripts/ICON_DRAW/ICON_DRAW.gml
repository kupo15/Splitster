
function draw_icon_member_add(xx,yy,height,col) {
	
var spr = spr_icon_member_add;
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var alpha = draw_get_alpha();

switch col
	{
	case c_blue: col = make_color_rgb(0,185,229); break;
	}

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

}

function draw_icon_group(xx,yy,height,col) {
	
var spr = spr_icon_group;
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var alpha = draw_get_alpha();

switch col
	{
	default: break;
	}

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

}

function draw_icon_width(spr,xx,yy,width,alpha) {
	
var spr_ww = sprite_get_width(spr);
var sca = width/spr_ww;
var col = c_white;

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

return width;
}

function draw_icon_height(spr,xx,yy,height,alpha) {
	
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var col = c_white;

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

return height;
}

function draw_icon_width_centered(spr,index,xx,yy,ww,hh,width,alpha) {
	
var spr_ww = sprite_get_width(spr);
var sca = width/spr_ww;
var spr_hh = sprite_get_height(spr)*sca;
var xoff = (hh-width)*0.5;
var yoff = (hh-spr_hh)*0.5;
var col = c_white;

draw_sprite_ext(spr,index,xx+xoff,yy+yoff,sca,sca,0,col,alpha);
}

function draw_icon_height_centered(spr,index,xx,yy,ww,hh,height,alpha) {
	
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var spr_ww = sprite_get_width(spr)*sca;
var xoff = (ww-spr_ww)*0.5;
var yoff = (hh-height)*0.5;
var col = c_white;

draw_sprite_ext(spr,index,xx+xoff,yy+yoff,sca,sca,0,col,alpha);
}

