/// @description Insert description here
// You can write your code in this editor

draw_set_font(f_default);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

#region button next
draw_set_colour(c_orange);

draw_set_alpha(button_a);
draw_rectangle(room_width-100, room_height-40, room_width, room_height, 0);

draw_set_colour(c_black);


draw_text(room_width-50, room_height-20, "NEXT");

var mouse_inrectangle=point_in_rectangle(mouse_x, mouse_y, room_width-100, room_height-40, room_width, room_height);
button_a=clamp(button_a+(mouse_inrectangle-0.5)*delta_time*0.000006, 0.4, 1);
if mouse_inrectangle and mouse_check_button_pressed(mb_left)
{
	button_a=0.3;
	if room!=room_last {
		room_goto_next()
	}
	else {
		room_goto(room_first)
	}
}
#endregion

#region button menu
draw_set_colour(c_orange);

draw_set_alpha(back_a);
draw_rectangle(0, room_height-40, 100, room_height, 0);

draw_set_colour(c_black);


draw_text(50, room_height-20, "MENU");

var mouse_inrectangle=point_in_rectangle(mouse_x, mouse_y, 0, room_height-40, 100, room_height);
back_a=clamp(back_a+(mouse_inrectangle*(room!=room_startpage)-0.5)*delta_time*0.000006, 0.4, 1);
if (mouse_inrectangle and mouse_check_button_pressed(mb_left) and room!=room_startpage)
{
	back_a=0.3;
	room_goto(room_startpage);
}
#endregion

draw_set_alpha(1);
draw_set_colour(merge_color(c_orange, c_black, 0.4));
draw_rectangle(0, 0, room_width, 30, 0);

draw_set_colour(c_black);
draw_text(room_width/2,  15, "ATEX tutorial, page "+string(room+1)+"/"+string(room_last+1));

draw_set_halign(fa_left);
draw_text(10, 15, "FPS: "+string(fps)+"/"+string(room_speed));

draw_set_valign(fa_top);
draw_set_colour(c_orange);

