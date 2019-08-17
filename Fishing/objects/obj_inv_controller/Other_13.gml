///@desc	close toggable inventories

/*
	Closes all (toggable) panels, like the backpack or equipment
*/

if(!inventory_is_open) { exit; }

ex_ui_panel_close(obj_inv_panel_backpack);
ex_ui_panel_close(obj_inv_panel_equipment);
ex_ui_panel_close(obj_inv_panel_craft);


inventory_is_open = false;
