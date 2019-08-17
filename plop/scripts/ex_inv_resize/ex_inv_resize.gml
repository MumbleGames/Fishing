///@func	ex_inv_resize(inv, new_size)
///@desc	resizes an inventory by adding or removing slots according to the new size. Items in extra slots are removed
///@arg		{number} inv - inventory
///@arg		{number} new_size - the new size of the inventory

var _inv = argument0;
var _new_size = argument1;
var _cur_size = _inv[? "max_size"];
var _items = _inv[? "items"];

//if same size or invalid size, do nothing
if(_new_size == _cur_size || _new_size < 1) { exit; }

//if new size is smaller than current size
if(_new_size < _cur_size) {

    for(var _i = _new_size; _i < ds_grid_height(_items); _i++) {
        if(_items[# EX_COLS.item, _i] >= 0) {
            _inv[? "size"] -= 1; 
			
			//remove tags if present
			if(_items[# EX_COLS.tags, _i] >= 0) {
				ds_map_destroy(_items[# EX_COLS.tags, _i]);
			}
        }   
    }
	
    //resize grid
    ds_grid_resize(_items, ds_grid_width(_items), _new_size);
	
}

//if new size is larger than current size
else {
    ds_grid_resize(_items, ds_grid_width(_items), _new_size);
    _ex_fn_inv_init(_new_size, _items, _cur_size);
}

//update max size and notify
_inv[? "max_size"] = _new_size;
ex_ev_notify(_inv, EX_EVENTS.inv_resized);