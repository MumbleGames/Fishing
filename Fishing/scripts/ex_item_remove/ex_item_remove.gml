///@func	ex_item_remove(inv, key, amount, [slot])
///@desc	removes an item from the inventory in general, or from a specific slot
///@arg		{number} inv - inventory
///@arg		{string} key - the key of the item to remove (ignored if removing from a specific slot)
///@arg		{number} amount - number of items to remove. -1 removes all the items.
///@arg		{number} [slot] - (optional) the slot index where the items are removed from
///@return	{number} the amount of items actually removed (same as amount, given enough items)

var _inv = argument[0];
var _slot = argument_count > 3 ? argument[3] : -1;

var _inv_items = _inv[? "items"];

//check if slot specified, and fetch key and amount
var _key, _amount; 
if(_slot >= 0) {
	_key = _inv_items[# EX_COLS.key, _slot];
	_amount = argument[2] < 0 ? _inv_items[# EX_COLS.amount, _slot] : argument[2];
}
else {
	_key = argument[1];
	_amount = argument[2] < 0 ? ex_inv_count(_inv, _key) : argument[2];
}

//remove items
var _count = _ex_fn_item_remove(_inv, _key, _amount, _slot);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);

//return items count
return _count;