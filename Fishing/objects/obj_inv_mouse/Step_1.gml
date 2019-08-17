//update mouse position to gui
mouse_x_gui = device_mouse_x_to_gui(0);
mouse_y_gui = device_mouse_y_to_gui(0);

//get currently hovered instance
instance_deactivate_object(slot); //deactivate mouse slot, we're not looking for that
slot_current = instance_position(mouse_x_gui, mouse_y_gui, obj_inv_slot);
instance_activate_object(slot);

//move mouse slot to mouse x and y
slot.x = mouse_x_gui;
slot.y = mouse_y_gui;
