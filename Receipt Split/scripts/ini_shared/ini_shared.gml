
function ini_shared(){

searching = false;
searched = false;
searched_name = "";
search_grid = ds_grid_create(2,0);

can_delete = false;
mode_delete = false;
mode_delete_list_id = noone;
delete_list = ds_list_create();

android_back = false;

submenu = navbar.hidden;
submenuPrevious = submenu;
activeSubmenu = submenu;

screenIndex = screen.home;

textboxIndex = noone;
datePointer = noone;

canClick = true;

kvStatus = false;
kvActive = false;
kv_last_string = "";
kv_input_string = "";

mouse_xstart = 0;
mouse_ystart = 0;

mouse_xdist = 0;
mouse_ydist = 0;

mouse_xprev = 0;
mouse_yprev = 0;

day_span_select = 0;
month_parse = 0;
year_parse = 0;

alpha_lerp = 0;
alpha_lerp_end = 0;

debug_reset = false;

// submenus
submenu_menu_xpos = -side_menu_width-30;
submenu_menu_xpos_disp = submenu_menu_xpos;
	
darken_screen = false;
screen_darken_alpha = 0;
screen_darken_value = 0;

// offsets
navbar_yoff = 1;
navbar_yoff_start = 1;

month_offset = 0;
month_offset_start = 0;
month_offset_end = 0;

year_select_offset = 0;

day_offset = 0;
day_offset_start = 0;
day_offset_end = 0;

year_offset = 0;
year_offset_start = 0;
year_offset_end = 0;
	
header_delete_offset_disp = 0;
header_delete_offset = 0;

// variables
scrollbar_num = 3;
scrollbar_disp = array_create(scrollbar_num,0);
scrollbar_disp_end = array_create(scrollbar_num,0);
scrollbar_speed = array_create(scrollbar_num,0);

scrollbarIndex = noone;
scrollbarIndexScrolling = noone;

can_flick = false;
debug_flick_speed = 0;




}