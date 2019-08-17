///@func	_ex_fn_item_set(inv, key, amount, slot, tags)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} inv
///@arg		{string} key
///@arg		{number} amount
///@arg		{number} slot
///@arg		{ds_map|number} tags
///@return	{number}

var _inv = argument0;
var _key = argument1;
var _amount = argument2;
var _slot = argument3;
var _tags = argument4;

//clear slot
_ex_fn_item_clear(_inv, _slot);

//add the item
return _ex_fn_item_add(_inv, _key, _amount, _slot, _tags, false);