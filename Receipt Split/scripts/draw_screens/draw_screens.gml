function draw_screens() {
	
#region android back
if androidBack
	{
	if mode_delete
		{
		mode_delete = false;
		androidBack = false;
		}
	else if submenu == navbar.hidden
		{
		if (screenIndex == screen.home) && (os_type == os_android)
		game_end();

		// screen_change(screen.home,true);
		}
	}
#endregion

draw_background_screen();

draw_set_halign(fa_left);
switch screenIndex
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
	
draw_highlight_click_static(submenu != navbar.sidebar);

draw_darken_screen();

// draw_footer_button();
draw_nav_bar();
draw_sidebar_main_menu();

var date = draw_overlay_calendar();

if date != undefined
	{
	db(date_get_month(date))
	db(date_get_day(date))
	db(date_get_year(date))
	//json_save_array(save_data,ROOT_data_struct);	
	}
	
draw_popup_par();
	


// update the virtual keyboard
if kvActive // || timer[timerIndex.vk_switch] > -1
	{
	kvLastString = keyboard_string;
	kvInputString = keyboard_string; // get string input
	}

if androidBack && (submenu != navbar.numpad)
vk_hide();

}
