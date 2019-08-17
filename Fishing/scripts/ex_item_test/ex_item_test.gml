///@func	ex_item_test(inv, key, amount, [slot], [tags])
///@desc	simulates inserting an item into an inventory (as in ex_item_add), but doesn't actually insert the item
///@arg		{number} inv - inventory
///@arg		{string} key - the key of the item to insert
///@arg		{number} amount - amount to insert
///@arg		{number} [slot] - (optional) the slot index to insert the item into. Leaving the slot empty or passing -1 as value will insert in the first available slot (or stack)
///@arg		{ds_map|number} [tags] - (optional) a ds_map with the values to insert as tags
///@return	{number} the amount of items that could be inserted by passing the same arguments to ex_item_add

var _inv = argument[0];
var _key = argument[1];
var _amount = argument[2];
var _slot = argument_count > 3 ? argument[3] : -1;
var _tags = argument_count > 4 ? argument[4] : -1;

//return amount of items that can potentially be added
return _ex_fn_item_add(_inv, _key, _amount, _slot, _tags, true);