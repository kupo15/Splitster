/// @param kvtype_var
/// @param [kvtypereturn_var]
function vk_initiate(kvtype,kvreturn) {

	// [optional argument]
	if is_undefined(kvreturn)
	kvreturn = kbv_returnkey_next;

	if kvtype == kbv_type_numbers
		{
		numpad_value = keyboard_string;
		submenu = navbar.numpad;
		}
	else
	keyboard_virtual_show(kvtype,kvreturn,kbv_autocapitalize_words,false); // show keyboard
	
	kvActive = true;
	cursorSet = true;
}

