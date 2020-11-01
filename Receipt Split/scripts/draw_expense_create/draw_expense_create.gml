
function draw_expense_create() {
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Expenses");

// entry
if kvActive
switch textboxIndex
	{
	case 0: event_name = string_capitalize(keyboard_string,200); break;
	}
	
// draw Event Name
var ysep = 50;
var height = 50;
var xx = 30;
var yy = header_height+10;
var ww = room_width;
var col = make_color_rgb(28,194,159);
var text_yoff = (ysep-(height*0.8))*0.5;

draw_set_halign(fa_left);
draw_text_height_ext_cursor(xx+5,yy+text_yoff+(0*ysep),event_name,"Enter a description",0,-1,ww,height,0);
draw_line_pixel(xx,yy+height+10+(0*ysep),ww,2,c_gray,0.8); // draw separating line

if click_region_released(0,yy+(0*ysep),ww,ysep+10,true,navbar.hidden)
click_textbox_set(event_name,0,kbv_type_default);

// draw Receipt label
var ysep = 50;
var height = 50;
var xx = room_width*0.5;
var yy = header_height+(ysep*2.5);
var ww = room_width;
var col = make_color_rgb(28,194,159);
var text_yoff = (ysep-(height*0.8))*0.5;

draw_set_color(c_black);
draw_set_halign(fa_center);
// draw_text_height(xx,yy+text_yoff-ysep,"Receipts",height);

#region draw receipts
var height = 30;
var ysep = 30;
var xx = 30;
var yy = 180;
var ww = room_width-xx-xx;
var receipt_height = 100;
var receipt_sep = 110;
var text_yoff = (receipt_height-(height*2))*0.5;

var rows = 4;
var hh = rows*receipt_sep;
var list_size = ds_list_size(active_expense.receiptList);
var pos_start = floor(receipt_list_offset);
var pos_end = min(list_size,ceil(receipt_list_offset)+rows);

draw_set_halign(fa_left);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-receipt_list_offset;
	var off_pos = (off_ind*receipt_sep);
	var pointer = active_expense.receiptList[| i];
	
	draw_roundrect(xx,yy+off_pos,xx+ww,yy+off_pos+receipt_height-1,true);

	var name = pointer.description;
	var price = currency_symbol[pointer.currency]+pointer.price;
	draw_text_height(xx+10,yy+off_pos+text_yoff+(0*ysep),"Name: "+string(name),height);
	draw_text_height(xx+10,yy+off_pos+text_yoff+(1*ysep),"Price: "+string(price),height);

	// click released on event
	if click_region_released_clamp(xx,yy,off_pos,ww,receipt_height,hh,mb_left,true,navbar.hidden,i,active_expense.receiptList)
		{
		if mode_delete
			{
			if can_delete
			delete_list[| i] = !delete_list[| i]; // toggle selected
			
			can_delete = true;
			}
		else // clicking on an expense
			{
			scr_receipt_update(i);
			}
		}
	}
	
#endregion
	
#region scrolling
var offset_start_pointer = [self,"receipt_list_offset_start"];
var offset_pointer = [self,"receipt_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,ysep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

#region draw add expense button
var xx = 20;
var yy = 630;
var ww = room_width-xx-xx;
var hh = 200;
var ysep = 60;
var height = 60;
var text_yoff = (hh-(height*2))*0.5;

draw_roundrect(xx,yy,xx+ww,yy+hh,true);

draw_set_halign(fa_center);
draw_text_height(xx+(ww*0.5),yy+text_yoff+(0*ysep),"Click to add",height);
draw_text_height(xx+(ww*0.5),yy+text_yoff+(1*ysep),"Receipt",height);

if click_region_released(xx,yy,ww,hh,true,navbar.hidden)
	{
	scr_receipt_create();
	
	screen_change(screen.receiptCreate);
	click_textbox_set(receipt_price,0,kbv_type_numbers);
	}
#endregion

#region delete expense
var ww = 170;
var hh = 95;
var xx = 5;
var yy = 850;

// clicked trash icon
if draw_button_trash(xx,yy,ww,hh,screenIndex,navbar.hidden)
	{
	//ds_list_delete(master_score_list,index); // delete score
	//json_save(save_data);

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
var hh = 95;
var xx = 185;
var height = 50;

//var str = "Update";
//if screenIndex == screen.add_score
var str = "Create Expense";

if click_button(xx,yy,str,height,c_black,ww,hh,c_white,true,true,navbar.hidden)
	{
	// debug
	if event_name == ""
	event_name = choose("Pizza Party","Get Together","Dinner","Night Out");
		
	// set event name
	active_expense.name = event_name; 
	
	// add to pending list
	ds_list_add(squareup_list,active_expense);
	ds_list_sort_nested_struct(squareup_list,"date",false);

	// clear variables
	event_name = "";
	active_expense = undefined;
	active_receipt = undefined;
	
	screen_change(screen.home,true);
	}
#endregion

if androidBack
	{
	if !kvActive
	screen_change(screen.home,true);
	}
	
if keyboard_check_pressed(vk_enter)
	{
	var price = string(irandom_range(1,10));
	scr_receipt_create("",price);
	
	var ind = ds_list_size(active_expense.receiptList);
	scr_receipt_add(ind);
	}
	
}