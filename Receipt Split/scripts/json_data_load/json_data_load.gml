function json_data_load() {
	
master_friends_array = array_create(0);
master_expense_array = array_create(0);
pending_array = array_create(0);
	
undo_map = ds_map_create();
	
ini_profile_info();
	
// debug_reset = true;
json_load(save_data);


}
