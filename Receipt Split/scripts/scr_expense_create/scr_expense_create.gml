
function scr_expense_create(desc,_date) {
/// @param [name
/// @param date]

if desc == undefined
desc = "";

if _date == undefined
_date = date_create_datetime(current_year,current_month,current_day,1,1,1);
	
active_expense = {

name: desc,
date: _date,

receiptList: ds_list_create()

}

//click_textbox_set(event_name,0,kbv_type_default);

}