
function draw_dialogue_box(xx,yy,ww,hh,col,sub) {

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

if click_region_released(xx,yy,ww,hh,true,sub)
return true;
else
return false;
}