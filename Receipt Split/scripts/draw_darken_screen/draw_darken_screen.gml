
function draw_background_screen() {

// draw background
var col = c_white;
draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false); // darken background

}

function draw_darken_screen() {

if androidBack
switch screenDarkenIndex
	{
	case darkenIndex.calendarYear: screenDarkenIndex = darkenIndex.calendar; break;
		
	case darkenIndex.calendar:
	case darkenIndex.sidebar:
		
	screenDarkenIndex = darkenIndex.none; break;
	}
	
// var col = merge_color(c_white,c_black,darken_screen);

// lerp the darken screen behind it
var lerp_spd = 0.13;
switch screenDarkenIndex
	{
	case darkenIndex.none: screenDarkenAlpha = lerp(screenDarkenAlpha,0,lerp_spd); break;
	case darkenIndex.sidebar: screenDarkenAlpha = 1-(abs(submenu_menu_xpos_disp)/side_menu_width); break;
	case darkenIndex.calendar: screenDarkenAlpha = lerp(screenDarkenAlpha,1,lerp_spd); break;
	}

// draw darken screen
var col = c_black;
draw_set_alpha(screenDarkenAlpha*0.5);	
draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false); // darken background
draw_set_alpha(1);
}