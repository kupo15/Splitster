
function scr_expense_create(desc,_date) {
/// @param [name
/// @param date]

if argument[0] == undefined
desc = "";

if argument[1] == undefined
_date = date_create_datetime(current_year,current_month,current_day,1,1,1);
	
active_expense = {

name: desc,
date: _date,
total_cost: 0,

receiptList: []

}

event_name = "";

}