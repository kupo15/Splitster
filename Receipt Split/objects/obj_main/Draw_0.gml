
draw_screens();

if !canClick
transitionReady = 1;

mouse_xprev = mouse_x;
mouse_yprev = mouse_y;

if os_type == os_android
exit;

// draw kv popup overlay
kvHeight = 400*kvActive*(submenu != navbar.numpad);
var col = c_blue;

draw_set_alpha(0.4);
draw_rectangle_color(0,room_height+1,room_width,room_height+1-kvHeight,col,col,col,col,false);
draw_set_alpha(1);

// mouse measuring
if mouse_check_button_pressed(mb_middle)
	{
	mouse_xpos = mouse_x;
	mouse_ypos = mouse_y;
	}

if mouse_check_button(mb_middle)
draw_rectangle(mouse_xpos,mouse_ypos,mouse_x,mouse_y,true);