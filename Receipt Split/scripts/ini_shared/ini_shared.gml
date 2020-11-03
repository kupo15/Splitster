
function ini_shared(){

draw_set_circle_precision(32);

searching = false;
searched = false;
searched_name = "";
searchedList = ds_list_create();
searchedMap = ds_map_create();
search_grid = ds_grid_create(2,0);

can_delete = false;
mode_delete = false;
mode_delete_list_id = noone;
delete_list = ds_list_create();

mode_new_member = false;

androidBack = false;

submenu = navbar.hidden;
submenuPrevious = submenu;
activeSubmenu = submenu;

screenIndex = screen.home;

textboxIndex = noone;
datePointer = noone;

canClick = true;
clickMoved = false;

kvStatus = false;
kvActive = false;
kvHeight = 0;
kvLastString = "";
kvInputString = "";

mouse_xstart = 0;
mouse_ystart = 0;

mouse_xdist = 0;
mouse_ydist = 0;

mouse_xprev = 0;
mouse_yprev = 0;

daySpanSelect = 0;
monthParse = 0;
yearParse = 0;

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

monthOffset = 0;
monthOffsetStart = 0;
monthOffsetEnd = 0;

yearSelectOffset = 0;

dayOffset = 0;
dayOffsetStart = 0;
dayOffsetEnd = 0;

year_offset = 0;
year_offset_start = 0;
year_offset_end = 0;
	
headerDeleteOffsetDisp = 0;
headerDeleteOffset = 0;

// variables
scrollbar_num = 3;
scrollbar_disp = array_create(scrollbar_num,0);
scrollbar_disp_end = array_create(scrollbar_num,0);
scrollbar_speed = array_create(scrollbar_num,0);

scrollbarIndex = noone;
scrollbarIndexScrolling = noone;

canFlick = false;
debugFlickSpeed = 0;




}