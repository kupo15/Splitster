function json_load_array(_filename) {
/// @param filename

if file_exists(_filename)
	{
	master_data_array = LoadJSONFromFile(_filename); 
	
	var friends_data = master_data_array[0];			
	var event_history_data = master_data_array[1];			
	var pending_data = master_data_array[2];			
		
	friendslist_array = friends_data;
	event_history_array = event_history_data;
	pending_array = pending_data;

	db(string(_filename)+" loaded");
	}
else
	{
	friendslist_array = array_create(0);
	event_history_array = array_create(0);
	pending_array = array_create(0);	
		
	master_data_array = array_create(0);
	array_push(master_data_array,friendslist_array);
	array_push(master_data_array,event_history_array);
	array_push(master_data_array,pending_array);
	
	db(string(_filename)+" not found > creating data structures");

	}
}

function json_save_array(_filename,arrayId) {
/// @param filename

// save all
var _string = json_stringify(arrayId);
SaveStringToFile(_filename,_string);

show_debug_message(string(_filename)+" saved");
}

function LoadJSONFromFile(_filename) {
/// @param filename

var _buffer = buffer_load(_filename);
var _string = buffer_read(_buffer,buffer_string);
buffer_delete(_buffer);

var _json = json_parse(_string);
return _json;

show_debug_message(_string);

}

function SaveStringToFile(_filename,_string) {
/// @param filename
/// @param string

var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
buffer_write(_buffer,buffer_string,_string);
buffer_save(_buffer,_filename);
buffer_delete(_buffer);

show_debug_message(_string);
}

function json_save(_filename,arrayId) {
/// @param filename

var _wrapper = ds_map_create();

var root_map = ds_map_create();
ds_map_add_map(_wrapper,"ROOT",root_map); // add root map to wrapper

// save all
var _string = json_encode(arrayId);
SaveStringToFile(_filename,_string);

// destroy map
root_map[? "course list"] = undefined;
root_map[? "score list"] = undefined;
ds_map_destroy(_wrapper);

show_debug_message(string(_filename)+" saved");

}

function json_load(_filename) {
/// @param filename

if file_exists(_filename)
	{
	var _wrapper = LoadJSONFromFile(_filename);
	var root_map = _wrapper[? "ROOT"];
		
	// clean up
	ds_map_destroy(_wrapper);
	show_debug_message(string(_filename)+" loaded");
	}
}