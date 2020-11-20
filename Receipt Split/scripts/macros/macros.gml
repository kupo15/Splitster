
// json saving
#macro json_version "0.1"
#macro save_data "split_save.dat"
#macro app_save json_save_array(save_data,ROOT_data_struct)
#macro app_load json_load_array(save_data)

// header
#macro header_color c_black // make_color_rgb(0,122,173)
#macro header_height 80
#macro header_font_height 50

// background colors
#macro c_lt_gray make_color_rgb(228,228,228)
#macro c_click_color make_color_rgb(235,235,235)
#macro c_app_green make_color_rgb(28,164,109)

// navbar
#macro nav_sca_off 0.85
#macro nav_height 125
#macro nav_ico_num 5
#macro navbar_color c_black // make_color_rgb(0,122,173)

// sidebar
#macro side_menu_width 420
#macro SIDEBAR_LERP 0.16

// textbox scrolling
#macro fric 0.009
#macro flick_max 0.5
#macro flick_window 5
#macro refresh_dist 6

// cursor
#macro cursor_blink 500
#macro cursor_color c_aqua
#macro cursor_width 3

// clicking
#macro press_hold_timer 30
#macro click_highlight_lerp 0.35

// layout
#macro res_bleed_xx 15
#macro res_bleed_yy 10
#macro DPI_POINT 72

// calendar
#macro start_date date_create_datetime(1970,1,1,1,1,1)

// misc
#macro dialogue draw_dialogue_box(xx,yy,ww,hh,col,sub)

// debug
#macro db show_debug_message
#macro sm show_message
#macro cs clipboard_set_text
#macro cg clipboard_get_text
#macro js json_stringify