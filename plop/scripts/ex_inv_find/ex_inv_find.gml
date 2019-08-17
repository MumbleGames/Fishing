///func		ex_inv_find(inv, key, type)
///@desc	returns the slot index of the first item matching the specified key, or -1 if not found
///@arg		{number} inv - inventory
///@arg		{string} key - key of the item to search for
///@arg		{number} type - type of lookup to perform, from the EX_FIND enum: first, last, low (lowest amount in stack), high (highest amount in stack)
///@return	{number}

var _inventory = argument0;
var _items = _inventory[? "items"];
var _key = argument1;
var _type = argument2;

if(!ds_grid_value_exists(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key)) {
    return -1;
}

switch(_type) {
    case EX_FIND.first:
        return ds_grid_value_y(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key);
    
    case EX_FIND.last:
        ds_grid_sort(_items, EX_COLS.index, false);
        var _row = _items[# EX_COLS.index, ds_grid_value_y(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key)];
        ds_grid_sort(_items, EX_COLS.index, true);
        return _row;
    
    case EX_FIND.low:
        ds_grid_sort(_items, EX_COLS.amount, true);
        var _row = _items[# EX_COLS.index, ds_grid_value_y(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key)];
        ds_grid_sort(_items, EX_COLS.index, true);
        return _row;
        
    case EX_FIND.high:
        ds_grid_sort(_items, EX_COLS.amount, false);
        var _row = _items[# EX_COLS.index, ds_grid_value_y(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key)];
        ds_grid_sort(_items, EX_COLS.index, true);
        return _row;
}
