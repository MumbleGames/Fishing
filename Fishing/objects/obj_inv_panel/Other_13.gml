/// @desc on mb right

/*
	Called by obj_inv_mouse when a slot of the panel is right pressed with the mouse
*/

//get the affected slot and mouse slot
var _pressed_slot = other;
var _mouse_slot = obj_inv_mouse.slot;

//if pressed slot is empty, or holding the same item as mouse, try adding one unit
if(ex_ui_slot_empty(_pressed_slot) || ex_ui_slot_compare(_pressed_slot, _mouse_slot)) {
	ex_item_move(_mouse_slot.inv, _mouse_slot.index, inv, 1, _pressed_slot.index);
}

//if the items are different and mouse is empty, take half stack
else if(ex_ui_slot_empty(_mouse_slot)) {
	var _amount = ceil(_pressed_slot.amount / 2);
	ex_item_move(inv, _pressed_slot.index, _mouse_slot.inv, _amount);
}