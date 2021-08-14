
function app_setup_set(ww,hh) {
	
ww = display_get_width();
hh = display_get_height();		
	
surface_resize(application_surface,ww,hh); // resize app surface
display_set_gui_size(ww,hh); // set GUI

// set app layout variables
DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
}