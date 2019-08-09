var type=argument0, args=argument1, props=argument2, cpos=argument3, lineH=argument4, h=argument5, symb=argument6, text=argument7, symb_index=argument8;

#region tag data

if type=="depth" 
	return 0
if type=="names"
	return ["shake", "angry"]
if type=="type"
	return ATEX.effect
	
#endregion

var strong=ATEX_get_prop(props, "strong", 1);

cpos[@ 0]+=random_range(-strong, strong)
cpos[@ 1]+=random_range(-strong, strong)

return true