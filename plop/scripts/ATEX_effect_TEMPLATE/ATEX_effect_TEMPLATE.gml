var type=argument0, args=argument1, props=argument2, cpos=argument3, lineH=argument4, h=argument5, symb=argument6, text=argument7, symb_index=argument8;

#region tag data

if type=="depth" 
	return 10
if type=="names"
	return ["shadow"]
if type=="type"
	return ATEX.drawer
	
#endregion

return true