
function draw_square_up() {
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Square Up");

var ysep = 200;
var xx = 20;
var yy = header_height;
var height = 60;
var text_yoff = (ysep-height)*0.5;

// calendar variables
var sq_size = 95;
var sq_yoff = (ysep-sq_size)*0.5-15;

var rows = 7;
var ww = 540;
var hh = rows*ysep;

var list_size = ds_list_size(squareup_list);
var pos_start = floor(squareup_list_offset);
var pos_end = min(list_size,ceil(squareup_list_offset)+rows);

// draw calendar icon
draw_set_halign(fa_center);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-squareup_list_offset;
	var off_pos = (off_ind*ysep);
	var expense_pointer = squareup_list[| i];
	var date = expense_pointer.date;

	// draw calendar icon
	draw_calendar_icon(xx,yy+off_pos-10,sq_yoff,sq_size,date);
	
	if click_region_released(0,yy+off_pos,room_width,ysep,c_yellow,submenu)
	screen_change(screen.expenseReview);
	
	}
	
// settle up button
var xx = 120;
var ww = 190;
var hh = 45;
var height = 30;

var col1 = make_color_rgb(80,80,80);
var col2 = make_color_rgb(28,164,109);
	
for(var i=pos_start;i<pos_end;i++)
	{	
	var off_ind = i-squareup_list_offset;
	var off_pos = 140+(off_ind*ysep);

	if click_button(xx+(0*ww),yy+off_pos,"Take Back",height,c_white,ww,hh,col1,true,false,navbar.hidden)
		{
		ds_map_add(undo_map,i,squareup_list[| i]); // move to undo list
		ds_list_delete(squareup_list,i); // delete from list
		}
	
	if click_button(xx+20+(1*ww),yy+off_pos,"Squared Up",height,c_white,ww,hh,col2,true,false,navbar.hidden)
		{
		ds_list_add(master_expense_list,squareup_list[| i]); // move to history
		ds_list_sort_nested_struct(master_expense_list,"date",false);
		
		ds_list_delete(squareup_list,i); // delete from list
		}
	}
	
	
if android_back
screen_change(screen.home);
	
}

