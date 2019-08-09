/// @func ATEX_tag_TEMPLATE(arguments, properties, sizes, type)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 1
if type=="names"
	return ["space", "_", "tab", "t"]
if type=="type"
	return ATEX.element
	
#endregion

if type=="dynamic"
{
	return false
}
if type=="position"
{
	var w=ATEX_get_arg(args, 0, "    ");
	if is_string(w) w=string_width(w)
	return [w, 1]
}