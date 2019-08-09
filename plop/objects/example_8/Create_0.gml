/// @description Introdusing in tags

/// you can change text in included files

map=cont.texts[? "example_8"]
draw_set_colour(c_orange)
description=ATEX_fast_create(map[? "description"], room_width-80, fa_left)
writer=ATEX_fast_create(map[? "writer"], room_width-80, fa_left)

alarm[0]=10
sindex=0