
function draw_receipt_create() {
	
// draw the 3 bars
var header = "Create Receipt";
if screen_index == screen.receiptUpdate
var header = "Update Receipt";

draw_screen_header(headerType.back,headerType.none,header,60);

if kv_active
switch textbox_index
	{
	//case 0: receipt_name = string_capitalize(keyboard_string,200); break;
	case 0: receipt_price = string_convert_currency(numpad_value,8); break;
	}

var xx = 80;
var yy = 250;
var ww = 500-xx;
var ysep = 120;
var height = 60;

// draw labels
draw_set_halign(fa_left);
draw_set_color(c_gray);
//draw_text_height(xx,yy+height+(0*ysep),"Expense Name",30);
draw_text_height(xx,yy+height+(0*ysep),"Amount",30);

var height = 60;
//draw_text_height_ext_cursor(xx+5,yy+(0*ysep),receipt_name,"Enter a description",0,-1,ww,height,0);
draw_text_height_ext_cursor(xx+5,yy+(0*ysep),receipt_price,"0.00",0,-1,ww,height,0);

for(var i=0;i<1;i++)
	{
	if click_region_released(xx,yy-30+(i*ysep),ww,ysep-30,true,navbar.hidden)
	switch i
		{
//		case 0: click_textbox_set(receipt_name,0,kbv_type_default); break;	
		case 0: click_textbox_set(receipt_price,0,kbv_type_numbers); break;	
		}
		
	draw_line_pixel(xx,yy+height+(i*ysep),ww,2,c_gray,0.8); // draw separating line
	}
	
// split costs button
var submit = (receipt_price != "");
var xx = 0;
var yy = 500;
var height = 40;
var ww = room_width-xx-xx;
var hh = 60;
var col = make_color_rgb(28,164,109); // green
if !submit
var col = c_gray;

if click_button(xx,yy,"Split Costs",height,c_white,ww,hh,col,false,false,submenu) && submit
screen_change(screen.splitCost);

    
if android_back
	{
	//if !kv_active
	screen_goto_prev();
	}

}