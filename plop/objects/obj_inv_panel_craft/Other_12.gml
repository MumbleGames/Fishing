/// @desc on mb left

var _slot = other;

//if the pressed slot is not the result slot, behave normally
if(_slot != slot_result) {
	event_inherited();
	exit;
}

//if the result slot has been pressed, try to take resulting item
if(!ex_ui_slot_empty(slot_result)) {
    
    //we can't allow to take only part of the resulting items, remove them only if all items can be taken.
    if(ex_item_test_ext(inv, slot_result.index, obj_inv_mouse.inv, slot_result.amount) == slot_result.amount) {
        
        //disable recipe checking until all items of the recipe have been removed, so we don't remove the result as well
		recipe_checking_enabled = false;
		
		//remove one unit of every ingredient
        for(var _i = 0; _i < array_length_1d(slots_ingredients); _i++) {
            ex_item_remove(inv, "", 1, slots_ingredients[_i].index);
        }
		
		//enable recipe checking again
        recipe_checking_enabled = true;
		
		//move the resulting item to the mouse inv
        ex_item_move(inv, slot_result.index, obj_inv_mouse.inv, slot_result.amount);
        
    }
}