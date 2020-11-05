function draw_sidebar_main_menu() {

#region draw menu

var new_submenu = false;
var xx_off = submenu_menu_xpos_disp;
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = room_height;
var col = c_white;

draw_rectangle_color(xx+xx_off,yy,xx+xx_off+ww,yy+hh,col,col,col,col,false); // menu background

// if click outside of menu
if (submenu == navbar.sidebar) && click_region_released(xx+xx_off+side_menu_width,yy,ww,hh,noone,navbar.sidebar) // make_color_rgb(0,255,255)
androidBackSidebar = true;

var yy_sep = 180;
draw_line(xx+xx_off,yy_sep,xx+xx_off+ww,yy_sep); // separating line

var xx = side_menu_width*0.5;
var yy = 55;
var ww_hh = 100;

draw_icon_width(spr_icon_blank_profile,xx+xx_off,yy,ww_hh,1); // profile picture

//if click_region_released(xx+xx_off,yy,ww_hh,ww_hh,mb_left,false,navbar.sidebar) // clicked on PROFILE PIC
//funct_screen_set(screen.user_profile); // goto to profile

var yy = 120;
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_height(xx+xx_off,yy,profileInfo.dispName,30); // draw user name
draw_text_height(xx+xx_off,yy+25,"@"+profileInfo.userId,25); // draw user id


// draw menu items
var xx = 100;
var yy = yy_sep;
var sep = 70;
var height = 30;
var yoff = (sep-height)*0.5;

draw_set_halign(fa_left);
draw_text_height(xx+xx_off,yy+yoff+(screen.home*sep),"Home",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.friendsList*sep),"Friends",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.expenseCreate*sep),"Create Expense",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.expensesPending*sep),"Pending Expenses",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.expenseHistory*sep),"Event History",height);

draw_text_height(xx+xx_off,yy+yoff+(screen.settings*sep),"Settings",height);

draw_text_height(xx_off+15,room_height-40,"Vers. "+string(GM_version),30);

// move highlight with side bar
if activeSubmenu == navbar.sidebar
click_highlight_xpos = xx_off+(ww*0.5);

for(var i=0;i<screen.enumcount;i++)
	{
	if i>screen.expenseHistory && i<(screen.settings-1)
	continue;

	// draw menu icons	
	draw_icon_height_centered(spr_footer_icon,i,res_bleed_xx+xx_off,yy+(i*sep),sep*0.7,sep,sep*0.7,1); 

	if i==screen.settings-1
	draw_line(xx_off,yy+(i*sep),xx_off+ww,yy+(i*sep)); // separating line

	if click_region_released_clamp(xx_off,yy,(i*sep),ww,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		click_highlight_alpha = 0;
		click_highlight_alpha_start = 0;
		
		submenu = navbar.hidden;
		androidBackSidebar = true;

		scr_navbar_click(i);
		new_submenu = true;
		}
	}

#endregion

if androidBackSidebar
	{
	// submenu_menu_xpos = 1;
	submenu_menu_xpos = -side_menu_width-30;
	
	// go back to previous submenu if clicked 3bars from a submenu
	if !new_submenu && (submenu == navbar.sidebar)
	submenu = submenuPrevious;
	}


}
