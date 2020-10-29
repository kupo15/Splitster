/// @param index
function scr_navbar_click(ind) {

// switch screens
screen_change(ind);

switch ind
	{
	case screen.expenseCreate: scr_expense_create(); break;						  
	}


}
