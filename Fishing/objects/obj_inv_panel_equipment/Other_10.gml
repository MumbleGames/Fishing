///@desc on open

//inherit the parent event
event_inherited();

//create slots
slot_head =		ex_ui_slot_create(id,0,72,24,obj_inv_slot);
slot_body =		ex_ui_slot_create(id,1,72,96,obj_inv_slot);
slot_lhand =	ex_ui_slot_create(id,2,24,120,obj_inv_slot);
slot_rhand =	ex_ui_slot_create(id,3,120,120,obj_inv_slot);
slot_feet =		ex_ui_slot_create(id,4,72,192,obj_inv_slot);