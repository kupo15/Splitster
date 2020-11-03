
function scr_timer_beep(){

// press hold timer
if timer[timerIndex.press_hold] == 0
delete_list_enable();

}

function scr_timer_highlight_action(ind) {

if transitionReady != 2
exit;

var active_ind = click_highlight_action;

click_highlight_action = undefined;	
click_highlight_index = undefined;
transitionReady = 0;

return active_ind == ind;
}