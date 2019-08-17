/// @desc on open

//inherit the parent event
event_inherited();

//create the only slot and assign it to an instance variable
slot = ex_ui_slot_create(id, 0, mouse_x_gui, mouse_y_gui, obj_inv_slot);