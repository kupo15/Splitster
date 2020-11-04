
function ini_debug(){
	
repeat 3
scr_friend_create("",true);
scr_friend_create("z",true);


for(var i=0;i<15;i++)
	{
	// create expense
	var str = "Event "+string(i);
	var _date = date_create_datetime(current_year,irandom(8),irandom(29),current_hour,current_minute,current_second);
	
	scr_expense_create(str,_date);

	// add a receipt to expense
	var desc = choose("A","B","C","D","E","F");
	var price = random_range(1.00,5.00);
	
	scr_receipt_create(desc,price);
	scr_receipt_add(0);

	array_push(master_expense_array,active_expense);
	}
		
array_sort_nested_struct(master_expense_array,"date",false);
		
active_expense = undefined;
active_receipt = undefined;
screen_change(screen.home,true);

}