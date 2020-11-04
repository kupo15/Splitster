
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
name = choose("Lindsey","Matt","John","Steven",
"Graham","Jack", 
"Emily","Tina", 
"Jill","Helen",
"Liam","Olivia",
"Noah","Emma",
"Oliver","Ava",
"William","Sophia",
"Elijah","Isabella",
"James","Charlotte",
"Benjamin","Amelia",
"Lucas","Mia",
"Mason","Harper",
"Ethan","Evelyn");

// friend stuct
var friend = {

	dispName: name,
	userId: "1",
	
	}

// add to friends list
var size = array_length(friendslist_array);
var ind = max(size-1,0);
array_insert(friendslist_array,ind,friend);

// sort friends list
if argument[1] != undefined
	{
	array_sort_nested_struct(friendslist_array,"dispName",ascending);
	app_save
	}

// reset variables
friend_name_entry = "";
keyboard_string = "";
}