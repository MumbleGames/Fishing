///@func	ex_item_set_tags(inv, slot, tags)
///@desc	replaces the tags of an items with a new set of tags
///@arg		{number} inv - inventory
///@arg		{number} index - slot index
///@arg		{ds_map|integer} tags - the new tags as a ds_map, or -1 to remove all tags

var _inv = argument0;
var _slot = argument1;
var _tags = argument2;

//get slot information
var _inv_items = _inv[? "items"];
var _inv_item = _inv_items[# EX_COLS.item, _slot];
var _inv_tags = _inv_items[# EX_COLS.tags, _slot];

//if slot is empty, exit
if(_inv_item < 0) { exit; }

//check if the provided ds_map is empty, in this case treat as though -1 has been passed instead
if(_tags >= 0 && ds_map_empty(_tags)) {
	_tags = -1;
}

//destroy old tags (if any)
if(_inv_tags >= 0) { ds_map_destroy(_inv_tags); }

//set the new tags
if(_tags < 0) {
	_inv_items[# EX_COLS.tags, _slot] = -1;
	_inv_items[# EX_COLS.stack_id, _slot] =  "";	
}
else {
	_inv_items[# EX_COLS.tags, _slot] = _ex_fn_ds_map_dup(_tags);
	_inv_items[# EX_COLS.stack_id, _slot] =  _ex_fn_generate_stack_id(_tags);	
}

//mark updated slots
var _updated_slots = _inv[? "updated_slots"];
ds_list_add(_updated_slots, _slot);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);
