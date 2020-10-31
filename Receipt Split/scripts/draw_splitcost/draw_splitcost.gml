
function draw_splitcost() {
	
var box_col = c_white;	
var bg_col = c_lt_gray;

draw_rectangle_color(0,0,room_width,room_height,bg_col,bg_col,bg_col,bg_col,false);

draw_screen_header(headerType.back,headerType.none,"Split Cost");

if kv_active
switch textbox_index
	{
	case 0: receipt_name = string_capitalize(keyboard_string,200); break;
	}
	

// draw labels
var xx = 80;
var yy = 90;
var hh = 190;

var yoff = 35;
var ysep = 80;
var height = 50;

// background
draw_rectangle_color(0,yy,room_width,yy+hh,box_col,box_col,box_col,box_col,false);

draw_set_halign(fa_left);
draw_set_color(c_gray);

draw_text_height(xx,yy+10+yoff+height,"Expense Name",30);

var ww = 500-xx;
var height = 60;

draw_text_height_ext_cursor(xx+5,yy+yoff,receipt_name,"Enter a description",0,-1,ww,height,0);
draw_set_color(c_black);

for(var i=0;i<1;i++)
	{
	if click_region_released(xx,yy+yoff+10+(i*ysep),ww,ysep-25,true,navbar.hidden)
	switch i
		{
		case 0: click_textbox_set(receipt_name,0,kbv_type_default); break;	
		}
		
	draw_line_pixel(xx,yy+yoff+height+(i*ysep),ww,2,c_gray,0.8); // draw separating line
	}
	
// draw who paid
var sep = element_paid_by.sep;
var size = array_length(active_receipt.split);
element_paid_by.hh_expanded = clamp(size-2,0,size)*sep;

var yy = element_paid_by.yy;
var hh = element_paid_by.hh+element_paid_by.hh_expanded;

draw_rectangle_color(0,yy,room_width,yy+hh,box_col,box_col,box_col,box_col,false);

var xx = 30;
var yoff = 10;
var height = 25;
var col = c_gray; 

draw_text_height_color(xx,yy+yoff,"Paid by",height,col);

var xx = 120;
var yoff = 50;
var ind = 0;
var height = 30;
var col = make_color_rgb(239,91,35); // red

for(var i=0;i<size;i++)
	{
	var pointer = active_receipt.split[i];
	var paid = pointer.paid;

	if !paid
	continue;
	
	var profilePointer = pointer.memberId;
	var name = profilePointer.dispName;
	var share = pointer.share;
	
	draw_set_halign(fa_left);
	draw_text_height(xx,yy+yoff+(ind*sep),name,height); // draw name
	
	draw_set_halign(fa_right);
	draw_text_height_color(room_width-30,yy+yoff+(ind*sep),currency_symbol[currency_index]+string(share),height,col);
	ind ++;
	}


// draw amount split
var height = 40;
var col = make_color_rgb(239,91,35);

draw_set_halign(fa_right);
//draw_text_height_color(room_width-30,420,currency_symbol[currency_index]+string(receipt_price),height,col);

if click_region_released(0,yy,room_width,hh,true,navbar.hidden)
screen_change(screen.receiptAmount);	
		
// draw friends list
var ysep = 85;
var xx = 30;
var ypos = header_height+(ysep*4)
var diff = room_height-ypos+ysep;
var yy = ypos+(diff*friendsbar_yoff_start);

draw_submenu_friends_list(xx,yy,room_width,60,ysep,6)


#region delete expense

var ww = 170;
var hh = 95;
var xx = 5;
var yy = room_height-hh-5;

if draw_button_trash(xx,yy,ww,hh,screen.splitCost,navbar.hidden)
		{
		//ds_list_delete(master_score_list,index); // delete score
		//json_save(save_data);
	
		active_receipt = undefined;
		receipt_index = undefined;
	
		screen_goto_prev();
		exit;
		}	
		
#endregion

#region Create
var submit = 1;
	
var ww = 350;
var hh = 95;
var xx = 185;
var yy = room_height-hh-5;
var height = 50;

var str = "Update Receipt";

if screen_index == screen.splitCost
var str = "Create Receipt";
	
// draw Create/Update box
draw_set_alpha(0.5+(0.5*submit));

// clicked submit
if click_button(xx,yy,str,height,c_black,ww,hh,c_white,true,true,navbar.hidden) || keyboard_check_released(vk_enter)
	{
	scr_receipt_add(receipt_index);
	
	screen_goto_prev();
	screen_goto_prev();
	}
	
draw_set_alpha(1);

#endregion


if android_back
	{
	if !kv_active
	screen_goto_prev();
	}
	
}