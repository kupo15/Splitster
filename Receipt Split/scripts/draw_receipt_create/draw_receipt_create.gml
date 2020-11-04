
function draw_receipt_create() {
	
// draw the 3 bars
switch screenIndex
	{
	case screen.receiptUpdate: var header = "Update Receipt"; break;
	case screen.receiptAmount: var header = "Receipt Amount"; break;
	
	default: var header = "Create Receipt"; break;
	}

draw_screen_header(headerType.back,headerType.none,header);

if kvActive
switch textboxIndex
	{
	case 0: receipt_price = string_convert_currency(numpad_value,8); break;
	}

var xx = 80;
var yy = 250;
var ww = 500-xx;
var ysep = 120;
var height = 60;
var col = c_gray;

// draw labels
draw_set_halign(fa_left);
draw_text_height_color(xx,yy+height+(0*ysep),"Amount",col,30);

var height = 60;
if receipt_price == ""
draw_text_height(xx+5,yy+(0*ysep),"0.00",height);
else
draw_text_height(xx+5,yy+(0*ysep),receipt_price,height);

for(var i=0;i<1;i++)
	{
	if click_region_released(xx,yy-30+(i*ysep),ww,ysep-30,true,navbar.hidden)
	switch i
		{	
		case 0: click_textbox_set(receipt_price,0,kbv_type_numbers); break;	
		}
		
	draw_line_pixel(xx,yy+height+(i*ysep),ww,2,c_gray,0.8); // draw separating line
	}
	
// split costs button
var submit = 1; // (receipt_price != "");
var hh = 60;
var xx = 0;
var yy = element_numpad.yy-hh;
var height = 40;
var ww = room_width-xx-xx;
var col = make_color_rgb(28,164,109); // green

if !submit
var col = c_gray;

if click_button(xx,yy,"Split Costs",height,c_white,ww,hh,col,false,false,submenu) && submit
	{
	// debug
	if receipt_price == ""
	receipt_price = string(irandom_range(1,10));	
		
	if screenIndex == screen.receiptAmount
	screen_goto_prev();
	else
	screen_change(screen.splitCost);
	
	active_receipt.split[0].share = receipt_price;
	}

    
if androidBack
	{
	//if !kvActive
	screen_goto_prev();
	}

}