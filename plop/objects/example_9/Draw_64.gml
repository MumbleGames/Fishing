/// @description Insert description here
// You can write your code in this editor

ATEX_variable_set("time", string(current_hour)+":"+string(current_minute))
draw_set_colour(c_orange)
ATEX_fast_draw(description, 40, room_height*0.2)

ATEX_fast_draw(demo, 40, room_height*0.5)