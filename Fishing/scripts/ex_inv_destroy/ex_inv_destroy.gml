///@func	ex_inv_destroy(inv)
///@desc	destroys the inventory, freeing the memory
///@arg		{number} inv - inventory to destroy

var _inv = argument0;
var _items = _inv[? "items"];

//fire notification before destroying
ex_ev_notify(_inv, EX_EVENTS.inv_destroyed);

//destroy tags
for(var _i=0; _i<ds_grid_height(_items); _i++) {
    if(_items[# EX_COLS.tags, _i] >= 0) {
        ds_map_destroy(_items[# EX_COLS.tags, _i]);
    }
}

//destroy inventory
ds_grid_destroy(_items);
ds_list_destroy(_inv[? "observers"]);
ds_list_destroy(_inv[? "updated_slots"]);
ds_map_destroy(_inv);