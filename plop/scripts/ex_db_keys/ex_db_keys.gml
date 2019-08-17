///@func	ex_db_keys([group])
///@desc	returns a ds_list containing the keys of every database item
///@arg		{string} [group] - (optional) if specified, returns only the keys of a specific group
///@return	{ds_list} a ds_list of item keys

if(argument_count == 0) {
	return global._ex_db_keys;
}
else {
	return ds_map_find_value(global._ex_db_groups, argument[0]);
}