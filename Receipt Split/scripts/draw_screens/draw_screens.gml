function draw_screens() {
	
#region android back
if android_back
	{
	if mode_delete
		{
		mode_delete = false;
		android_back = false;
		}
	else if submenu == navbar.hidden
		{
		if screen_index == screen.home && os_type == os_android
		game_end();

		// screen_change(screen.home,true);
		}
	}
#endregion

draw_background_screen();

draw_set_halign(fa_left);
switch screen_index
	{
	case screen.home: draw_home(); break;
	
	case screen.friendsList: draw_friends_list(); break;
	case screen.friendsProfile: draw_friends_profile(); break;
	
	case screen.expenseCreate: draw_expense_create(); break;
	
	case screen.expensesPending: draw_expenses_pending(); break;
	
	case screen.receiptAmount:
	case screen.receiptUpdate:
	case screen.receiptCreate: draw_receipt_create(); break;
	
	case screen.splitCost: draw_splitcost(); break;
		
	case screen.expenseReview: draw_expense_review(); break;
	case screen.expenseHistory: draw_expense_history(); break;
	
	case screen.info: draw_info(); break;
	case screen.settings: draw_settings(); break;
	
	case screen.edit_date: draw_date_edit_calendar(); break;
	}
	
numpad_value = draw_numpad(numpad_value);
	
draw_highlight_click(submenu != navbar.sidebar);
draw_darken_screen();

// draw_footer_button();
draw_nav_bar();
draw_sidebar_main_menu();
	
draw_popup_par();
	


// update the virtual keyboard
if kv_active // || timer[timerIndex.vk_switch] > -1
	{
	kv_last_string = keyboard_string;
	kv_input_string = keyboard_string; // get string input
	}

if android_back && (submenu != navbar.numpad)
vk_hide();

}
