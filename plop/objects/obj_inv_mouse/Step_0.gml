///@desc handle mouse events

if(slot_current == noone) { exit; }

//if currently hovering a slot, check for mouse events
with(slot_current) {

	if(mouse_check_button_pressed(mb_left)) {
		with(panel) { event_user(INV_PANEL_EVENTS.on_mb_left); }
	}
	else if(mouse_check_button_pressed(mb_right)) {
		with(panel) { event_user(INV_PANEL_EVENTS.on_mb_right); }
	}
	
}