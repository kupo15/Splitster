
function draw_expense_history() {

// draw expense history
var ysep = 110;
var xx = 20;
var yy = header_height;
var height = 60;
var text_yoff = (ysep-height)*0.5;

var rows = (room_height-yy)/ysep;
var ww = 540;
var hh = rows*ysep;
	
var sq_size = 80;
var sq_yoff = (ysep-sq_size)*0.5-15;

var banner_hh = 40;
var banner_ratio = banner_hh/ysep;
var banner_num = 0; // number of banners on screen
var banner_height = 25;
var pos_ext = 1; // banner_hh/(banner_hh+ysep);

var banner_text_yoff = (banner_hh-banner_height)*0.5;

var xpos = 140;
var height = 30;
var month_last = 13;
draw_set_halign(fa_left);

// draw_rectangle_color(0,yy,room_width,yy+hh,c_red,c_red,c_red,c_red,true)

var list_size = ds_list_size(master_expense_list);
var pos_start = floor(master_expense_list_offset*pos_ext);
var pos_end = min(list_size,ceil(master_expense_list_offset)+rows);
for(var i=0;i<pos_end;i++)
	{
	var off_ind = i-master_expense_list_offset;
	var off_pos = (off_ind*ysep)+(banner_hh*banner_num);

	var expense_pointer = master_expense_list[| i];
	var name = expense_pointer.name;
	var receiptNum = ds_list_size(expense_pointer.receiptList);
	
	var date = expense_pointer.date;
	var month = date_get_month(date);
	var month_str = funct_convert_month(month-1,true);
	var year = date_get_year(date);

	//draw_text_height(300,yy+off_pos+25,month,30)
	//draw_text_height(360,yy+off_pos+25,month_last,30)

	if month < month_last
		{
		var banner_ypos = yy+off_pos; // clamp(yy+off_pos,yy,yy+off_pos);
		var col = make_color_rgb(226,227,230);
		draw_rectangle_color(0,banner_ypos,room_width,banner_ypos+banner_hh,col,col,col,col,false);

		draw_text_height(xx,banner_ypos+banner_text_yoff,month_str+" "+string(year),banner_height);	
		
		month_last = month;	
		banner_num ++;
		off_pos += banner_hh; // update off_pos
		}
		
	//draw_line_pixel(0,yy+off_pos,350,1,c_black,1);
	//draw_line_pixel(0,yy+off_pos+ysep,350,1,c_black,1);

		
	// highlight selected
	if mode_delete
	delete_list_draw_selected(0,yy,off_pos,ww,ysep,hh,delete_list,i);
		
	draw_calendar_icon(xx,yy+15+off_pos,sq_yoff,sq_size,date);
		
	// draw_text_height(xx,yy+off_pos,i,height); // 
	
	draw_text_height(xpos,yy+25+off_pos+(0*height)+sq_yoff,name,height); // draw name
	draw_text_height(xpos,yy+25+off_pos+(1*height)+sq_yoff,"Receipts: "+string(receiptNum),height); // draw receipt numbers
	
	// clicked on expense
	if !mode_delete && click_region_pressed_clamp(0,yy,off_pos,ww,ysep,hh,mb_left,false,navbar.hidden,i)
	delete_list_set(master_expense_list,i);
	
	// draw clicked highlight
	draw_highlight_click_clamp(yy,off_pos,ysep,hh,i);
	
	// click released on event
	if click_region_released_clamp(0,yy,off_pos,ww,ysep,hh,mb_left,true,navbar.hidden,i)
		{
		if mode_delete
			{
			if can_delete
			delete_list[| i] = !delete_list[| i]; // toggle selected
			
			can_delete = true;
			}
		else // clicking on an expense
			{
			textboxIndex = noone;
			keyboard_string = "";
			vk_hide();
				
			expense_index = i;
			expense_id = expense_pointer;
			//screen_change(screen.friendsProfile);
			}
		}
	}
	
	/*draw_set_halign(fa_right)
	draw_text_height(520,yy,"master_offset: "+string(master_expense_list_offset*pos_ext),30)
	draw_text_height(520,yy+50,"banner_ratio: "+string(banner_ratio),30)
	draw_text_height(520,yy+100,"banner_num: "+string(banner_num),30)
	draw_text_height(520,yy+150,"pos_ext: "+string(pos_ext),30)
	//draw_text_height(520,yy,"f-pos_s: "+string(floor(pos_start)),30)
	//draw_text_height(520,yy+50,"pos_s: "+string(pos_start),30)
	//draw_text_height(520,yy+100,"pos_ex: "+string(pos_extended),30)
	//draw_text_height(520,yy+150,"start-ext: "+string(pos_start-pos_extended),30)
	//draw_text_height(520,yy+200,"f-start-ext: "+string(max(0,floor(pos_start-pos_extended))),30)
	draw_text_height(520,yy+200,"pos_start: "+string(pos_start),30)
	draw_text_height(520,yy+250,"pos_end: "+string(pos_end),30)*/


#region scrolling
var offset_start_pointer = [self,"master_expense_list_offset_start"];
var offset_pointer = [self,"master_expense_list_offset"];
var scrollbar_index = 0;
var xx = 0;
var banner_ext = banner_num*banner_ratio;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,ysep,list_size+banner_ext,rows,offset_start_pointer,offset_pointer,scrollbar_index,sub);
#endregion

if androidBack
	{
	if !kvActive
	screen_goto_prev();
	}
	
// draw the 3 bars
draw_screen_header(headerType.back,headerType.none,"Expense History");
}