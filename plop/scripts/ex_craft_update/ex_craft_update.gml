///@func	ex_craft_update(inv, event, updated_slots)
///@desc	callback script on the crafting panel when the crafting inventory changes (called automatically)
///@arg		{number} inv - inventory id
///@arg		{number} event - event
///@arg		{ds_list} updated_slots - ds_list of updated slot indexes

//get the required arguments
var _inv = argument0;
var _event = argument1;
var _updated_slots = argument2;

//if the current event is not an inventory updated event, or recipe checking is disabled, ignore and exit
if(_event != EX_EVENTS.inv_updated || !recipe_checking_enabled) { exit; }

//generate a ds_list of item keys from the crafting slots
var _items = ds_list_create();

for(var _i = 0; _i < array_length_1d(slots_ingredients); _i++) {
    var _slot = slots_ingredients[_i];
    
	if(!ex_ui_slot_empty(_slot)) { 
		ds_list_add(_items, _slot.key);
	}
}

//check if there's a valid recipe for the items currently in the slots
var _recipe = ex_craft_find_recipe(_items);

//disable recipe checking when updating the result slot
recipe_checking_enabled = false;

//if a recipe is found, generate a resulting item, otherwise clear the result slot
if(_recipe != -1) {
    ex_item_set(inv, _recipe[? "result_key"], _recipe[? "result_amount"], slot_result.index);
}
else { 
    ex_item_clear(inv, slot_result.index);
}

//enable recipe checking again
recipe_checking_enabled = true;

//destroy the list of items used for recipe checking
ds_list_destroy(_items);