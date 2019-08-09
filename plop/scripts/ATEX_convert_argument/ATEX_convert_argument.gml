/// @func ATEX_convert_argument(value)
/// @desc This function will return real value of argument
/// @arg {string} value

var str=argument0, intstr=string_replace(string_replace(str, "-", ""), ".", "");

if str=="" return str
if string_digits(intstr)==intstr
	return real(str)
else if string_char_at(str, 1)="@"
{
	var args=[], args_i=0, arg="", csymb, i=1;
	csymb=string_char_at(str, i)
	while i<string_length(str)
	{
		i++
		csymb=string_char_at(str, i)
		while ( csymb!="." and i<=string_length(str) )
		{
			arg+=csymb
			i++
			csymb=string_char_at(str, i)
		}
		if arg!=""
		{
			args[args_i]=arg
			args_i++
		}
		arg=""
	}
	
	var ID=noone, val="";
	if array_length_1d(args)<1 return argument0
	if asset_get_index(args[0])>-1
	{
		var type=asset_get_type(args[0]), index=asset_get_index(args[0]);
		if type==asset_object
			if instance_exists(index)
				ID=index.id
			else
				return show_debug_message("ATEX: Object "+args[0]+" does not exists! <<< "+str)
		else if type==asset_script
			if args[args_i-1]=="@exe"
				val=script_execute(index, args)
			else
				val=index
		else
			val=index
	}
	else
	{
		var ID=id, i=1;
		if args[0]=="global"
		{
			if variable_global_exists(args[1])
			{
				val=variable_global_get(args[1])
				ID=val
				i=2
			}
			else
				return show_debug_message("ATEX: global variable "+args[1]+" does not exists! <<< "+str)
		}
		else
		{
			if variable_instance_exists(id, args[0])
			{
				val=variable_instance_get(id, args[0])
				ID=val
			}
			else
				return show_debug_message("ATEX: local variable "+args[0]+" for object "+object_get_name(object_index)+" does not exists! <<< "+str)
		}
	}
	if ID!=noone
		for(i=i; i<args_i; i++)
		{
			if variable_instance_exists(ID, args[i])
			{
				val=variable_instance_get(ID, args[i])
				ID=val
			}
			else
			{
				return show_debug_message("ATEX: local variable "+args[i]+" for object "+object_get_name(ID.object_index)+" does not exists! <<< "+str)
				break
			}
		}
	return val
}
else
if string_char_at(str, 1)=="\""
	return string_delete(string_delete(str, 1, 1), string_length(str)-1, 1)
else
if string_char_at(str, 1)=="\\"
	return string_delete(str, 1, 1)
else
if !ATEX_mode_is_enabled(ATEX.nomacros) {
	var val=ATEX_variable_get(str);
	if val!=undefined
		return val
	else
		return str
}
else
	return str