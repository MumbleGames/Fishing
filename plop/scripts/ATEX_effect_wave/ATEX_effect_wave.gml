var type=argument0, args=argument1, props=argument2, cpos=argument3, lineH=argument4, h=argument5, symb=argument6, text=argument7, symb_index=argument8;

#region tag data

if type=="depth" 
	return 0
if type=="names"
	return ["wave"]
if type=="type"
	return ATEX.effect
	
#endregion

cpos[@ 1]+=cos((cpos[0]/ATEX_get_prop(props, "w", 50)+current_time*0.001*ATEX_get_prop(props, "t", 1))*6.28)*ATEX_get_prop(props, "h", 6)/2

return true