function ini_create() {
	
	
json_data_load();
ini_shared();
ini_screen_change();
ini_timers();
ini_highlight_vars();
ini_cursor_vars();

ini_currency_symbols();
	
currency_index = 0;
currency_sym = "";

active_expense = undefined;
active_receipt = undefined;

receipt_index = undefined;
expense_index = undefined;

event_name = "";
receipt_name = "";
receipt_price = "";

friend_index = undefined;
friend_id = undefined;

user_disp_name = "Lindsey"
user_username = "Lindsey";

#region offsets

friendsbar_yoff = 0;
friendsbar_yoff_start = 0;
	
#endregion

#region scrollbar
master_friends_list_offset = 0;
master_friends_list_offset_start = master_friends_list_offset;

master_expense_list_offset = 0;
master_expense_list_offset_start = master_expense_list_offset;

receipt_list_offset = 0;
receipt_list_offset_start = receipt_list_offset;

#endregion


repeat 15
scr_friend_create();

ini_debug();
}
