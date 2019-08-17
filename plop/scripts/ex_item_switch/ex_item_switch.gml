///@func	ex_item_switch(inv1, slot1, inv2, slot2)
///@desc	switches the contents of the two specified slots, either in the same or different inventories.
///@arg		{number} inv1 - the first inventory
///@arg		{number} slot1 - index of the slot in inv1
///@arg		{number} inv2 - the second inventory
///@arg		{number} slot2 - index of the slot in inv2

//get the first inventory data
var _inv1 = argument[0];
var _slot1 = argument[1];
var _items1 = _inv1[? "items"];
var _key1 = _items1[# EX_COLS.key, _slot1];
var _tags1 = _items1[# EX_COLS.tags, _slot1];
var _amount1 = _items1[# EX_COLS.amount, _slot1];

if(_tags1 >= 0) { _tags1 = _ex_fn_ds_map_dup(_tags1); }

//get the second inventory data
var _inv2 = argument[2];
var _slot2 = argument[3];
var _items2 = _inv2[? "items"];
var _key2 = _items2[# EX_COLS.key, _slot2];
var _tags2 = _items2[# EX_COLS.tags, _slot2];
var _amount2 = _items2[# EX_COLS.amount, _slot2];

if(_tags2 >= 0) { _tags2 = _ex_fn_ds_map_dup(_tags2); }

//insert switched items
_ex_fn_item_set(_inv1, _key2, _amount2, _slot1, _tags2);
_ex_fn_item_set(_inv2, _key1, _amount1, _slot2, _tags1);

//cleanup
if(_tags1 >= 0) { ds_map_destroy(_tags1); }
if(_tags2 >= 0) { ds_map_destroy(_tags2); }

//notify changes
ex_ev_notify(_inv1, EX_EVENTS.inv_updated);
ex_ev_notify(_inv2, EX_EVENTS.inv_updated);