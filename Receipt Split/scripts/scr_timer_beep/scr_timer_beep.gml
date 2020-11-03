
function scr_timer_beep(){

// press hold timer
if timer[timerIndex.press_hold] == 0
delete_list_enable();

}

function scr_timer_highlight_action(ind) {

if timer[timerIndex.highlightAction] != 0
exit;

var active_ind = click_highlight_action;

click_highlight_action = undefined;	
click_highlight_index = undefined;

return active_ind == ind;
}