var type=argument0, args=argument1, props=argument2, cpos=argument3, lineH=argument4, h=argument5, symb=argument6, text=argument7, symb_index=argument8;

#region tag data

if type!=""
if type=="depth" 
	return 0
if type=="names"
	return ["rainbow"]
if type=="type"
	return ATEX.effect
	
#endregion

var col=draw_get_colour();
draw_set_colour(make_color_hsv((cpos[0]/ATEX_get_prop(props, "l", 100)+current_time*0.001*ATEX_get_prop(props, "t", 1))*255 mod 256, ATEX_get_prop(props, "s", 240), ATEX_get_prop(props, "v", 240)))

return true