///@func	_ex_fn_item_clear(inv, slot)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} inv
///@arg		{number} slot

var _inv = argument0;
var _slot = argument1;
var _inv_items = _inv[? "items"];
var _inv_item = _inv_items[# EX_COLS.item, _slot];

//exit if already empty
if(_inv_item < 0) { return false; }

//reduce inventory size
_inv[? "size"] -= 1;

//clear slot
_inv_items[# EX_COLS.key, _slot] = "";
_inv_items[# EX_COLS.amount, _slot] = 0;
_inv_items[# EX_COLS.stack_id, _slot] = "";
_inv_items[# EX_COLS.item, _slot] = -1;

if(_inv_items[# EX_COLS.tags, _slot] >= 0) {
	ds_map_destroy(_inv_items[# EX_COLS.tags, _slot]);
	_inv_items[# EX_COLS.tags, _slot] = -1;
}

//mark slot as updated
var _updated_slots = _inv[? "updated_slots"];
ds_list_add(_updated_slots, _slot);

//return success
return true;