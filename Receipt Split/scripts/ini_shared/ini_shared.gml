
function ini_shared(){

draw_set_circle_precision(32);

searching = false;
searched = false;
searched_name = "";
searchedList = array_create(0);
searchedMap = ds_map_create();

can_delete = false;
mode_delete = false;
mode_delete_list_id = noone;
deleteList = ds_list_create();

undo_map = ds_map_create();

mode_new_member = false;

transitionReady = 0;
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

dateSelectDay = 0;
dateSelectMonth = 0;
dateSelectYear = 0;
daySelectSpan = 0;

// for current viewed month
dayParse = 0;
monthParse = 0;
yearParse = 0;

calendarDateEntry = date_create_datetime(1970,1,1,1,1,1);
scr_set_date_offsets(calendarDateEntry);

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

// for 3 column calendar
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

canFlick = true;
debugFlickSpeed = 0;




}