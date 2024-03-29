
function funct_convert_month(month_num,month_full) {
/// @param month
/// @param month_full

	var str_ = "n/a";

	// MONTH
	if month_full
	switch month_num
		{
		case 12:
		case -1: str_ = month_num; break;
		case 0: str_ = "January"; break;
		case 1: str_ = "Febuary"; break;
		case 2: str_ = "March"; break;
		case 3: str_ = "April"; break;
		case 4: str_ = "May"; break;
		case 5: str_ = "June"; break;
		case 6: str_ = "July"; break;
		case 7: str_ = "August"; break;
		case 8: str_ = "September"; break;
		case 9: str_ = "October"; break;
		case 10: str_ = "November"; break;
		case 11: str_ = "December"; break;
		}
	else
	switch month_num
		{
		case 12:
		case -1: break;
		case 0: str_ = "Jan"; break;
		case 1: str_ = "Feb"; break;
		case 2: str_ = "Mar"; break;
		case 3: str_ = "Apr"; break;
		case 4: str_ = "May"; break;
		case 5: str_ = "Jun"; break;
		case 6: str_ = "Jul"; break;
		case 7: str_ = "Aug"; break;
		case 8: str_ = "Sep"; break;
		case 9: str_ = "Oct"; break;
		case 10: str_ = "Nov"; break;
		case 11: str_ = "Dec"; break;
		}
	
	return str_;

}

function funct_convert_day(day_num,day_full) {
/// @param day
/// @param day_full

	var str_ = "n/a";
	
	// DAY
	if day_full
	switch day_num
		{
		case -1: break;
		case 0: str_ = "Sunday"; break;
		case 1: str_ = "Monday"; break;
		case 2: str_ = "Tuesday"; break;
		case 3: str_ = "Wednesday"; break;
		case 4: str_ = "Thursday"; break;
		case 5: str_ = "Friday"; break;
		case 6: str_ = "Saturday"; break;
		}
	else
	switch day_num
		{
		case -1: break;
		case 0: str_ = "Sun"; break;
		case 1: str_ = "Mon"; break;
		case 2: str_ = "Tues"; break;
		case 3: str_ = "Wed"; break;
		case 4: str_ = "Thurs"; break;
		case 5: str_ = "Fri"; break;
		case 6: str_ = "Sat"; break;
		}
	
	return str_;


}

function funct_convert_date(month_num,month_full,day_num,day_full) {
/// @param month
/// @param month_full
/// @param day
/// @param day_full

var str_ = "n/a";

// MONTH
if month_full
switch month_num
	{
	case 12:
	case -1: str_ = month_num; break;
	case 0: str_ = "January"; break;
	case 1: str_ = "Febuary"; break;
	case 2: str_ = "March"; break;
	case 3: str_ = "April"; break;
	case 4: str_ = "May"; break;
	case 5: str_ = "June"; break;
	case 6: str_ = "July"; break;
	case 7: str_ = "August"; break;
	case 8: str_ = "September"; break;
	case 9: str_ = "October"; break;
	case 10: str_ = "November"; break;
	case 11: str_ = "December"; break;
	}
else
switch month_num
	{
	case 12:
	case -1: break;
	case 0: str_ = "Jan"; break;
	case 1: str_ = "Feb"; break;
	case 2: str_ = "Mar"; break;
	case 3: str_ = "Apr"; break;
	case 4: str_ = "May"; break;
	case 5: str_ = "Jun"; break;
	case 6: str_ = "Jul"; break;
	case 7: str_ = "Aug"; break;
	case 8: str_ = "Sep"; break;
	case 9: str_ = "Oct"; break;
	case 10: str_ = "Nov"; break;
	case 11: str_ = "Dec"; break;
	}
	
// DAY
if day_full
switch day_num
	{
	case -1: break;
	case 0: str_ += "Sunday"; break;
	case 1: str_ += "Monday"; break;
	case 2: str_ += "Tuesday"; break;
	case 3: str_ += "Wednesday"; break;
	case 4: str_ += "Thursday"; break;
	case 5: str_ += "Friday"; break;
	case 6: str_ += "Saturday"; break;
	}
else
switch day_num
	{
	case -1: break;
	case 0: str_ += "Sun"; break;
	case 1: str_ += "Mon"; break;
	case 2: str_ += "Tues"; break;
	case 3: str_ += "Wed"; break;
	case 4: str_ += "Thurs"; break;
	case 5: str_ += "Fri"; break;
	case 6: str_ += "Sat"; break;
	}
	
return str_;


}
