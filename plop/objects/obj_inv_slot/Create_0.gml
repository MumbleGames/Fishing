///@desc	init

//user events
enum INV_SLOT_EVENTS {
    refresh = 0
}

//item attributes
item = -1; //item associated to this slot
tags = -1; //tags ds_map (if present)
key = ""; //key of the current item
stack_id = ""; //stack_id of the slot item
amount = 0; //current amount of items in the slot
index = -1; //slot index in the inventory

//object attributes
panel = -1; //panel instance
inv = -1; //related inventory
rel_x = 0; //x position relative to panel
rel_y = 0; //y position relative to panel

//image attributes (adjust as needed)
default_sprite = sprite_index;
image_speed = 0;