/// @func ATEX_get_arg(args, index, default_value, [convert], [description])
/// @arg {real} args
/// @arg {real} ind
/// @arg default_value Default value for this key
/// @arg {boolean} [convert] True or miss if you want to convert value and False if you don't
/// @arg {string} [description] Description of the tag. It will be used when user skip this argument

var args=argument[0], ind=argument[1], def=argument[2], convert=true, desc="";

if argument_count>3
	convert=argument[3]
if argument_count>4
	desc=argument[4]

var val=ds_list_find_value(args, ind);

if val==undefined
{
	val=def
	if desc!=""
		show_debug_message("ATEX: tag: scipped argument: \""+desc+"\"")
}
else
{
	if convert
		val=ATEX_convert_argument(val)
}

return val
