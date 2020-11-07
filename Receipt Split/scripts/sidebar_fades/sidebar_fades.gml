function sidebar_fades() {
	
	// navbar
	navbar_yoff = (submenu != navbar.main); // ? navbar_yoff = false : navbar_yoff = true

	if navbar_yoff != navbar_yoff_start
	navbar_yoff_start = lerp(navbar_yoff_start,navbar_yoff,0.19);

	// friendsbar
	friendsbar_yoff = !(submenu == navbar.friendsBar); // ? coursebar_yoff = true : coursebar_yoff = false

	if friendsbar_yoff != friendsbar_yoff_start
	friendsbar_yoff_start = lerp(friendsbar_yoff_start,friendsbar_yoff,0.19);
	
	// numpad
	numpad_yoff = !(submenu == navbar.numpad); // ? coursebar_yoff = true : coursebar_yoff = false

	if numpad_yoff != numpad_yoff_start
	numpad_yoff_start = lerp(numpad_yoff_start,numpad_yoff,0.19);
	
	// alpha
	if alpha_lerp != alpha_lerp_end
	alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,0.19);

	// lerp the side menu position
	var lerp_spd = 0.13;

	if submenu_menu_xpos != submenu_menu_xpos_disp
	submenu_menu_xpos_disp = lerp(submenu_menu_xpos_disp,submenu_menu_xpos,lerp_spd);
		
	// header delete
	headerDeleteOffset = mode_delete;

	if headerDeleteOffset != headerDeleteOffsetDisp
	headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
}
