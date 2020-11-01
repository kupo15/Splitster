function jumpto() {
draw_debug();
}

function debug_draw_click_highlight(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"click_highlight_index: "+string(click_highlight_index),height);
draw_text_height(xx,yy+((ind+1)*sep),"click_highlight_height: "+string(click_highlight_height),height);
draw_text_height(xx,yy+((ind+2)*sep),"click_highlight_screen: "+string(click_highlight_screen),height);
draw_text_height(xx,yy+((ind+4)*sep),"active_submenu: "+string(active_submenu),height);
	
}

function debug_draw_vk(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"vk_active: "+string(kv_active),height);
draw_text_height(xx,yy+((ind+1)*sep),"keyboard_string:",height);
draw_text_height(xx,yy+((ind+2)*sep),"'"+keyboard_string+"'",height,fn_italic);
	
}

function debug_draw_textbox(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"textbox_index: "+string(textbox_index),height);
draw_text_height(xx,yy+((ind+1)*sep),"texStringLength: "+string(textboxStringLength),height);
draw_text_height(xx,yy+((ind+2)*sep),"texStringWidth: "+string(textboxStringWidth),height);
draw_text_height(xx,yy+((ind+3)*sep),"texStringScale: "+string(textboxStringScale),height);
	
}

function debug_draw_textbox_cursor(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"cursPosStart "+string(cursorPosStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"cursorPos "+string(cursorPos),height);
draw_text_height(xx,yy+((ind+2)*sep),"cursorHoverPos "+string(cursorHoverPos),height);
draw_text_height(xx,yy+((ind+3)*sep),"cursorXposOff "+string(cursorXposOff),height);
	
}
