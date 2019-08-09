/// @description Introdusing in tags

/// you can change text in included files

map=cont.texts[? "example_9"]
draw_set_colour(c_orange)
description=ATEX_fast_create(map[? "description"], room_width-80, fa_left)
demo=ATEX_fast_create(map[? "demo"], room_width-80, fa_left)

//	INITIALIZE VARIABLES
ATEX_variable_set("name", choose("Grzegocz", "Alex", "Kakex"))
ATEX_variable_set("time", string(current_hour)+":"+string(current_minute))

//  ADD LISTENER TO AUTO UPDATE TEXT WHEN VARIABLE WILL CHANGE
ATEX_fast_listener_variable_add(demo, "name")
ATEX_fast_listener_variable_add(demo, "time")