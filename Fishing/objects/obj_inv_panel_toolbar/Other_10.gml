///@desc on open

//inherit the parent event
event_inherited();

//create slots
ex_ui_slot_create_grid(id, obj_inv_slot, 10, 48);

//set the first slot as selected
selected_slot = slots[0];