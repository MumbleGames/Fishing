var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return -1
if type=="names"
	return ["sw", "symbol-width", "", "set"]
if type=="type"
	return ATEX.ext
	
#endregion

if type=="position" {
	var sw=real(ATEX_get_arg(args, 0, global.ATEX_settings[? "symbol-width"]));
	ATEX_current_symboldist=sw
	return [0, 0] // first value - width, second - height. You can write your values
}
else
if type=="draw" {
	var sw=real(ATEX_get_arg(args, 0, global.ATEX_settings[? "symbol-width"]));
	ATEX_current_symboldist=sw
	return true
}