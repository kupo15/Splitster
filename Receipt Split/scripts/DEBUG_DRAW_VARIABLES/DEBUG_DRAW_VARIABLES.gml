
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
	
draw_text_height(xx,yy+((ind+0)*sep),"monthOffsetStart: "+string(monthOffsetStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"monthOffset: "+string(monthOffset),height);
draw_text_height(xx,yy+((ind+2)*sep),"monthOffsetEnd "+string(monthOffsetEnd),height);
draw_text_height(xx,yy+((ind+3)*sep),"monthParse: "+string(monthParse),height);
						   
draw_text_height(xx,yy+((ind+5)*sep),"day end "+string(dayOffsetEnd),height);
draw_text_height(xx,yy+((ind+6)*sep),"daySpanSelect: "+string(daySpanSelect),height);
						   
draw_text_height(xx,yy+((ind+8)*sep),"yearParse: "+string(yearParse),height);
}

goto_draw_debug();
