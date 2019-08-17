if (state != player.waiting) return 0;

var fishing_location = instance_position(bait.x, bait.y, o_fishing_location);

// get the list of fish in that body of water from the database
var choice_tab = undefined;
var fish_number = ds_list_size(o_general_info.fish_spots_db[fishing_location.Water_type, fishing_location.Name]);
for (var i=0; i< fish_number; i++)
choice_tab[i] =ds_list_find_value(o_general_info.fish_spots_db[fishing_location.Water_type,fishing_location.Name],i);


//choose randomly from the fish list
var tab_length = array_length_1d(choice_tab);
var fish_key = choice_tab[irandom(tab_length-1)];

//Write the fish caught in the Dialog Box
var box = instance_find(o_dialog_box,0);
box.count = 0;
fish_map = ex_db_get(fish_key);
box.text = "You've caught a " + ts_colour(make_color_rgb(0,255,0)) + fish_map[? "name"] + ts_colour(c_white)+ " !";

// Add The fish caught to the inventory
ex_item_add(global.inventory, fish_key, 1);

