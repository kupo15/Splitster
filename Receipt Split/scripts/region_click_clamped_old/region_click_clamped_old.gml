

/*function click_region_released_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos) {

	var mx = mouse_x;
	var my = mouse_y;

	if (sub != submenu) || !canClick
	exit;

	// change yy and sep/hh
	var ypos = y_top+yoff;
	var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window
	var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
	var sep = hh-sep_adj;
		
	// if hanging off the bottom
	if ypos+sep > y_top+box_hh
	sep = y_top+box_hh-ypos;

	y_top += yoff; // top of selection

	button = mb_left;
	var mouse_vis = mouse_check_button(button);

	if (mx > x_left) && (mx < x_left+ww) && (my > ypos_clamp) && (my < ypos_clamp+sep)
	    {
	    if os_type == os_windows
	        {
			var col = c_yellow;
		
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,ypos_clamp,x_left+ww,ypos_clamp+sep,col,col,col,col,false);
	        draw_set_alpha(1);
	        }
		
		// clicked highlight
		if mouse_check_button_pressed(button) && highlight != noone
		scr_click_highlight_set(x_left,y_top,ww,hh,highlight,screenIndex,array_pos);
           
		// clicked selection
	    if (mouse_check_button_released(button) && abs(mouse_ydist) < 10 && abs(mouse_xdist) < 30) || button = noone
	        {
			canClick = false;
			scrollbarIndexScrolling = noone;

	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;
}


/*
function click_region_pressed_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,ind) {
	
var mx = mouse_x;
var my = mouse_y;

if sub != submenu
exit;

// change yy and sep/hh
var ypos = y_top+yoff;
var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window
var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = hh-sep_adj;
		
// if hanging off the bottom
if ypos+sep > y_top+box_hh
sep = y_top+box_hh-ypos;

y_top += yoff; // top of selection

button = mb_left;

if (mx > x_left) && (mx < x_left+ww) && (my > ypos_clamp) && (my < ypos_clamp+sep)
	{
	if (os_type == os_windows) && highlight
	    {
		var col = c_yellow;
		
	    draw_set_alpha(0.3);
	    draw_rectangle_colour(x_left,ypos_clamp,x_left+ww,ypos_clamp+sep,col,col,col,col,false);
	    draw_set_alpha(1);
	    }
		
	// clicked highlight
	if mouse_check_button_pressed(button) && highlight
		{
		scr_click_highlight_set(x_left+(ww*0.5),y_top,ww,hh,highlight,screenIndex);
		db("**");
		db(click_highlight_index);
		}
           
	// clicked selection
	if (mouse_check_button_pressed(button) && abs(mouse_ydist) < 15 && abs(mouse_xdist) < 30) || button = noone
	    {	
		click_highlight_index = ind;
				db(click_highlight_index);

		if canClick
	    return true;
	    }
	else 
	return false;
	}
else return false;
}
