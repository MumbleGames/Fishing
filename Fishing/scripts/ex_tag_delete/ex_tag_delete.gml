///@func	ex_tag_delete(inv, slot, name)
///@desc	removes a tag from an item
///@arg		{number} inv - inventory id
///@arg		{number} slot - index of the slot
///@arg		{string} name - tag name

var _inv = argument0;
var _slot = argument1;
var _name = argument2;

var _items = _inv[? "items"];
var _tags = _items[# EX_COLS.tags, _slot];

//if slot is empty or tags are empty, exit
if(_tags < 0) { exit; }

//delete the tag
if(ds_map_exists(_tags, _name)) {
	ds_map_delete(_tags, _name);
}

//if tags are empty, delete the ds_map
if(ds_map_empty(_tags)) {
	ds_map_destroy(_tags);
	_items[# EX_COLS.tags, _slot] = -1;
	_items[# EX_COLS.stack_id, _slot] = "";
}
else {
	//recompute stack id
	_items[# EX_COLS.stack_id, _slot] = _ex_fn_generate_stack_id(_tags);
}

//mark updated slots
var _updated_slots = _inv[? "updated_slots"];
ds_list_add(_updated_slots, _slot);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);