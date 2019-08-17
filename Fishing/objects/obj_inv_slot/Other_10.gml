///@desc	refresh event

/*
    This event refreshes the slot, and has is called when the slot item in the inventory gets an update.
*/

//refresh slot properties
item =  ex_item_get_item(inv, index);
key = ex_item_get_key(inv, index);
stack_id = ex_item_get_stack_id(inv, index);
amount = ex_item_get_amount(inv, index);

//if the item had tags before the update, destroy the ds_map and get the new one
if(tags >= 0) { ds_map_destroy(tags); }
tags = ex_item_get_tags(inv, index);

//update sprite
if(item < 0) {
	sprite_index = default_sprite;
}
else {
	sprite_index = item[? "sprite_index"];
	image_index = item[? "image_index"];
}