///@func	ex_item_set(inv, key, amount, slot, [tags])
///@desc	sets the contents of a slot, replacing the current item (if any)
///@arg		{number} inv - inventory
///@arg		{string} key - the key of the item to insert
///@arg		{number} amount - number of items to insert
///@arg		{number} slot - the slot index where the item will be set
///@arg		{ds_map|number} [tags] - (optional) ds_map holding item tags. Omit the argument or pass -1 to set no tags
///@return	{number} the actual amount of items inserted (same as amount, unless greater than stack size)

var _inv = argument[0];
var _key = argument[1];
var _amount = argument[2];
var _slot = argument[3];
var _tags = argument_count > 4 ?  argument[4] : -1;

//set the item
var _count = _ex_fn_item_set(_inv, _key, _amount, _slot, _tags);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);

//return count
return _count;