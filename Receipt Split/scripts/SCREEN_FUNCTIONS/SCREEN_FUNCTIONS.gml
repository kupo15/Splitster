function ini_screen_change() {

prev_screen_stack = ds_stack_create();
	
}

function screen_change(ind,clear) {
/// @param screenIndex
/// @param [clear]

if clear == undefined
clear = false;

if argument_count == 2
clear = argument[1]

ds_stack_push(prev_screen_stack,screenIndex);
screenIndex = ind;

if clear
ds_stack_clear(prev_screen_stack);

screen_goto_actions();
}

function screen_goto_prev() {
/// @param [submen]

if argument_count == 1
submenu = argument[0];

click_highlight_screen = screenIndex;

if ds_stack_empty(prev_screen_stack)
	{
	screenIndex = screen.home;
	db("stack empty");
	}
else
screenIndex = ds_stack_pop(prev_screen_stack);

screen_goto_actions();
}

function screen_goto_actions() {

vk_hide();

switch screenIndex
	{
	case screen.receiptAmount:
	case screen.receiptUpdate:
	case screen.receiptCreate: click_textbox_set(receipt_price,0,kbv_type_numbers); break;
	}	
	
}