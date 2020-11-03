
function scr_timer_beep(){

// press hold timer
if timer[timerIndex.press_hold] == 0
delete_list_enable();

if timer[timerIndex.highlightAction] == 0
scr_timer_highlight_action();

}

function scr_timer_highlight_action() {

switch click_highlight_action
	{
	case highlightAction.newFriend: click_textbox_set(friend_name_entry,0,kbv_type_default,kbv_returnkey_next);
									mode_new_member = true;
									break;
		
	}

click_highlight_action = undefined;	
click_highlight_index = undefined;
}