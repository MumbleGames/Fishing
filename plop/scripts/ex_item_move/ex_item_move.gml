///@func	ex_item_move(inv1, slot1, inv2, amount, [slot2])
///@desc	moves an item from one slot to another, in the same inventory or a different one
///@arg		{number} inv1 - the inventory to move the item from
///@arg		{number} slot1 - the slot index in the first inventory
///@arg		{number} inv2 - the inventory to move the item to
///@arg		{number} amount - amount of items to move (use -1 to move all the items)
///@arg		{number} [slot2] - the slot in the second inventory. If omitted, inserts in the first available slots or stacks.
///@return	{number} the actual amount of items moved (same as amount unless there's not enough space in inv2)

//get the the source data
var _source_inv = argument[0];
var _source_slot = argument[1];
var _source_items = _source_inv[? "items"];
var _source_key = _source_items[# EX_COLS.key, _source_slot];
var _source_tags = _source_items[# EX_COLS.tags, _source_slot];
var _source_amount = _source_items[# EX_COLS.amount, _source_slot];

//prepare destination data
var _dest_inv = argument[2];
var _dest_amount = argument[3] < 0 ? _source_amount : min(_source_amount, argument[3]);
var _dest_slot = argument_count > 4 ? argument[4] : -1;

//add item to the destination inventory
var _count = _ex_fn_item_add(_dest_inv, _source_key, _dest_amount, _dest_slot, _source_tags, false);

//remove items
_ex_fn_item_remove(_source_inv, _source_key, _count, _source_slot);	

//notify changes
ex_ev_notify(_source_inv, EX_EVENTS.inv_updated);
ex_ev_notify(_dest_inv, EX_EVENTS.inv_updated);

//return items count
return _count;