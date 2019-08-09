/// @arg body
/// @arg x
/// @arg y

var body=argument0, X=argument1, Y=argument2, vl=body[? "variable-listener"], upd=0;

if !ATEX_mode_is_enabled(ATEX.nomacros)
for(var i=0; i<ds_list_size(vl); i++) {
	var vr=vl[| i], val=ATEX_variable_get(vr[0]);
	if val!=vr[1] {
		vr[@ 1]=val
		upd=1
	}
}
if upd ATEX_fast_update(argument0, 1)

var surf=ATEX_fast_get_surface(body), de=body[? "delements"];

draw_set_alpha(1)
global.ATEX_mouse_dx-=X
global.ATEX_mouse_dy-=Y
global.ATEX_settings=body[? "props"]
global.ATEX_fast_index=body
global.ATEX_symbol_draw=body[? "draw-symbs"]
if is_array(de) and array_length_1d(de)>0
{
	surface_set_target(surf)
	gpu_set_blendmode(bm_subtract)
	var c=draw_get_colour()
	draw_set_colour(c_black)
	for(var i=0; i<array_length_1d(de); i++)
	{
		var e=de[i], ctype=e[4];
		if ctype=="draw"
		{
			var xx=e[5], yy=e[6], sizes=e[3];
			draw_rectangle(xx, yy, xx+sizes[0], yy+sizes[1], 0)
		}
		else
		{
			var poslist=e[5];
			for(var j=0; j<array_length_1d(poslist); j++)
			{
				var ct=poslist[j]
				draw_rectangle(ct[0], ct[1], ct[2], ct[3], 0)
			}
		}
	}
	draw_set_colour(c)
	gpu_set_blendmode(bm_normal)
	for(var i=0; i<array_length_1d(de); i++)
	{
		var e=de[i];
		global.ATEX_symbol_draw=e[11]
		draw_set_font(e[9])
		draw_set_colour(e[10])
		script_execute(e[0], e[1], e[2], e[3], e[4], e[5], e[6], e[7], e[8])
	}
	surface_reset_target()
}
global.ATEX_settings=global.ATEX_settings_default
global.ATEX_fast_index=-1
global.ATEX_mouse_dx+=X
global.ATEX_mouse_dy+=Y

draw_surface(surf, X, Y)