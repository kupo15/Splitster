
function ini_profile_info() {
	
profileInfo = {

	dispName: "Lindsey",
	userId: "Lindesy",
	
	}	
	
}

function scr_friend_create(name,ascending) {
/// @param name
/// @param [ascending]

if name == ""
name = choose("Lindsey","Matt","John", "Steven", "Graham", "Jack", "Emily", "Tina", "Jill", "Helen");

// friend stuct
var friend = {

	dispName: name,
	userId: "1",
	
	}

// add to friends list
var size = array_length(master_friends_array);
var ind = max(size-1,0);
array_insert(master_friends_array,ind,friend);

// sort friends list
if argument[1] != undefined
array_sort_nested_struct(master_friends_array,"dispName",ascending);

// reset variables
friend_name_entry = "";
keyboard_string = "";
}