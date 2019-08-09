/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_orange)
ATEX_fast_draw(description, 40, room_height*0.2)

txt="Source text: "+keyboard_string
if current_time mod 200 > 100 txt+="|"
draw_text_ext(60, room_height*0.55, txt, -1, room_width-120)

ATEX_draw(60, room_height*0.65, "Result: "+keyboard_string, room_width-120, fa_left)
