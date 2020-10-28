
function draw_receipt_create() {
	
// draw the 3 bars
var header = "Create Receipt";
if screen_index == screen.receiptUpdate
var header = "Update Receipt";

draw_screen_header(header,60);

if kv_active
switch textbox_index
	{
	case 0: receipt_name = string_capitalize(keyboard_string,200); break;
	case 1: receipt_price = string_convert_currency(keyboard_string,10); break;
	}

var xx = 80;
var yy = 250;
var ww = 500-xx;
var ysep = 120;
var height = 60;

// draw labels
draw_set_halign(fa_left);
draw_set_color(c_gray);
draw_text_height(xx,yy+height+(0*ysep),"Expense Name",30);
draw_text_height(xx,yy+height+(1*ysep),"Amount",30);

var height = 60;
//if receipt_name == ""
//draw_text_height_entry(xx+5,yy+20+(0*ysep),"Enter a description",height*0.7,noone,-1,height,fn_italic); // draw label
draw_text_height_ext_cursor(xx+5,yy+(0*ysep),receipt_name,"Enter a description",0,-1,ww,height,0);

//if receipt_price == ""
//draw_text_height_entry(xx+5,yy+20+(1*ysep),"0.00",height*0.7,noone,-1,height,fn_italic); // draw label
draw_text_height_ext_cursor(xx+5,yy+(1*ysep),receipt_price,"0.00",0,-1,ww,height,1);

for(var i=0;i<2;i++)
	{
	if click_region_released(xx,yy-30+(i*ysep),ww,ysep-30,true,submenu)
	switch i
		{
		case 0: click_textbox_set(receipt_name,0,kbv_type_default); break;	
		case 1: click_textbox_set(receipt_price,1,kbv_type_numbers); break;	
		}
		
	draw_line_pixel(xx,yy+height+(i*ysep),ww,2,c_gray,0.8); // draw separating line
	}
	
	
var xx = 30;
var yy = 500;
var height = 40;
var ww = room_width-xx-xx;
var hh = 60;
var col = make_color_rgb(28,164,109);

if click_button(xx,yy,"Split Costs",height,c_white,ww,hh,col,true,false,submenu)
screen_change(screen.splitCost);

#region delete expense
var ww = 170;
var hh = 95;
var xx = 5;
var yy = 850;
var col = c_red;
	
if screen_index == screen.receiptUpdate
	{	
	draw_set_alpha(0.3);
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	draw_set_alpha(1);

	draw_sprite_ext(ico_trash2,1,xx+55,yy+10,0.8,0.8,0,c_white,1); // draw trash icon
	
	// clicked trash icon
	if click_region_released(xx,yy,ww,hh,true,submenu)
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
var height = 50;

var str = "Update Receipt";
if screen_index == screen.receiptCreate
var str = "Create Receipt";
	
// draw Create/Update box
draw_set_alpha(0.5+(0.5*submit));

// clicked submit
if click_button(xx,yy,str,height,c_black,ww,hh,c_white,true,true,submenu) || keyboard_check_released(vk_enter)
	{
	scr_receipt_add(receipt_index);
	
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