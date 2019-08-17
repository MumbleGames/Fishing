///@func	ex_ui_slot_create_grid(panel, obj, slots_per_row, distance, [x_offset], [y_offset])
///@desc	Generates a grid of slot instances for the specified panel based on the inventory size
///@arg		{instance} panel - panel instance to generate the slots for
///@arg		{object} obj - slot object to instantiate
///@arg		{number} slots_per_row - number of slots per row
///@arg		{number} distance - distance between slots in pixels (from origin to origin)
///@arg		{number} [x_offset] x - (optional) x position of the first slot relative to panel origin. Default: 0
///@arg		{number} [y_offset] y - (optional) y position of the first slot relative to panel origin. Default: 0

var _panel = argument[0];
var _obj = argument[1];
var _columns = argument[2];
var _distance = argument[3];
var _x_offset = argument_count > 4 ? argument[4] : 0;
var _y_offset = argument_count > 5 ? argument[5] : 0;

//get the inventory size
var _inv_size = ex_inv_max_size(_panel.inv);

//create slots
var _x, _y;
for(var _i = 0; _i < _inv_size; _i++) {
	
	_x = _distance * (_i mod _columns) + _x_offset;
	_y = _distance * (_i div _columns) + _y_offset;
	
	ex_ui_slot_create(_panel, _i, _x, _y, _obj); 
}