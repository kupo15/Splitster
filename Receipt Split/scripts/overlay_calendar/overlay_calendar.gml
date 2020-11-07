function draw_overlay_calendar() {
	
//if submenu != navbar.calendar
//exit;

// clicked on year
draw_set_halign(fa_center);

var xx = 20;
var yy = 225;
var xsep = 72;
var ysep = 85;
var height = 80;

if click_region_released(0,yy-20,room_width,ysep,true,navbar.hidden)
	{
	submenu = navbar.calendarYearSelect;
	alpha_lerp_end = 1;
	yearSelectOffset = monthOffsetEnd;
	mouse_clear(mb_left);
	}

// draw weekdays
for(var i=0;i<7;i++)
	{
	switch i
		{
		case 0: var str = "S"; break;
		case 1: var str = "M"; break;
		case 2: var str = "T"; break;
		case 3: var str = "W"; break;
		case 4: var str = "T"; break;
		case 5: var str = "F"; break;
		case 6: var str = "S"; break;
		}
		
	draw_text_height(xx+(xsep*0.5)+((i mod 7)*xsep),yy+65,str,35);
	}

// update viewing month
monthParse = (monthOffsetEnd mod 12)+1;
yearParse = 1970+floor(monthOffsetEnd/12);
		
// draw month
var pos_start = floor(monthOffset);
var pos_end = pos_start+3;
for(var ii=pos_start;ii<pos_end;ii++) // draw three months
	{
	var off_ind = (ii-monthOffset);
	var off_pos = off_ind*room_width;
	
	// draw calendar month
	var month_disp = funct_convert_date(monthParse,true,-1,-1);
	var year_disp = yearParse;

	if ii == pos_start
	draw_text_height(room_width*0.5,yy-15,string(month_disp)+" "+string(year_disp),70); // draw month AND year
	
	// draw calendar days
	var curr_month = (ii mod 12)+1;
	var datetime = date_create_datetime(yearParse,curr_month,1,1,1,1);
	var day_num = date_days_in_month(datetime);
	var start_day = date_get_weekday(datetime);
	var end_day = start_day+day_num;
	for(var i=start_day;i<end_day;i++)
		{
		var calendar_day = i-start_day+1;
		var yoff = floor(i/7);
		draw_text_height_middled(xx+(xsep*0.5)+((i mod 7)*xsep)+off_pos,yy+ysep+(yoff*ysep),calendar_day,ysep,50); // draw days
	
		var curr_date = date_create_datetime(yearParse,curr_month,calendar_day,1,1,1);
		var span = date_day_span(start_date,curr_date);
		var day_span_test = round(span); // days from beginning till now
	
		// draw selected day
		if daySelectSpan == day_span_test
			{
			draw_set_alpha(0.3);
			draw_circle_color(xx+(xsep*0.5)+((i mod 7)*xsep)+off_pos,yy+(ysep*0.5)+ysep+(yoff*ysep),xsep*0.5,c_aqua,c_aqua,false);
			draw_set_alpha(1);
			}
	
		if click_region_released(xx+((i mod 7)*xsep)+off_pos,yy+ysep+(yoff*ysep),xsep,ysep,true,navbar.hidden)
			{
			dayParse = calendar_day; // set day within the month
				
			dateSelectDay = calendar_day;
			dateSelectMonth = monthParse;
			dateSelectYear = yearParse;
			
			var curr_date = date_create_datetime(yearParse,monthParse,calendar_day,1,1,1);
			var span = date_day_span(start_date,curr_date);
			
			daySelectSpan = round(span); // update day span from the 1/1/1970
			}
		}
	}

monthOffsetEnd += funct_mouse_wheel(1);

#region scrolling
var offset_start_pointer = [self,"monthOffsetStart"];
var offset_pointer = [self,"monthOffsetEnd"];
var scrollbar_index = 0;
var list_size = 3600;

funct_screen_scrolling_hor(xx,yy+ysep,7*xsep,6*ysep,7*xsep,list_size,1,offset_start_pointer,offset_pointer,scrollbar_index,navbar.hidden);
#endregion

if monthOffsetEnd < 0
monthOffsetEnd = 0;

// scrollbar_speed[scrollbar_index] = 0;

if mouse_check_button_released(mb_left)
	{	
	if scrollbar_speed[scrollbar_index] == 0
	monthOffsetEnd = round(monthOffset);
	else
		{
		var dir = sign(monthOffset-monthOffsetStart);
	
		if dir == 1
		monthOffsetEnd = ceil(monthOffset);
		else if dir == -1
		monthOffsetEnd = floor(monthOffset);		
		}
		
	// stop scrollbar
	scrollbar_speed[scrollbar_index] = 0;
	}

// if not held down
if mouse_check_button(mb_left)
monthOffset = monthOffsetEnd;

// align
if abs(scrollbar_speed[scrollbar_index]) == 0
	{
	monthOffset = lerp(monthOffset,monthOffsetEnd,0.2);
		
	if abs(monthOffset-monthOffsetEnd) < 0.001
	monthOffset = monthOffsetEnd;
	}


#region SUBMIT button
var ww = 300;
var hh = 130;
var xx = room_width*0.5-(ww*0.5);
var yy = room_height-hh;
var xoff = ww*0.5;
var yoff = 7;
var col = c_white;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false); // draw button

// draw Submit button
draw_set_halign(fa_center);

var str = "Submit";
draw_text_height(xx+xoff,yy+yoff,str,90);

var submit = false;
if click_region_released(0,yy,room_width,hh,true,navbar.hidden)
	{
	submit = true;
	androidBack = true;
	}

#endregion

draw_year_select();

if androidBack
	{
	if submit
		{
		var selectedDate = date_create_datetime(dateSelectYear,dateSelectMonth,dateSelectDay,1,1,1);
		return selectedDate;
		}
	
	// year select
	if submenu == navbar.calendarYearSelect
		{
		submenu = navbar.hidden;
		alpha_lerp_end = 0;
		}
	else
		{
		screen_goto_prev();
		datePointer = noone;
		}
	}
	
return undefined;


}
