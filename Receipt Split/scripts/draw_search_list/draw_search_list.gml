
function draw_search_list(xx,yy,ww,sep,rows,height) {

var size = ds_grid_height(search_grid);
for(var i=0;i<size;i++)
	{
	var pointer = search_grid[# 1,i];
	var ind = search_grid[# 2,i];
	var friend_name = pointer.dispName;

	draw_text_height_middled(xx,yy+(i*sep),friend_name,sep,height); // draw friends name
	draw_line_pixel(xx,yy+((i+1)*sep),room_width,1,c_black,0.7);

	if click_region_released(0,yy+(i*sep),ww,sep,true,submenu) 
		{
		textboxIndex = noone;
		searched_name = "";
		keyboard_string = "";
		vk_hide();
		
		friend_index = ind;
		friend_id = pointer;
		
		return true;
		}
	}
	
if searched && size == 0 // if no results
draw_text_height(xx+30,yy+10,"no results!",height); // draw no results

return false;
}
