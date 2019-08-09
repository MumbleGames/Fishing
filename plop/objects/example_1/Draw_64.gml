/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_orange)
ATEX_fast_draw(description, 40, room_height*0.2)

ATEX_fast_draw(demo, 40, room_height*0.65)

draw_set_alpha(dalpha*2)
draw_text(10, room_height-30, dtext)
draw_set_alpha(1)
dalpha-=1/3/room_speed