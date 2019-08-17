///@func	ex_tag_get(inv, slot, name)
///@desc	gets the value of a tag for the item in the specified inventory slot
///@arg		{number} inv - inventory id
///@arg		{number} slot - index of the slot
///@arg		{string} name - tag name
///@return	{*} the value of the tag having the specified tag name (or undefined if tag not found)

var _inv = argument0;
var _slot = argument1;
var _name = argument2;

var _items = _inv[? "items"];
var _tags = _items[# EX_COLS.tags,_slot];

//if slot is empty or tags not defined, return undefined
if(_tags < 0) {
	return undefined;
}
else {
	return _tags[? _name];
}