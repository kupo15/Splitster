
function scr_friend_create() {

var name = choose("Lindsey","Matt","John", "Steven", "Graham", "Jack", "Emily", "Tina", "Jill", "Helen");

var friend = {

dispName: name,
userId: "1",
	
}

ds_list_add(master_friends_list,friend);

}