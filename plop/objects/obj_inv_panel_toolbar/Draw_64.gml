//inherit the parent event
event_inherited();

//draw the selected slot outline
if(selected_slot != noone) {
	with(selected_slot) {
		draw_sprite(spr_ex_slot_selected, 0, x, y);
	}
}