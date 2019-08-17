///@func	ex_item_get_key(inv, slot)
///@desc	returns the key of the item at the given slot index, or an empty string if the slot is empty
///@arg		{number} inv - inventory
///@arg		{number} slot - slot index
///@return	{string}

return _ex_fn_item_get(argument0, argument1, EX_COLS.key);