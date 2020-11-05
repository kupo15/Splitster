
// json saving
#macro json_version "0.1"
#macro save_data "split_save-"+json_version+".dat"
#macro app_save json_save_array(save_data,ROOT_data_struct)
#macro app_load json_load_array(save_data)

// header
#macro header_color c_black // make_color_rgb(0,122,173)
#macro header_height 80
#macro header_font_height 50

// background colors
#macro c_lt_gray make_color_rgb(228,228,228)
#macro c_click_color make_color_rgb(235,235,235)

// navbar
#macro nav_sca_off 0.85
#macro nav_height 125
#macro nav_ico_num 5
#macro navbar_color c_black // make_color_rgb(0,122,173)

// sidebar
#macro side_menu_width 420

// textbox scrolling
#macro fric 0.009
#macro flick_max 0.5
#macro flick_window 5

// cursor
#macro cursor_blink 500
#macro cursor_color c_aqua
#macro cursor_width 3

#macro refresh_dist 6

#macro press_hold_timer 30

#macro click_highlight_lerp 0.35

#macro res_bleed_xx 15
#macro res_bleed_yy 10

#macro start_date date_create_datetime(1970,1,1,0,0,0)

#macro dialogue draw_dialogue_box(xx,yy,ww,hh,col,sub)
#macro db show_debug_message
#macro sm show_message
