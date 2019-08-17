///@func	ex_ui_slot_compare(slot1, slot2)
///@desc	Returns true if the item in both slot instances is the same (including tags)
///@arg		{instance} slot1 - 
///@arg		{instance} slot2 - 
///@return	{boolean}

var _slot1 = argument0;
var _slot2 = argument1;

return _slot1.key == _slot2.key && _slot1.stack_id == _slot2.stack_id;