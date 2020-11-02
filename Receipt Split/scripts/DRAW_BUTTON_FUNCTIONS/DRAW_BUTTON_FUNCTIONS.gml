
function draw_button_trash(xx,yy,ww,hh,spr,screenInd,sub) {

if screenIndex == screenInd
	{		
	var col = c_red;
	var fit = 0.8; // 80% of the button height
	
	draw_set_alpha(0.3);
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	draw_set_alpha(1);

	var spr_hh = sprite_get_height(spr);
	var sca = (hh*fit)/spr_hh;
	var col = make_color_rgb(204,49,28);

	draw_sprite_ext(spr,0,xx+55,yy+10,sca,sca,0,col,1); // draw trash icon
	
	// clicked trash icon
	if click_region_released(xx,yy,ww,hh,true,sub)
	return true;
	else
	return false;
	}

}