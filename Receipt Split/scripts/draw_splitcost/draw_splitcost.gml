
function draw_splitcost() {
	
var box_col = c_white;	
var bg_col = c_lt_gray;

draw_rectangle_color(0,0,room_width,room_height,bg_col,bg_col,bg_col,bg_col,false);

draw_screen_header(headerType.back,headerType.none,"Split Cost",60);

if kv_active
switch textbox_index
	{
	case 0: receipt_name = string_capitalize(keyboard_string,200); break;
	}
	
var yy = 90;
var hh = 190;

draw_rectangle_color(0,yy,room_width,yy+hh,box_col,box_col,box_col,box_col,false);

// draw labels
var xx = 80;
var yoff = 35;
var ysep = 80;
var height = 50;

draw_set_halign(fa_left);
draw_set_color(c_gray);

draw_text_height(xx,yy+10+yoff+height,"Expense Name",30);

var ww = 500-xx;
var height = 60;
draw_text_height_ext_cursor(xx+5,yy+yoff,receipt_name,"Enter a description",0,-1,ww,height,0);

for(var i=0;i<1;i++)
	{
	if click_region_released(xx,yy+yoff+10+(i*ysep),ww,ysep-25,true,navbar.hidden)
	switch i
		{
		case 0: click_textbox_set(receipt_name,0,kbv_type_default); break;	
		}
		
	draw_line_pixel(xx,yy+yoff+height+(i*ysep),ww,2,c_gray,0.8); // draw separating line
	}
	
// draw split
var yy = 290;
var hh = 180;

draw_rectangle_color(0,yy,room_width,yy+hh,box_col,box_col,box_col,box_col,false);

// draw amount split
var height = 50;
var col = make_color_rgb(239,91,35);

draw_set_halign(fa_right);
draw_text_height_color(room_width-30,360,currency_symbol[currency_index]+string(receipt_price),height,col);
	
		
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
var yy = 850;
var col = c_red;
	
if screen_index == screen.splitCost
	{	
	draw_set_alpha(0.3);
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	draw_set_alpha(1);

	draw_sprite_ext(ico_trash2,1,xx+55,yy+10,0.8,0.8,0,c_white,1); // draw trash icon
	
	// clicked trash icon
	if click_region_released(xx,yy,ww,hh,true,navbar.hidden)
		{
		//ds_list_delete(master_score_list,index); // delete score
		//json_save(save_data);
	
		active_receipt = undefined;
		receipt_index = undefined;
	
		screen_goto_prev();
		exit;
		}	
	}
#endregion

#region Create
var submit = 1;
	
var ww = 350;
var hh = 95;
var xx = 185;
var yy = 850;
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