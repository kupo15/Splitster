
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

var friend = {

	dispName: name,
	userId: "1",
	
	}

var size = ds_list_size(master_friends_list);
var ind = max(size-1,0);
ds_list_insert(master_friends_list,ind,friend);

if argument[1] != undefined
ds_list_sort_nested_struct(master_friends_list,"dispName",ascending);

friend_name_entry = "";
keyboard_string = "";
}