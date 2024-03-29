function ini_create() {
		
json_data_load();
ini_shared();
layout_normal();
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

friend_name_entry = "";
friend_index = undefined;
friend_id = undefined;

numpad_value = "";

#region offsets

friendsbar_yoff = 0;
friendsbar_yoff_start = 0;

numpad_yoff = 0;
numpad_yoff_start = 0;
	
#endregion

#region scrollbar
master_friends_list_offset = 0;
master_friends_list_offset_start = master_friends_list_offset;

master_expense_list_offset = 0;
master_expense_list_offset_extended = 0;
master_expense_list_offset_start = master_expense_list_offset;

receipt_list_offset = 0;
receipt_list_offset_start = receipt_list_offset;

squareup_list_offset = 0;
squareup_list_offset_start = squareup_list_offset;

#endregion

mouse_xpos = 0;
mouse_ypos = 0;

repeat 3
scr_friend_create("",true);

scr_friend_create("z",true);

ini_debug();
}
