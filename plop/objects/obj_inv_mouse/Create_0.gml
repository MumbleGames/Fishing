//inherit the parent event
event_inherited();

//slot instance of the mouse
slot = -1;

//currently hovered slot, stored in an instance variable for performance
slot_current = noone;

//mouse position to gui
mouse_x_gui = device_mouse_x_to_gui(0);
mouse_y_gui = device_mouse_y_to_gui(0);