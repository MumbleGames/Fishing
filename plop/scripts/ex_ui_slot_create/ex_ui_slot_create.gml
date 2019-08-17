///@func	ex_ui_slot_create(panel, index, x, y, obj)
///@desc	Creates and returns a slot instance attached to a panel
///@arg		{instance} panel - panel instance the slot is attached to
///@arg		{number} index - index of the slot in the inventory
///@arg		{number} x - x position relative to panel origin
///@arg		{number} y - y position relative to panel origin
///@arg		{object} obj - object to instantiante (usually obj_inv_slot, but you can specify your own)
///@return	{number} the slot instance

var _panel = argument0;
var _index = argument1;
var _x = argument2;
var _y = argument3;
var _obj = argument4;

//create slot instance on the panel layer
var _slot = instance_create_layer(_x + _panel.x, _y + _panel.y, _panel.layer, _obj);

//add slot to panel
_panel.slots[_index] = _slot;

//set slot variables
with(_slot) { 
	inv = _panel.inv;
	panel = _panel;
	index = _index;
	rel_x = _x;
	rel_y = _y;
	
	//call slot refresh event (fetch the inventory data)
	event_user(INV_SLOT_EVENTS.refresh); 
}

//return the slot instance
return _slot;
