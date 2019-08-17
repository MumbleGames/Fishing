//inherit the parent event
event_inherited();

//create an array for storing ingredient slots (we have 4 in total)
slots_ingredients = array_create(4, noone);

//holds the slot instance where the resulting items are held
slot_result = noone;

//determines if the recipe checking on inventory update is enabled (avoids a possible deadlock)
recipe_checking_enabled = true;