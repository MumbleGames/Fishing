///@func	ex_inv_write(inv)
///@desc	returns a JSON encoded string of the specified inventory. Can be reverted to an actualy inventory using ex_inv_read
///@arg		{number} inv - inventory
///@return	{string}


var _inv = argument0;
var _inv_items = _inv[? "items"];

//create output ds_map
var _output = ds_map_create();

_output[? "max_size"] = _inv[? "max_size"];
_output[? "size"] = _inv[? "size"];

//create items entries list
var _entries = ds_list_create();
ds_map_add_list(_output, "items", _entries);

//add entries
for(var _i = 0; _i < ds_grid_height(_inv_items); _i++) {
    
	var _item = _inv_items[# EX_COLS.item, _i];
    
	if(_item >= 0) {
        
		var _entry = ds_map_create();
        
		_entry[? "index"] = _inv_items[# EX_COLS.index, _i];
        _entry[? "key"] = _inv_items[# EX_COLS.key, _i];
        _entry[? "amount"] = _inv_items[# EX_COLS.amount, _i];
        _entry[? "stack_id"] = _inv_items[# EX_COLS.stack_id, _i];
        
		//if item has tags
		if(_inv_items[# EX_COLS.tags, _i] >= 0) {
            ds_map_add_map(_entry, "tags", _ex_fn_ds_map_dup(_inv_items[# EX_COLS.tags, _i]));
        }
		
        ds_list_add(_entries, _entry);
        ds_list_mark_as_map(_entries, ds_list_size(_entries) - 1);
    }
	
}

//encode the data
var _json = json_encode(_output);

//cleanup
ds_map_destroy(_output);

//return encoded data
return _json;