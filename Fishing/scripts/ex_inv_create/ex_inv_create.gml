///@func	ex_inv_create(max_size)
///@desc	creates a new inventory, returning the inventory id to be used in subsequent calls
///@arg		{number} max_size - total number of slots of the inventory
///@return	{number}


var _max_size = argument0;

//check size > 0
if(_max_size <= 0) { return -1; }

//create inventory map
var _inv = ds_map_create();
_inv[? "max_size"] = _max_size;
_inv[? "size"] = 0;

//create inventory grid
_inv[? "items"] = _ex_fn_inv_init(_max_size);

//add observers list
_inv[? "observers"] = ds_list_create();

//add updated slots list
_inv[? "updated_slots"] = ds_list_create();

return _inv;
