function json_data_load() {
	
	master_friends_list = ds_list_create();
	master_expense_list = ds_list_create();
	squareup_list = ds_list_create();
	undo_map = ds_map_create();
	
	// debug_reset = true;
	json_load(save_data);

}
