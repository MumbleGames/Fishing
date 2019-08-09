/// @arg {array} poslist

var mx, my;

if ATEX_mode_is_enabled(ATEX.gui)
	{mx=window_mouse_get_x()+global.ATEX_mouse_dx; my=window_mouse_get_y()+global.ATEX_mouse_dy}
else
	{mx=mouse_x+global.ATEX_mouse_dx; my=mouse_y+global.ATEX_mouse_dy}
	
for(var i=0; i<array_length_1d(argument0); i++)
{
	var cell=argument0[i];
	if point_in_rectangle(mx, my, cell[0], cell[1], cell[2]-1, cell[3]-1)
		return true
}

return false