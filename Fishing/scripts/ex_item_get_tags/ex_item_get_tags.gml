///@func	ex_item_get_tags(inv, slot)
///@desc	returns the tags at the given slot index, or -1 if no tags are set in the slot
///@arg		{number} inv - inventory
///@arg		{number} slot - slot index
///@return	{ds_map|number}

//get the value of the tags column
var _tags = _ex_fn_item_get(argument0, argument1, EX_COLS.tags);

if(_tags >= 0) {
	_tags = _ex_fn_ds_map_dup(_tags);
}

return _tags;

