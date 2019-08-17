///@func	ex_inv_count(inv, key)
///@desc	returns the amount of items having the specified key in the inventory (considering stack amount as well)
///@arg		{number} inv - inventory
///@arg		{string} key - key of the item to count
///@return	{number}

var _inv = argument0;
var _items = _inv[? "items"];
var _key = argument1;

if(!ds_grid_value_exists(_items, EX_COLS.key, 0, EX_COLS.key, ds_grid_height(_items)-1, _key)) {
    return 0;
}

var _count = 0;
for(var _i=0;_i<ds_grid_height(_items);_i++) {
    if(_items[# EX_COLS.key, _i] == _key) {
        _count += _items[# EX_COLS.amount, _i];
    }
}

return _count;
