
function clickout_region(xx,yy,ww,hh,highlight,_sub) {

var tolerance = 5;
xx -= tolerance;
yy -=tolerance;
ww +=tolerance*2;
hh += tolerance*2;

if submenu != _sub
exit;

if androidBack || (canClick && !click_region(xx,yy,ww,hh,noone,highlight,_sub) && mouse_check_button_released(mb_left))
return true;
else
return false;
}

function click_textbox_set(str,textbox_ind,kvInit,kvGo) {
/// @param string
/// @param textboxInd
/// @param kvType
/// @param [kvGo]

var int = argument[3];

keyboard_string = str;
kvLastString = str;
textboxIndex = textbox_ind; // set the textbox index

vk_initiate(kvInit,kvGo); // popup keyboard
}

function ini_cursor_vars() {

	textboxStringScale = noone;
	textboxStringLength = 0;
	textboxStringWidth = 0;

	cursorSet = false;
	cursorSetIndex = 0;
	cursorPos = 0; // the actual cursor position in string
	cursorPosStart = 0; // the starting position
	cursorXposOff = 0; // the cursor xpos in pixels
	cursorHoverPos = 0;

}

function scr_cursor_position_set(str,scale) {

	if cursorSet
	cursorSetIndex ++;

	if cursorSetIndex < 2
	exit;

	// reset
	cursorSet = false;
	cursorSetIndex = 0;

	var str_length = 0;
	var str_clicked_pos = textboxStringWidth*cursorHoverPos; // xpos within string

	if cursorHoverPos == 0 // clicked before first text character
		{
		cursorPos = 0;
		cursorPosStart = 0;
		cursorXposOff = 0;
		exit;
		}
	else // somewhere in the middle
	for(var i=0;i<textboxStringLength;i++) // loop through characters in string
		{
		var char = string_char_at(str,1+i); // get this character	
		var char_width = string_width(char)*scale; // width of the character
	
		str_length += char_width*0.5; // add half width to string length
		if str_clicked_pos < str_length // if clicked point is before added character
			{
			cursorPos = i;
			cursorPosStart = cursorPos;
			cursorXposOff = str_length-(char_width*0.5);
			exit;
			}
		else str_length += char_width*0.5; // add the rest of the width
		}
	
	// set to the end
	cursorPos = textboxStringLength;
	cursorPosStart = cursorPos;
	cursorXposOff = textboxStringWidth;


}
	
// CLICK REGION FUNCTIONS
function click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,array_pos) {
	
var col = c_yellow;
var alpha = 0.3;

var mx = mouse_x;
var my = mouse_y;

var within_region = (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh);
var test_failed = (sub != submenu) || !canClick;

if mouse_check_button_pressed(button)
	{
	mouse_xstart = mouse_x;
	mouse_ystart = mouse_y;
	
	mouse_xdist = 0;
	mouse_ydist = 0;
	}

if within_region
	{
	// highlight region
	if (os_type == os_windows) && highlight
		{
		if (sub != submenu)
		var col = c_red;
		else if !canClick && mouse_check_button(mb_left)
		var col = c_orange;
			
		draw_set_alpha(alpha);
		draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,col,col,col,col,false);
		draw_set_alpha(1);
		}
		
	if test_failed
	exit;
	
	// clicked highlight
	if mouse_check_button_pressed(button) && highlight
	scr_click_highlight_set(x_left,y_top,ww,hh,highlight,screenIndex,array_pos);
           
	if condition || (condition == undefined)
	    {
		if mouse_check_button_released(button)
			{
			canClick = false;
			scrollbarIndexScrolling = noone;
			}
			
	    return true;
	    }
	else 
	return false;
	}

return false;
}

function click_region_released(x_left,y_top,ww,hh,highlight,sub) {
	
var button = mb_left;	
var condition = mouse_check_button_released(button);
	
return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined);
}

function click_region_pressed(x_left,y_top,ww,hh,highlight,sub) {
	
var button = mb_left;	
var condition = mouse_check_button_pressed(button);

return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined);
}

function click_region(x_left,y_top,ww,hh,highlight,button,sub) {

var condition = mouse_check_button(button) || mouse_check_button_pressed(button)

if button == noone
var condition = undefined;
	
return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined);
}


function click_region_pressed_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos) {
	
var condition = mouse_check_button_pressed(button);
	
return click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos);
}

function click_region_released_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos,ref_list,active_sub) {
	
var condition = mouse_check_button_released(button);

// draw clicked highlight
draw_highlight_click_clamp(y_top,yoff,hh,box_hh,array_pos,active_sub);
	
// highlight selected
if (ref_list != undefined) && mode_delete
delete_list_draw_selected(x_left,y_top,yoff,ww,hh,box_hh,delete_list,array_pos);
	
// set list variables to delete
if (ref_list != undefined) && !mode_delete && click_region_pressed_clamp(0,y_top,yoff,ww,hh,box_hh,button,false,sub,array_pos)	
delete_list_set(ref_list,array_pos);
	
return click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos)
}

function click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos) {

// change yy and sep/hh
var ypos = y_top+yoff;
var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window
var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = hh-sep_adj;
		
// if hanging off the bottom
if ypos+sep > y_top+box_hh
sep = y_top+box_hh-ypos;

// set variables
y_top = ypos_clamp;
hh = sep;

// y_top += yoff; // top of selection

return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,array_pos);
}

// HIGHLIGHT FUNCTIONS
function ini_highlight_vars() {
	
click_highlight_xpos = 0;
click_highlight_ypos = 0;
click_highlight_width = 0;
click_highlight_width_end = 0;
click_highlight_height = 0;

click_highlight_alpha = 0;
click_highlight_alpha_end = 0;
click_highlight_color = c_gray;
click_highlight_screen = noone;
click_highlight_index = undefined;

click_highlight_action = undefined;

activeSubmenu = navbar.hidden;
}

function scr_click_highlight_set(xx,yy,ww,hh,col,screen_ind,array_pos){

if col == c_yellow
col = c_gray;

click_highlight_xpos = xx+(ww*0.5); // middle of region
click_highlight_ypos = yy;

click_highlight_width = ww*0.2; // starting width
click_highlight_width_end = ww;

click_highlight_height = hh;
click_highlight_alpha = 0;
click_highlight_alpha_end = 1;
click_highlight_color = col;
click_highlight_screen = screen_ind;
click_highlight_index = array_pos;

activeSubmenu = submenu;
}

function draw_highlight_click_clamp(y_top,yoff,ysep,box_hh,array_pos,active_sub) {
/// @description used for looping through lists

if active_sub == undefined
active_sub = activeSubmenu;

if (click_highlight_index != array_pos) || (activeSubmenu != active_sub)
exit;

// change yy and sep/hh
var ypos = y_top+yoff;
var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window

var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = ysep-sep_adj;
		
// if hanging off the bottom
if ypos+sep > y_top+box_hh
var sep = y_top+box_hh-ypos;

// set drawing variables
var xx = click_highlight_xpos;
var yy = ypos_clamp;
var hh = sep;
var col = click_highlight_color;

highlight_draw(xx,yy,hh,col);
}
	
function draw_highlight_click_static(sub) {
	
if click_highlight_index != undefined || !sub
exit;

// set drawing variables
var xx = click_highlight_xpos;
var yy = click_highlight_ypos;
var hh = click_highlight_height;
var col = click_highlight_color;

highlight_draw(xx,yy,hh,col);
}
	
function highlight_animation() {
// unused

// lerp position
if click_highlight_width != click_highlight_width_end
click_highlight_width = lerp(click_highlight_width,click_highlight_width_end,click_highlight_lerp);

// lerp alpha
if click_highlight_alpha != click_highlight_alpha_end
click_highlight_alpha = lerp(click_highlight_alpha,click_highlight_alpha_end,click_highlight_lerp*0.9);
	
}

function highlight_fadeout(xx) {
	
var width_reached = (click_highlight_width/click_highlight_width_end) > 0.999;
var clickout = width_reached && !mouse_check_button(mb_left);

// fade away when released OR not inside of box
if clickout || (clickMoved && width_reached)
click_highlight_alpha_end = 0; // fade away	
	
}

function highlight_draw(xx,yy,hh,col) {
	
// lerp position
if click_highlight_width != click_highlight_width_end
click_highlight_width = lerp(click_highlight_width,click_highlight_width_end,click_highlight_lerp);

// lerp alpha
if click_highlight_alpha != click_highlight_alpha_end
click_highlight_alpha = lerp(click_highlight_alpha,click_highlight_alpha_end,click_highlight_lerp*0.9);

// set values
var ww = click_highlight_width*0.5;
var alpha = click_highlight_alpha*(click_highlight_screen == screenIndex);

draw_set_alpha(0.4*alpha);
draw_roundrect_color(xx-ww,yy,xx+ww,yy+hh,col,col,false); // draw highlight
draw_set_alpha(1);

// when to fade away
highlight_fadeout(xx);

}
	
