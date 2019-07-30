var fishing_location = instance_position(bait.x, bait.y, o_fishing_location);

var choice_tab = undefined;
var fish_number = ds_list_size(o_general_info.fish_spots_db[fishing_location.Water_type, fishing_location.Name]);
var fish = undefined;
for (var i=0; i< fish_number; i++)
choice_tab[i] =ds_list_find_value(o_general_info.fish_spots_db[fishing_location.Water_type,fishing_location.Name],i);

var tab_length = array_length_1d(choice_tab);
var fish = choice_tab[irandom(tab_length)-1];
show_debug_message(fish);


