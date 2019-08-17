///@func	_ex_fn_item_add(inv, key, amount, slot, tags, test)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{number} inv
///@arg		{string} key
///@arg		{number} amount
///@arg		{number} slot
///@arg		{ds_map|number} tags
///@arg		{boolean} test

var _inv = argument0;
var _key = argument1;
var _amount = argument2;
var _slot_from = argument3 < 0 ? 0 : argument3;
var _slot_to = argument3 < 0 ? _inv[? "max_size"] - 1 : argument3;
var _tags = argument4;
var _test = argument5;

//get item from database and generate stack id
var _item = ex_db_get(_key);
var _stack_id = _tags < 0 ? "" : _ex_fn_generate_stack_id(_tags);

//check if item is empty or amount 0, in which case, there's nothing to do
if(_amount < 1 || is_undefined(_item)) { return 0; }

//init variables
var _inv_items = _inv[? "items"];
var _updated_slots = _inv[? "updated_slots"];
var _stack_size = _item[? "stack_size"];

//if item is stackable, try adding the amount to the existing stacks
if(_stack_size > 1) {
    
	for(var _i = _slot_from; _i <= _slot_to; _i++) {
        
		//if key and stack_id match, and there's space in the stack, add
		if(	_inv_items[# EX_COLS.key,_i] == _key && _inv_items[# EX_COLS.stack_id,_i] == _stack_id && _stack_size > _inv_items[# EX_COLS.amount,_i]) {
            var _q = min(_stack_size - _inv_items[# EX_COLS.amount,_i], _amount);
			
			if(!_test) {
                ds_list_add(_updated_slots, _i);
                _inv_items[# EX_COLS.amount, _i] += _q;
            }
            
			_amount -= _q;
            if(_amount < 1) { break; }
        }
		
    }
	
}

//add the remaining items in the empty slots, in multiple stacks when needed
for(var _i = _slot_from; _i <= _slot_to; _i++) {
    
	if(_amount < 1 || _inv[? "size"] == _inv[? "max_size"]) { break; }
	
    if(_inv_items[# EX_COLS.item, _i] >= 0) { continue; }
    
	var _q = min(_stack_size,_amount);
	
    if(!_test) {
        ds_list_add(_updated_slots, _i);
		
		_inv_items[# EX_COLS.key, _i] = _key;
        _inv_items[# EX_COLS.amount, _i] = _q;
        _inv_items[# EX_COLS.item, _i] = _item;
		_inv_items[# EX_COLS.tags, _i] = _tags >= 0 ? _ex_fn_ds_map_dup(_tags) : -1;
		_inv_items[# EX_COLS.stack_id, _i] = _stack_id;
        
		_inv[? "size"] += 1;
    }
	
    _amount -= _q;
	
}

return argument2 - _amount;