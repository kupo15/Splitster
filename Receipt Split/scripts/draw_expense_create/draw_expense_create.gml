
function draw_expense_create() {
var bg_col = c_lt_gray;
draw_clear(bg_col);
	
// entry
if kvActive
switch textboxIndex
	{
	case 0: event_name = string_capitalize(keyboard_string,200); break;
	}
	
// draw Receipt label
var ysep = 50;
var height = 50;
var xx = room_width*0.5;
var yy = header_height+(ysep*2.5);
var ww = room_width;
var col = make_color_rgb(28,194,159);

draw_set_color(c_black);
draw_set_halign(fa_center);
// draw_text_height(xx,yy-ysep,"Receipts",height);

#region draw receipts
var height = 30;
var ysep = 30;
var xx = 15;
var yy = 180;
var ww = room_width-xx-xx;
var receipt_height = 100;
var receipt_sep = 110;

var rows = 4;
var hh = rows*receipt_sep;
var list_size = array_length(active_expense.receiptList);
var pos_start = floor(receipt_list_offset);
var pos_end = min(list_size,ceil(receipt_list_offset)+rows);

draw_set_halign(fa_left);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-receipt_list_offset;
	var off_pos = (off_ind*receipt_sep);
	var pointer = active_expense.receiptList[i];
	
	draw_textbox(xx,yy+off_pos,ww,receipt_height-1,true);

	var name = pointer.description;
	var price = currency_symbol[pointer.currency]+string(pointer.price);
	
	draw_set_halign(fa_left);
	draw_text_height(xx+20,yy+off_pos+(1*ysep),name,height);

	draw_text_height(xx+5,yy+off_pos+5,"receipt #"+string(i+1),20,fn_italic); // receipt number
	
	var paidby_str = "Paid by: ";
	var num = array_length(pointer.split);
	for(var n=0;n<num;n++)
		{
		var receiptPointer = pointer.split[n];
		var paid = receiptPointer.paid;
		
		var profilePointer = receiptPointer.memberId;
		var name = profilePointer.dispName;

		if !paid
		continue;	
		
		if n > 0
		paidby_str += ", ";
		
		paidby_str += name;
		}
		
	var abbr = string_abbreviate(paidby_str,350,height*0.75,"...");
	draw_text_height(xx+20,yy+off_pos+(2.5*ysep),abbr,height*0.75,fn_italic);
	
	// draw price
	draw_set_halign(fa_right);
	draw_text_height_color(xx+ww-30,yy+off_pos+(1*ysep),price,c_red,height);
		
	// click released on event
	if click_region_released_clamp_array(xx,yy,off_pos,ww,receipt_height,hh,mb_left,true,navbar.hidden,i,active_expense.receiptList,undefined)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // clicking on an expense
			{
			scr_receipt_update(i);
			}
		}
	}
	
draw_rectangle_color(0,0,room_width,yy,bg_col,bg_col,bg_col,bg_col,false);	
#endregion
	
#region scrolling
var offset_start_pointer = [self,"receipt_list_offset_start"];
var offset_pointer = [self,"receipt_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,receipt_sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

#region draw Event Name
var ysep = 50;
var height = 50;
var xx = 30;
var yy = header_height+10;
var ww = room_width;
var col = make_color_rgb(28,194,159);
var text_yoff = (ysep-height)*0.5;

draw_set_halign(fa_left);
draw_text_height_ext_cursor(xx+5,yy+text_yoff+(0*ysep),event_name,"Enter event name",-1,ww,0,height,0);
draw_line_pixel(xx,yy+height+10+(0*ysep),ww,2,c_gray,0.8); // draw separating line

if click_region_released(0,yy+(0*ysep),ww,ysep+10,true,navbar.hidden)
click_textbox_set(event_name,0,kbv_type_default);
#endregion

#region draw add expense button
var xx = 15;
var yy = 630;
var ww = room_width-xx-xx;
var hh = 100;
var height = 50;

if click_button(xx,yy,"Create Receipt",height,c_black,ww,hh,c_white,true,false,navbar.hidden)
	{
	scr_receipt_create(profileInfo);
	
	screen_change(screen.receiptCreate);
	click_textbox_set(receipt_price,0,kbv_type_numbers);
	}
	
draw_plus_button(xx+83,yy-4+(hh*0.5),70,false);
#endregion

// draw calendar
var yy = 750;
var hh = 90;
var col = c_white;
var date_pointer = active_expense.date;

// clicked on calendar
if draw_dialogue_box(xx,yy,ww,hh,col,navbar.hidden)
	{
	scr_set_date_offsets(date_pointer);
	submenu = navbar.calendar;
	
	}

draw_set_halign(fa_left)
draw_text_height(xx+10,yy+10,"Calendar",25);

var str_ww = string_width_height("Calendar",25);
draw_icon_height_centered(spr_ico_calendar,0,xx+10,yy+40,str_ww,45,45,1); // draw calendar icon

var day = date_get_day(date_pointer);
var month = date_get_month(date_pointer);
var year = date_get_year(date_pointer);

var month_str = funct_convert_month(month,false);
var date_str = string(month_str)+" "+string(day)+", "+string(year);

draw_text_height_color(xx+115,yy+50,date_str,c_gray,35);

// pressed OK in calendar
if calendarDateEntry != undefined
	{
	active_expense.date = calendarDateEntry;
	calendarDateEntry = undefined;
	}
	
#region delete expense
var ww = 170;
var hh = 80;
var xx = 5;
var yy = room_height-hh-5;

// clicked trash icon
if draw_button_trash(xx,yy,ww,hh,ico_trash1,c_red,screenIndex,navbar.hidden,true)
	{
	active_expense = undefined;
	active_receipt = undefined;
	receipt_index = undefined;
	
	screen_change(screen.home,true);
	exit;
	}
	
#endregion
    
#region Create
var submit = 1;
	
var ww = 350;
var hh = 80;
var xx = 185;
var height = 40;
var col = c_app_green; // green

//var str = "Update";
//if screenIndex == screen.add_score
var str = "Create Expense";

if click_button(xx,yy,str,height,c_white,ww,hh,col,true,false,navbar.hidden)
	{
	// debug
	if event_name == ""
	event_name = choose("Pizza Party","Get Together","Dinner","Night Out");
		
	// set event name
	active_expense.name = event_name; 
	
	// add to pending list
	array_push(pending_array,active_expense);
	array_sort_nested_struct(pending_array,"date",false);
	app_save;

	// clear variables
	event_name = "";
	active_expense = undefined;
	active_receipt = undefined;
	
	screen_change(screen.home,true);
	}
#endregion

// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Event Expenses");

if androidBack
	{
	if !kvActive && (submenu == navbar.hidden)
	screen_change(screen.home,true);
	}
	
// debug
if keyboard_check_pressed(vk_enter)
	{
	var price = string(irandom_range(1,10));
	scr_receipt_create(profileInfo,"",price);
	
	var ind = array_length(active_expense.receiptList);
	scr_receipt_add(ind);
	}
	
}