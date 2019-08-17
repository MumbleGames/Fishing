///@func	ex_inv_sort(inv, sort_by, sort_order)
///@desc	sorts the inventory items
///@arg		{number} inv - inventory
///@arg		{integer|string} sort_by - either a string with the item property to sort by (like "name" or "key"), or a value from the EX_COLS enum (like EX_COLS.amount)
///@arg		{boolean} sort_order - if true, sorts in ascending order, descending otherwise

var _inv = argument0;
var _sort_by = argument1;
var _sort_order = argument2;
var _items = _inv[? "items"];
var _updated_slots = _inv[? "updated_slots"];

//return if inventory is empty
if(_inv[? "size"] == 0) { exit; }

//init data structures
var _temp_grid = ds_grid_create(2, _inv[? "size"]);

//fill the temp grid with the sort attributes, and sort
var _row = 0;

for(var _i = 0; _i < ds_grid_height(_items); _i++) {
	
	var _item = _items[# EX_COLS.item, _i];
	
	if(_item < 0) { continue; }
    
	_temp_grid[# 0, _row] = _i;
	_temp_grid[# 1, _row++] = is_real(_sort_by) ? _items[# _sort_by, _i] : _item[? _sort_by];

}

ds_grid_sort(_temp_grid, 1, _sort_order);

//clear current index
ds_grid_set_region(_items, EX_COLS.index, 0, EX_COLS.index, ds_grid_height(_items) - 1, ds_grid_height(_temp_grid));

//apply new order and sort
for(var _i = 0; _i < ds_grid_height(_temp_grid); _i++) {
	_items[# EX_COLS.index, _temp_grid[# 0, _i]] = _i;
}

ds_grid_sort(_items, EX_COLS.index, true);

//update position column and mark all slots to be updated
for(var _i = 0; _i < ds_grid_height(_items); _i++) {
    _items[# EX_COLS.index, _i] = _i;
    ds_list_add(_updated_slots, _i);
}

//cleanup
ds_grid_destroy(_temp_grid);

//notify update
ex_ev_notify(_inv, EX_EVENTS.inv_updated);
