/// @func ATEX_tag_TEMPLATE(arguments, properties, sizes, type)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 0
if type=="names"
	return ["props", "settings", "prop"]
if type=="type"
	return ATEX.ext
	
#endregion

if global.ATEX_fast_index!=-1
if type=="position"
{
	var key=ds_map_find_first(props), size=ds_map_size(props);
	repeat size {
		ds_map_set(global.ATEX_settings, key, ATEX_convert_argument(props[? key]))
		key=ds_map_find_next(props, key)
	}
	
	return [0, 0] // first value - width, second - height. You can write your values
}
