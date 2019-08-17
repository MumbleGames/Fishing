///@desc on open

//inherit the parent event
event_inherited();

//get the number of ingredient slots
var _ingredients_size = array_length_1d(slots_ingredients);

//create ingredient slots
for(var _i = 0; _i < _ingredients_size; _i++) {
    slots_ingredients[_i] = ex_ui_slot_create(id, _i, 48 * _i, 0, obj_inv_slot);
}

//create the result slot
slot_result = ex_ui_slot_create(id, _ingredients_size, 240, 0, obj_inv_slot);

//add a custom callback script for the inventory, where we check for recipes
ex_ev_subscribe(inv, id, ex_craft_update);