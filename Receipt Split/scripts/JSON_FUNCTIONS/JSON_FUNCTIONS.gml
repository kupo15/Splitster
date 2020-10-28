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

function json_save(_filename) {
/// @param filename

	var _wrapper = ds_map_create();

	var root_map = ds_map_create();
	ds_map_add_map(_wrapper,"ROOT",root_map); // add root map to wrapper

	// save all
	var _string = json_encode(_wrapper);
	SaveStringToFile(_filename,_string);

	// destroy map
	root_map[? "course list"] = undefined;
	root_map[? "score list"] = undefined;
	ds_map_destroy(_wrapper);

	show_debug_message(string(_filename)+" saved");

}

function LoadJSONFromFile(_filename) {
/// @param filename

	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);

	var _json = json_decode(_string);
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
