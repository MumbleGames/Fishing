///@func	ex_db_add(item, [group])
///@desc	adds a new item into the database
///@arg		{ds_map} item - a ds_map holding the item attributes. The map has to define at least the "key" and "stack_size" attributes.
///@arg		{string} [group] - (optional) the group the item belongs to

var _item = argument[0];
var _key = _item[? "key"];

//check for errors
if(!ds_map_exists(_item, "key") || !ds_map_exists(_item, "stack_size")) {
	show_debug_message("!ERROR! ex_db_add: Trying to add an items without a key or stack_size attribute");
	exit;
}

if(ds_map_exists(global._ex_db, _item[? "key"])) {
	show_debug_message("!ERROR! ex_db_add: An item with the same key exists in the database");
	exit;
}

//add to database
ds_map_add_map(global._ex_db, _key, _item);

//add key to master list
ds_list_add(global._ex_db_keys, _key);

//add key to group, creating one if it doesn't exist
if(argument_count > 1) {
	var _group_name = argument[1];
	var _group = global._ex_db_groups[? _group_name];
	
	if(is_undefined(_group)) {
		_group = ds_list_create();
		ds_map_add_list(global._ex_db_groups, _group_name, _group);
	}
	
	ds_list_add(_group, _key);
}