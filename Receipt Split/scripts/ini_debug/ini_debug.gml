
function ini_debug() {
	
randomise();

// create data structure variables
root_data_create();


// debug event history
for(var i=0;i<3;i++)
	{
	// create expense
	var str = "Event "+string(i);
	var _date = date_create_datetime(current_year,irandom(8),irandom(29),current_hour,current_minute,current_second);
	
	scr_expense_create(str,_date);

	// add a receipt to expense
	var desc = choose("A","B","C","D","E","F");
	var price = random_range(1,5);
	
	scr_receipt_create(desc,price);
	scr_receipt_add(receipt_index);

	array_push(event_history_array,active_expense);
	}
		
array_sort_nested_struct(event_history_array,"date",false);
		
active_expense = undefined;
active_receipt = undefined;
screen_change(screen.home,true);

// debug friendslist
repeat 3
scr_friend_create("",undefined);
scr_friend_create("z",true);


db("debug reset");
}

