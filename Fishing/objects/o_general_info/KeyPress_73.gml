/// @description pops up the inventory

if(!instance_exists(obj_inv_panel_backpack))
{
	x_pos = camera_get_view_width(0)  - sprite_get_width(spr_ex_panel_backpack);
	y_pos = camera_get_view_height(0) - sprite_get_height(spr_ex_panel_backpack);
	ex_ui_panel_open(global.inventory, obj_inv_panel_backpack, x_pos, y_pos, "UI");
	ex_ui_panel_open(global.inv_mouse, obj_inv_mouse, 0, 0, layer);
}
else 
{
ex_ui_panel_close(obj_inv_panel_backpack);
ex_ui_panel_close(obj_inv_mouse);
}
