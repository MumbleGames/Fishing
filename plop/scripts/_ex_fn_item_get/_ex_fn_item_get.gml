///@func	_ex_fn_item_get(inv, slot, attr)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} inv
///@arg		{number} slot
///@arg		{enum} attr - EX_COLS
///@return	{*}

var _inv = argument0;
var _slot = argument1;
var _attr = argument2;

var _items = _inv[? "items"];

return _items[# _attr, _slot];