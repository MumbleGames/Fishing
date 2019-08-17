///@func	_ex_fn_item_remove(inv, key, amount, slot)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} inv
///@arg		{string} key
///@arg		{number} amount
///@arg		{number} slot
///@return	{number}

var _inv = argument0;
var _key = argument1;
var _amount = argument2;
var _slot_from = argument3 < 0 ? 0 : argument3;
var _slot_to = argument3 < 0 ? _inv[? "max_size"] - 1 : argument3;

var _inv_items = _inv[? "items"];
var _updated_slots = _inv[? "updated_slots"];

//if amount is zero or there's nothing to delete, exit
if(_amount == 0 || _key == "") { return 0; }

//cycle slots and remove
for(var _i = _slot_from; _i <= _slot_to; _i++) {
	
	if(_inv_items[# EX_COLS.key, _i] == _key) {
		var _q = min(_inv_items[# EX_COLS.amount, _i], _amount);
			
		_inv_items[# EX_COLS.amount, _i] -= _q;
			
		if(_inv_items[# EX_COLS.amount, _i] <= 0) {
			_ex_fn_item_clear(_inv, _i);
		}
		else {
			ds_list_add(_updated_slots, _i);
		}
    
		_amount -= _q;
		if(_amount < 1) { break; }

	}
}

//return amount removed
return argument2 - _amount;