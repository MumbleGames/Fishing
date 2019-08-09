/// @func ATEX_tag_TEMPLATE(arguments, properties, sizes, type)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return -1
if type=="names"
	return ["text", "txt", "return"]
if type=="type"
	return ATEX.element
	
#endregion

if ds_list_size(args)<1 return ""
if type=="position"
{
	return string( ATEX_convert_argument(args[| 0]) ) // first value - width, second - height. You can write your values
}
else
if type=="draw"
{
	/*
			...DOING SOMETHING...
	*/
	return true
}

/*
		You can use draw_set_... functions, you can draw your own things, you can doing what you want, really (just ask your mother for permission)
*/