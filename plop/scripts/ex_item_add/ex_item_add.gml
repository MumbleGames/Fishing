///@func	ex_item_add(inv, key, amount, [slot], [tags])
///@desc	inserts an item into an inventory in the first available slot(s), or in the specified slot.
///@arg		{number} inv - inventory
///@arg		{string} key - the key of the item to insert
///@arg		{number} amount - amount to insert
///@arg		{number} [slot] - (optional) the slot index to insert the item into. Leaving the slot empty or passing -1 as value will insert in the first available slot (or stack)
///@arg		{ds_map|number} [tags] - (optional) a ds_map with the values to insert as tags
///@return	{number} the actual amount of items inserted (same as "amount", given enough space in the inventory or slot)

var _inv = argument[0];
var _key = argument[1];
var _amount = argument[2];
var _slot = argument_count > 3 ? argument[3] : -1;
var _tags = argument_count > 4 ? argument[4] : -1;

//add item to the inventory
var _count = _ex_fn_item_add(_inv, _key, _amount, _slot, _tags, false);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);

//return items count
return _count;