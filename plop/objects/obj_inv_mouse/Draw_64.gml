/// @desc draw slot and hover text

//inherit the parent event
event_inherited();

//do not draw item labels if not slot is hovered OR holding an item
if(slot_current == noone || slot.item >= 0) { exit; }

var _mouse_x = mouse_x_gui;
var _mouse_y = mouse_y_gui;

with(slot_current) {

	if(item >= 0) {
			
		draw_set_font(fnt_ex);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
			
		var _label_text = item[? "name"];
		var _label_w = (string_width(_label_text) + 8);
		var _label_h = (string_height(_label_text) + 4);

		draw_set_color(c_dkgray);
		draw_rectangle(_mouse_x, _mouse_y - _label_h, _mouse_x + _label_w, _mouse_y, false);
		draw_set_color(c_white); 
		draw_text(_mouse_x + _label_w div 2, _mouse_y - _label_h div 2, _label_text);
		
	}	
	
}
