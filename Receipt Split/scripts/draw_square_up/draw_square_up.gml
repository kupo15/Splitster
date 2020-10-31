
function draw_square_up() {
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Square Up");

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

var list_size = ds_list_size(squareup_list);
var pos_start = floor(squareup_list_offset);
var pos_end = min(list_size,ceil(squareup_list_offset)+rows);

// draw calendar icon
draw_set_halign(fa_center);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_pos = i-squareup_list_offset;
	var expense_pointer = squareup_list[| i];
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
	
// settle up button
var xx = 140;
var ww = 185;
var hh = 60;
var height = 30;

var col1 = make_color_rgb(80,80,80);
var col2 = make_color_rgb(28,164,109);
	
for(var i=pos_start;i<pos_end;i++)
	{	
	var off_pos = i-squareup_list_offset;

	if click_button(xx+(0*ww),yy+40+(off_pos*ysep),"Take Back",height,c_white,ww,hh,col1,true,false,navbar.hidden)
		{
		ds_map_add(undo_map,i,squareup_list[| i]); // move to undo list
		ds_list_delete(squareup_list,i); // delete from list
		}
	
	if click_button(xx+10+(1*ww),yy+40+(off_pos*ysep),"Squared Up",height,c_white,ww,hh,col2,true,false,navbar.hidden)
		{
		ds_list_add(master_expense_list,squareup_list[| i]); // move to history
		ds_list_sort_nested_struct(master_expense_list,"date",false);
		
		ds_list_delete(squareup_list,i); // delete from list
		}
	}
	
	
if android_back
	{
	screen_change(screen.home);
	}	
	
}

