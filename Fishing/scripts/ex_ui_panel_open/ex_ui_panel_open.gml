///@func	ex_ui_panel_open(inv, obj, x, y, layer)
///@desc	opens and displays a panel for the specified inventory, returning the newly created panel instance
///@arg		{number} inv - inventory
///@arg		{object} obj - panel object to open
///@arg		{number} x - x position relative to GUI
///@arg		{number} y - y position relative to GUI
///@arg		{layer} layer - layer where the panel instance is created
///@return	{instance} the panel instance

var _panel = instance_create_layer(argument2, argument3, argument4, argument1);

with(_panel) {
    inv = argument0; //assign the inventory to the panel
	slots = array_create(ex_inv_max_size(inv), noone); //initialize slots array
    event_user(INV_PANEL_EVENTS.on_open); //call panel specific create event
}

return _panel;
