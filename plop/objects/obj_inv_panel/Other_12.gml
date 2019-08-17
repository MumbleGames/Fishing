/// @desc on mb left

/*
	Called by obj_inv_mouse when a slot of the panel is left pressed
*/

var _pressed_slot = other;
var _mouse_slot = obj_inv_mouse.slot;

//if items in mouse and pressed slot are the same, try adding
if(ex_ui_slot_compare(_mouse_slot, _pressed_slot)) {
	ex_item_move(_mouse_slot.inv, _mouse_slot.index, inv, _mouse_slot.amount, _pressed_slot.index);
}

//otherwise if the items are different, simply switch
else {
	ex_item_switch(inv, _pressed_slot.index, _mouse_slot.inv, _mouse_slot.index);
}