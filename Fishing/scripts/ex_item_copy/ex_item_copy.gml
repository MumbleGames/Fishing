///@func	ex_item_copy(source_inv, source_slot, amount, dest_inv, [dest_slot])
///@desc	inserts an item into an inventory by copying it from a slot in another (or same) inventory
///@arg		{number} source_inv - source inventory to copy from
///@arg		{number} source_slot - slot in the source inventory
///@arg		{number} dest_inv - destination inventory to copy the item(s) to
///@arg		{number} amount - amount to insert (use -1 to copy the amount from the source)
///@arg		{number} [dest_slot] - (optional) slot index in the destintation inventory
///@return	{number} the amount of items that could be inserted in the destination inventory

//get the the source data
var _source_inv = argument[0];
var _source_slot = argument[1];
var _source_items = _source_inv[? "items"];
var _source_key = _source_items[# EX_COLS.key, _source_slot];
var _source_tags = _source_items[# EX_COLS.tags, _source_slot];
var _source_amount = _source_items[# EX_COLS.amount, _source_slot];

//prepare destination data
var _dest_inv = argument[2];
var _dest_amount = argument[3] < 0 ? _source_amount : argument[3];
var _dest_slot = argument_count > 4 ? argument[4] : -1;

//add item to the inventory
var _count = _ex_fn_item_add(_dest_inv, _source_key, _dest_amount, _dest_slot, _source_tags, false);

//fire notification
ex_ev_notify(_dest_inv, EX_EVENTS.inv_updated);

//return items count
return _count;