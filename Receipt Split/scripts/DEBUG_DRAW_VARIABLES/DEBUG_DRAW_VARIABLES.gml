
goto_draw_debug();


function debug_draw_click_highlight(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"highlight_width: "+string(click_highlight_width)+" ["+string(click_highlight_width_end)+"]",height);
draw_text_height(xx,yy+((ind+1)*sep),"highlight_height: "+string(click_highlight_height),height);
draw_text_height(xx,yy+((ind+2)*sep),"highlight_alpha: "+string(click_highlight_alpha)+" ["+string(click_highlight_alpha_end)+"]",height);
draw_text_height(xx,yy+((ind+3)*sep),"highlight_index: "+string(click_highlight_index),height);
draw_text_height(xx,yy+((ind+4)*sep),"highlight_screen: "+string(click_highlight_screen),height);
draw_text_height(xx,yy+((ind+5)*sep),"activeSubmenu: "+string(activeSubmenu),height);
}

function debug_draw_vk(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"vk_active: "+string(kvActive),height);
draw_text_height(xx,yy+((ind+1)*sep),"keyboard_string:",height);
draw_text_height(xx,yy+((ind+2)*sep),"'"+keyboard_string+"'",height,fn_italic);
	
}

function debug_draw_textbox(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"textboxIndex: "+string(textboxIndex),height);
draw_text_height(xx,yy+((ind+1)*sep),"texStringLength: "+string(textboxStringLength),height);
draw_text_height(xx,yy+((ind+2)*sep),"texStringWidth: "+string(textboxStringWidth),height);
draw_text_height(xx,yy+((ind+3)*sep),"texStringScale: "+string(textboxStringScale),height);
	
}

function debug_draw_textbox_cursor(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"cursPosStart: "+string(cursorPosStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"cursorPos: "+string(cursorPos),height);
draw_text_height(xx,yy+((ind+2)*sep),"cursorHoverPos: "+string(cursorHoverPos),height);
draw_text_height(xx,yy+((ind+3)*sep),"cursorXposOff: "+string(cursorXposOff),height);
	
}

function debug_draw_scrollbars(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"scrollbar_spd: "+string(scrollbar_speed[0]),height);
draw_text_height(xx,yy+((ind+1)*sep),"scrollbarIndexScrolling: "+string(scrollbarIndexScrolling),height);
	
}

function debug_draw_calendar(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"monthOffsetStart: "+string(monthOffsetStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"monthOffset: "+string(monthOffset),height);
draw_text_height(xx,yy+((ind+2)*sep),"monthOffsetEnd "+string(monthOffsetEnd),height);
draw_text_height(xx,yy+((ind+3)*sep),"monthParse: "+string(monthParse),height);
						   
draw_text_height(xx,yy+((ind+5)*sep),"day end "+string(dayOffsetEnd),height);
draw_text_height(xx,yy+((ind+6)*sep),"daySpanSelect: "+string(daySpanSelect),height);
						   
draw_text_height(xx,yy+((ind+8)*sep),"yearParse: "+string(yearParse),height);
}

function debug_draw_mouse(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"canClick: "+string(canClick),height); // can click
draw_text_height(xx,yy+((ind+1)*sep),"clickMoved: "+string(clickMoved),height); // can click
//draw_text_height(xx,yy+((ind+1)*sep),"MouseStart: "+string(mouse_xstart)+" , "+string(mouse_ystart),height); // mouse ystart
draw_text_height(xx,yy+((ind+2)*sep),"Mouse Distance: "+string(mouse_xdist)+" , "+string(mouse_ydist),height); // mouse distances
draw_text_height(xx,yy+((ind+3)*sep),"Mouse Coor: "+string(mouse_x)+" , "+string(mouse_y),height); // mouse coor
	
if mouse_check_button(mb_middle)
draw_text_height(xx,yy+((ind+4)*sep),"Region Size: ["+string(abs(mouse_xpos-mouse_x))+" , "+string(abs(mouse_ypos-mouse_y))+"]",height); // mouse coor
}

function debug_device_info(xx,yy,sep,height) {
	
draw_set_halign(fa_left);
draw_rectangle(50,250,250,450,true);

var ww = display_get_width();
var hh = display_get_height();

draw_text_height(xx,yy+(0*sep),"display: "+string(ww)+" x "+string(hh),height);

var ww = window_get_width();
var hh = window_get_height();
draw_text_height(xx,yy+(1*sep),"window: "+string(ww)+" x "+string(hh),height);

var ww = surface_get_width(application_surface);
var hh = surface_get_height(application_surface);
draw_text_height(xx,yy+(2*sep),"app surf: "+string(ww)+" x "+string(hh),height);

var ww = display_get_gui_width();
var hh = display_get_gui_height();
draw_text_height(xx,yy+(3*sep),"gui window: "+string(ww)+" x "+string(hh),height);

draw_text_height(xx,yy+(4*sep),"window xpos: "+string(window_get_x),height);
draw_text_height(xx,yy+(5*sep),"window ypos: "+string(window_get_y),height);
}

goto_draw_debug();
