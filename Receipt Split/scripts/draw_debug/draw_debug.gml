function goto_draw_debug() {};

function draw_debug() {
	
	if os_type == os_android
	exit;

	var xx = -375;
	var yy = 10;
	var sep = 30;
	var height = 30;

	var win_ww = window_get_width();
	var win_hh = window_get_height();

	draw_set_colour(c_white);
	draw_set_halign(fa_left);

	var yoff = 0;
	draw_text_height(xx,yy+((yoff+0)*sep),"submenuPrevious: "+string(submenuPrevious),height);
	draw_text_height(xx,yy+((yoff+1)*sep),"submenu: "+string(submenu),height);
	draw_text_height(xx,yy+((yoff+2)*sep),"screenIndex: "+string(screenIndex),height);
	draw_text_height(xx,yy+((yoff+3)*sep),"friends_list_off: "+string(master_friends_list_offset),height);
	draw_text_height(xx,yy+((yoff+4)*sep),"friends_list_off_st: "+string(master_friends_list_offset_start),height);
	draw_text_height(xx,yy+((yoff+5)*sep),"kvLastString: "+string(kvLastString),height);
	draw_text_height(xx,yy+((yoff+6)*sep),"click_ypos: "+string(click_highlight_ypos),height);
	draw_text_height(xx,yy+((yoff+7)*sep),"click_index: "+string(click_highlight_index),height);
	draw_text_height(xx,yy+((yoff+8)*sep),"expense_index: "+string(expense_index),height);
	draw_text_height(xx,yy+((yoff+9)*sep),"receipt_index: "+string(receipt_index),height);

	var yoff = 11;
	//debug_draw_click_highlight(xx,yy,yoff,sep,height);
	
	//debug_draw_vk(xx,yy,yoff,sep,height);
	
	var yoff = 15;
	debug_draw_textbox(xx,yy,yoff,sep,height);

	var yoff = 20;
	debug_draw_textbox_cursor(xx,yy,yoff,sep,height);
	//debug_draw_scrollbars(xx,yy,yoff,sep,height);

	
	var yoff = 25;
	
	draw_text_height(xx,yy+((yoff+0)*sep),"numpad_value: "+string(numpad_value),height);
	
	
	//debug_draw_calendar(xx,yy,yoff,sep,height);

	// draw_text_height(xx,yy+(25*sep),"search results "+string(ds_grid_height(search_grid)),height);

	var yoff = 26;
	//draw_text_height(xx,yy+((yoff+0)*sep),"Resolution: "+string(win_ww)+"x"+string(win_hh),height); // resolution
	
	debug_draw_mouse(xx,yy,yoff,sep,height);

	// right side
	var size = ds_list_size(delete_list);
	for(var i=0;i<size;i++)
	draw_text_height(550,yy+(i*sep),delete_list[| i],height);
	
	yy += (size+1)*sep;
	draw_text_height(550,yy+(0*sep),string(ds_stack_size(prev_screen_stack))+": "+string(ds_stack_top(prev_screen_stack)),height);
	
	draw_set_colour(c_black);

	/*


	draw_text_height(xx,yy+(10*sep),string(ds_exists(debug_id1,ds_type_list)),height);
	draw_text_height(xx,yy+(11*sep),string(ds_exists(debug_id,ds_type_list)),height);

	if keyboard_check_pressed(vk_space)
		{
		debug_id1 = master_course_list[| 5];
		debug_id = master_score_list[| 5];
		}

	if keyboard_check_pressed(vk_backspace)
		{
		ds_list_destroy(master_score_list);
		ds_list_destroy(master_course_list);
		}



/* end draw_debug */
}

