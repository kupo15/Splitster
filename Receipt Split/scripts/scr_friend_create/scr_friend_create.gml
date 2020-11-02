
function ini_profile_info() {
	
profileInfo = {

dispName: "Lindsey",
userId: "Lindesy",
	
}	
	
}

function scr_friend_create() {

var name = choose("Lindsey","Matt","John", "Steven", "Graham", "Jack", "Emily", "Tina", "Jill", "Helen");

var friend = {

dispName: name,
userId: "1",
	
}

ds_list_add(master_friends_list,friend);
ds_list_sort_nested_struct(master_friends_list,"dispName",true);
}