
function ds_list_create_nest(nest_parent,debug_list) {
/// @param parent_list
/// @param [debug_list]

var list_id = ds_list_create(); // create the list
ds_list_add(nest_parent,list_id); // add to parent list

var last_entry = ds_list_size(nest_parent)-1;
ds_list_mark_as_list(nest_parent,last_entry); // mark list

// optional add list to a debug list
if argument[1] != undefined
ds_list_add(debug_list,list_id);

return list_id; // return created list
}

function ds_list_sort_nested(source_list,ind,ascending) {
/// @description sorts nested lists
/// @param source_list
/// @param sort_index
/// @param ascending

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0); 

// add all data to grid
var size = ds_list_size(source_list); // size of the reference list
for(var i=0;i<size;i++) // loop through list
	{
	var pointer = source_list[| i]; // get the pointer
	var sort_value = pointer[| ind]; // get the sort value

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source list
for(var i=0;i<size;i++)
	{
	source_list[| i] = sorting_grid[# 0,i];
	ds_list_mark_as_list(source_list,i);
	}

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);
}

function ds_list_sort_nested_struct(source_list,key,ascending) {
/// @description sorts nested lists within structs
/// @param source_list
/// @param sort_key
/// @param ascending

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0); 

// add all data to grid
var size = ds_list_size(source_list); // size of the reference list
for(var i=0;i<size;i++) // loop through list
	{
	var pointer = source_list[| i]; // get the pointer
	var sort_value = variable_struct_get(pointer,key); // get the sort value

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source list
for(var i=0;i<size;i++)
	{
	source_list[| i] = sorting_grid[# 0,i];
	ds_list_mark_as_list(source_list,i);
	}

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);
}
