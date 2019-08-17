///@func	_ex_fn_inv_init(size, [grid], [from], [to])
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} size
///@arg		{number} [grid]
///@arg		{number} [from]
///@arg		{number} [to]

var _size = argument[0];
var _items = argument_count > 1 ? argument[1] : ds_grid_create(EX_COLS.size, _size);
var _from = argument_count > 2 ? argument[2] : 0;
var _to = argument_count > 3 ? argument[3] : _size - 1;


//store the index of every row. This allows the inventory to be sorted
//for calculations and then reverted back to its original order
for(var _i = _from; _i <= _to; _i++) {
    _items[# EX_COLS.index, _i] = _i;
}

//set all keys to empty
ds_grid_set_region(_items, EX_COLS.key, _from, EX_COLS.key, _to, "");

//set all amounts to 0
ds_grid_set_region(_items, EX_COLS.amount, _from, EX_COLS.amount, _to, 0);

//set all stack ids to empty
ds_grid_set_region(_items, EX_COLS.stack_id, _from, EX_COLS.stack_id, _to, "");

//set all items to empty
ds_grid_set_region(_items, EX_COLS.item, _from, EX_COLS.item, _to, -1);

//set all tags to empty
ds_grid_set_region(_items, EX_COLS.tags, _from, EX_COLS.tags, _to, -1);

return _items;
