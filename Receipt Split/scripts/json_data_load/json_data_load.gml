function json_data_load() {
		
friendslist_array = array_create(0);
event_history_array = array_create(0);
pending_array = array_create(0);

master_data_array = array_create(0);
array_push(master_data_array,friendslist_array)
array_push(master_data_array,event_history_array)
array_push(master_data_array,pending_array)
	
undo_map = ds_map_create();
	
ini_profile_info();
	
// debug_reset = true;
json_load(save_data);


}
