function ds_list_sort_nested(source_list,ind,sort_type) {
	// sorts nested lists
	/// @param source_list
	/// @param sort_index
	/// @param ascending

	var sorting_grid = ds_grid_create(2,0); // create temp sorting grid

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
	
	ds_grid_sort(sorting_grid,1,sort_type); // sort grid

	// re add pointers back to the source list
	for(var i=0;i<size;i++)
		{
		source_list[| i] = sorting_grid[# 0,i];
		ds_list_mark_as_list(source_list,i);
		}


	ds_grid_destroy(sorting_grid);


}

function ds_list_sort_nested_struct(source_list,key,sort_type) {
	// sorts nested lists
	/// @param source_list
	/// @param sort_key
	/// @param ascending

	var sorting_grid = ds_grid_create(2,0); // create temp sorting grid

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
	
	ds_grid_sort(sorting_grid,1,sort_type); // sort grid

	// re add pointers back to the source list
	for(var i=0;i<size;i++)
		{
		source_list[| i] = sorting_grid[# 0,i];
		ds_list_mark_as_list(source_list,i);
		}


	ds_grid_destroy(sorting_grid);


}
