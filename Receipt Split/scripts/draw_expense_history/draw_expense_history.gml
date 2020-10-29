
function draw_expense_history() {

// draw expense history
var ysep = 140;
var xx = 20;
var yy = 140; // header_height+ysep+5;
var height = 60;
var text_yoff = (ysep-height)*0.5;
var sq = 95;
var sq_yoff = (ysep-sq)*0.5-15;


var rows = 7;
var ww = 540;
var hh = rows*ysep;

var list_size = ds_list_size(master_expense_list);
var pos_start = floor(master_expense_list_offset);
var pos_end = min(list_size,ceil(master_expense_list_offset)+rows);

// draw calendar icon
draw_set_halign(fa_center);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-master_expense_list_offset;
	var expense_pointer = master_expense_list[| i];
	var date = expense_pointer.date;
	var day = date_get_day(date);
	var weekday = date_get_weekday(date);
	var day_str = funct_convert_day(weekday,false);

	// draw calendar icon
	draw_roundrect_color(xx+1,yy+(off_pos*ysep)+sq_yoff,xx+sq,yy+sq-1+(off_pos*ysep)+sq_yoff,c_gray,c_gray,true);
	draw_roundrect_color(xx,yy+(off_pos*ysep)+sq_yoff,xx+sq,yy+sq+(off_pos*ysep)+sq_yoff,c_gray,c_gray,true);
	
	draw_text_height_color(xx+(sq*0.5),yy+15+(off_pos*ysep)+sq_yoff,day_str,30,c_red);
	draw_text_height_color(xx+(sq*0.5),yy+45+(off_pos*ysep)+sq_yoff,day,50,c_black);
	}
	
// draw price
draw_set_halign(fa_right);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-master_expense_list_offset;
	var expense_pointer = master_expense_list[| i];
	
	
	}

var xpos = 140;
var height = 30;
var month_last = 13;
draw_set_halign(fa_left);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-master_expense_list_offset;
	var expense_pointer = master_expense_list[| i];
	var name = expense_pointer.name;
	var receiptNum = ds_list_size(expense_pointer.receiptList);
	var date = expense_pointer.date;
	var month = date_get_month(date);
	var month_str = funct_convert_month(month-1,true);
	var year = date_get_year(date);
	
	if month < month_last
		{
		var col = make_color_rgb(226,227,230);
		draw_rectangle_color(0,yy+(off_pos*ysep)-30,room_width,yy+(off_pos*ysep),col,col,col,col,false);
		draw_text_height(xx,yy+(off_pos*ysep)-27,month_str+" "+string(year),25);		
		}
	
	var month_last = month;	
	
	// highlight selected
	if mode_delete
	delete_list_draw_selected(0,yy,(off_pos*ysep),ww,ysep,hh,delete_list,i);
		
	draw_text_height(xpos,yy+10+(off_pos*ysep)+(0*height)+sq_yoff,name,height); // draw name
	draw_text_height(xpos,yy+10+(off_pos*ysep)+(1*height)+sq_yoff,"Receipts: "+string(receiptNum),height); // draw receipt numbers
	
	// clicked on expense
	if !mode_delete && click_region_pressed_clamp(0,yy,(off_pos*ysep),ww,ysep,hh,mb_left,noone,navbar.hidden,i)
	delete_list_set(master_expense_list,i);
	
	// draw clicked highlight
	draw_highlight_click_clamp(yy,(off_pos*ysep),ysep,hh,i);
	
	// click released on event
	if click_region_released_clamp(0,yy,(off_pos*ysep),ww,ysep,hh,mb_left,c_yellow,navbar.hidden,i)
		{
		if mode_delete
			{
			if can_delete
			delete_list[| i] = !delete_list[| i]; // toggle selected
			
			can_delete = true;
			}
		else // clicking on an expense
			{
			textbox_index = noone;
			keyboard_string = "";
			vk_hide();
				
			expense_index = i;
			expense_id = expense_pointer;
			//screen_change(screen.friendsProfile);
			}
		}
	}
	
#region scrolling
var offset_start_pointer = [self,"master_expense_list_offset_start"];
var offset_pointer = [self,"master_expense_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,ysep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

if android_back
	{
	if !kv_active
	screen_goto_prev();
	}
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Expense History",60);
}