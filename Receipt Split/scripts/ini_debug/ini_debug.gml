
function ini_debug(){

for(var i=0;i<15;i++)
	{
	var str = "Event "+string(i);
	var _date = date_create_datetime(current_year,irandom(12),irandom(29),1,1,1);
	scr_expense_create(str,_date);

	var desc = choose("A","B","C","D","E","F");
	var price = random_range(1.00,5.00);
	scr_receipt_create(desc,price);
	scr_receipt_add(0);

	ds_list_add(master_expense_list,active_expense);
	}
		
ds_list_sort_nested_struct(master_expense_list,"date",false);
		
active_expense = undefined;
active_receipt = undefined;
screen_change(screen.home,true);

}