function ini_screen_change() {

prev_screen_stack = ds_stack_create();
	
}

function screen_change(ind,clear) {
/// @param screen_index
/// @param [clear]

if clear == undefined
clear = false;

if argument_count == 2
clear = argument[1]

ds_stack_push(prev_screen_stack,screen_index);
screen_index = ind;

if clear
ds_stack_clear(prev_screen_stack);

vk_hide();
}

function screen_goto_prev() {
/// @param [submen]

if argument_count == 1
submenu = argument[0];

if ds_stack_empty(prev_screen_stack)
	{
	screen_index = ds_stack_pop(prev_screen_stack);
	db("stack empty");
	}
else
screen_index = ds_stack_pop(prev_screen_stack);

vk_hide();
}
