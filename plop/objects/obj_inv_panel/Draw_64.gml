/// @desc draw panel and slots

//draw self if there's a sprite
if(sprite_index >= 0) {
	draw_self();
}

//draw the slots
draw_set_font(fnt_ex);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

for(var _i = 0; _i < array_length_1d(slots); _i++) {

	var _slot = slots[_i];
	
	with(_slot) {
		
		//draw item
		draw_self();
		
		//draw the stack amount if greater than 1
		if(item >= 0 && amount > 1) {
			draw_set_color(c_black);
			draw_text(bbox_right - 7, bbox_bottom - 7, string(amount));
			draw_set_color(c_white);
			draw_text(bbox_right - 8, bbox_bottom - 8, string(amount));
		}
	
	}

}