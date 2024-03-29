
// json saving
#macro save_data "split_save.dat"
#macro json_version "1.0"

// header
#macro header_color c_black // make_color_rgb(0,122,173)
#macro header_height 80
#macro header_font_height 50

// background colors
#macro c_lt_gray make_color_rgb(228,228,228)

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

#macro set_background_color draw_rectangle_color(0,0,room_width,room_height,col,col,col,col,false)
#macro dialogue draw_dialogue_box(xx,yy,ww,hh,col,sub)
#macro db show_debug_message