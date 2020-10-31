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
if click_region_released(xx+xx_off+side_menu_width,yy,ww,hh,noone,navbar.sidebar) // make_color_rgb(0,255,255)
android_back_sidebar = true;

var yy_sep = 180;
draw_line(xx+xx_off,yy_sep,xx+xx_off+ww,yy_sep); // separating line


var xx = side_menu_width*0.5;
var yy = 55;
var ww_hh = sprite_get_width(spr_icon_blank_profile);
draw_sprite(spr_icon_blank_profile,0,xx+xx_off,yy); // profile picture

//if click_region_released(xx+xx_off,yy,ww_hh,ww_hh,mb_left,noone,navbar.sidebar) // clicked on PROFILE PIC
//funct_screen_set(screen.user_profile); // goto to profile

var yy = 120;
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_height(xx+xx_off,yy,user_disp_name,30); // draw user name
draw_text_height(xx+xx_off,yy+25,"@"+user_username,25); // draw user id


// draw menu items
var xx = 55;
var yy = yy_sep;
var yoff = 10;
var sep = 60;
var height = 40;

draw_set_halign(fa_left);
draw_text_height(xx+xx_off,yy+yoff+(screen.home*sep),"Home",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.friendsList*sep),"Friends",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.expenseCreate*sep),"Create Expense",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.squareUp*sep),"Pending Expenses",height);
draw_text_height(xx+xx_off,yy+yoff+(screen.expenseHistory*sep),"Expense History",height);

draw_text_height(xx+xx_off,yy+yoff+(11*sep),"Settings",height);

draw_text_height(xx_off+15,room_height-40,"Vers. "+string(GM_version),30);


for(var i=0;i<12;i++)
	{
	if i>screen.expenseHistory && i<(screen.settings-1)
	continue;
		
	draw_sprite_ext(spr_footer_icon,i,res_bleed_xx+xx_off,yy+9+(i*sep),0.12,0.12,0,c_white,1); // draw menu icons
	
	if i==10
	draw_line(xx_off,yy+(i*sep),xx_off+ww,yy+(i*sep)); // separating line

	if click_region_released(xx_off,yy+(i*sep),ww,sep,true,navbar.sidebar)
		{
		click_highlight_alpha = 0;
		click_highlight_alpha_start = 0;
		
		submenu = navbar.hidden;
		android_back_sidebar = true;

		if i<5
			{
			scr_navbar_click(i);
			new_submenu = true;
			}
		}
	}

#endregion

draw_highlight_click(submenu == navbar.sidebar)

if android_back_sidebar
	{
	// submenu_menu_xpos = 1;
	submenu_menu_xpos = -side_menu_width-30;
	
	if !new_submenu && submenu == navbar.sidebar
	submenu = submenu_previous;
	}


}
