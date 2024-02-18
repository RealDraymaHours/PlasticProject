var items_x = camera_get_view_x(view_camera[0]) + 10;
var items_y = camera_get_view_y(view_camera[0])+ 156; //106

for(var i = 0; i < array_length(inventory); i++)
{
	var true_item_x = items_x + (i*32);
	draw_sprite(inventory[i].icon,0,true_item_x,items_y);
}