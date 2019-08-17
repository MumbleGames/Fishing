///@func	ex_inv_clear(inv)
///@desc	clears all slots in an inventory
///@arg		{number} inv - inventory

var _inv = argument0;
var _inv_size = _inv[? "max_size"];

//clear all slots
for(var _i = 0; _i < _inv_size; _i++) {
	_ex_fn_item_clear(_inv, _i);
}

//fire notification
ex_ev_notify(_inv, EX_EVENTS.inv_updated);