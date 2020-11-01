
goto_draw_debug();


function debug_draw_click_highlight(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"click_highlight_index: "+string(click_highlight_index),height);
draw_text_height(xx,yy+((ind+1)*sep),"click_highlight_height: "+string(click_highlight_height),height);
draw_text_height(xx,yy+((ind+2)*sep),"click_highlight_screen: "+string(click_highlight_screen),height);
draw_text_height(xx,yy+((ind+4)*sep),"activeSubmenu: "+string(activeSubmenu),height);
	
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
	
draw_text_height(xx,yy+((ind+0)*sep),"month start "+string(month_offset_start),height);
draw_text_height(xx,yy+((ind+1)*sep),"month "+string(month_offset),height);
draw_text_height(xx,yy+((ind+2)*sep),"month end "+string(month_offset_end),height);
draw_text_height(xx,yy+((ind+3)*sep),"month parse "+string(month_parse),height);
						   
draw_text_height(xx,yy+((ind+5)*sep),"day end "+string(day_offset_end),height);
draw_text_height(xx,yy+((ind+6)*sep),"day span "+string(day_span_select),height);
						   
draw_text_height(xx,yy+((ind+8)*sep),"year parse "+string(year_parse),height);
}

goto_draw_debug();
