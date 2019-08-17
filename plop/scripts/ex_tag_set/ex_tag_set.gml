///@func	ex_tag_set(inv, slot, name, value)
///@desc	sets the value of a tag for the item in the specified slot
///@arg		{number} inv - inventory
///@arg		{number} slot - index of the slot
///@arg		{string} name - tag name
///@arg		{*} value - tag value

var _inv = argument0;
var _slot = argument1;
var _name = argument2;
var _value = argument3;

var _items = _inv[? "items"];
var _item = _items[# EX_COLS.item, _slot];
var _tags = _items[# EX_COLS.tags, _slot];

//if slot is empty, exit
if(_item < 0) { exit; }

//if tags ds_map doesn't exist, create
if(_tags < 0) {
    _tags = ds_map_create();
    _items[# EX_COLS.tags, _slot] = _tags;
}

//set value
_tags[? _name] = _value;

//recompute stack id
_items[# EX_COLS.stack_id, _slot] = _ex_fn_generate_stack_id(_tags);

//mark updated slots
var _updated_slots = _inv[? "updated_slots"];
ds_list_add(_updated_slots, _slot);

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);