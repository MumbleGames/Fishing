///@func	_ex_fn_ds_map_dup(ds_map)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{ds_map} ds_map
///@return	{ds_map}

var _copy = ds_map_create();
ds_map_copy(_copy, argument0);

return _copy;
