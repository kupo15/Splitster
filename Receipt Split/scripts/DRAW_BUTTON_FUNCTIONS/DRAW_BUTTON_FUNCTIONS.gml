
function draw_button_trash(xx,yy,ww,hh,screenInd,sub) {

if screenIndex == screenInd
	{	
	var col = c_red;

	draw_set_alpha(0.3);
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	draw_set_alpha(1);

	draw_sprite_ext(ico_trash2,1,xx+55,yy+10,0.8,0.8,0,c_white,1); // draw trash icon
	
	// clicked trash icon
	if click_region_released(xx,yy,ww,hh,true,sub)
	return true;
	else
	return false;
	}

}