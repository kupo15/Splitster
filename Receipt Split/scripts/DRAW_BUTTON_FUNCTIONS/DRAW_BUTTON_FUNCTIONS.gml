
function draw_button_trash(xx,yy,ww,hh,spr,color,screenInd,sub,background) {

if screenIndex == screenInd
	{		
	var col = c_red;
	var fit = 0.8; // 80% of the button height
	
	if background
		{
		draw_set_alpha(0.3);
		draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
		draw_set_alpha(1);
		}

	var height = (hh*fit);
	var spr_hh = sprite_get_height(spr);
	var sca = height/spr_hh;
	
	var spr_ww = sprite_get_width(spr)*sca;
	var xoff = (ww-spr_ww)*0.5;
	var yoff = (hh-height)*0.5;
	
	switch color
		{
		case c_red: var col = make_color_rgb(204,49,28); break;
		
		default: var col = color; break;
		}

	draw_sprite_ext(spr,0,xx+xoff,yy+yoff,sca,sca,0,col,1); // draw trash icon
	
	// clicked trash icon
	return click_region_released(xx,yy,ww,hh,true,sub);
	}

}

function draw_button_backspace(spr,index,xx,yy,ww,hh,height,alpha,sub) {
	
draw_icon_height_centered(spr,index,xx,yy,ww,hh,height,alpha);
	
return click_region_released(xx,yy,ww,hh,true,sub);	
}

function draw_list_searchbar(xx,yy,blankStr,height,ww,hh,col,sub) {
/// @param xx
/// @param yy
/// @param stringLabel
/// @param stringHeight
/// @param searchbarWidth
/// @param searchbarHeight
/// @param searchbarColor
	
draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

// draw text
var text_yoff = (hh-(height*0.8))*0.5;
draw_text_height_ext_cursor(xx+70,yy+text_yoff,searched_name,blankStr,-1,ww,0,height,-1); // draw search bar
draw_icon_height_centered(ico_search,0,xx,yy,70,hh,35,1); // searchbar ico

// clicked on search bar
if click_region_released(xx,yy,ww-hh-10,hh,true,submenu)
	{
	searching = true;
	click_textbox_set(searched_name,-1,kbv_type_default,kbv_returnkey_done);
	}
	
// clear xout
var xWidth = 25;
var xoff = (hh-xWidth)*0.5;
var yoff = xoff;

draw_menu_xout(room_width-hh+xoff,yy+yoff,xWidth,xWidth,3,c_black);

if click_region_released(room_width-hh,yy,hh,hh,true,submenu)
	{
	keyboard_string = "";
	searched_name = "";
	}
	

	
}

