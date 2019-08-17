/* 
	Define the custom events for panels (add any event you'd like to handle here).
	Every event is assigned to its corresponding user event.
*/

enum INV_PANEL_EVENTS {
	on_open = 0,		//called right after the panel is opened
	on_close = 1,		//called before closing the panel
	on_mb_left = 2,		//called by obj_inv_mouse when a slot on the panel is left pressed
	on_mb_right = 3		//called by obj_inv_mouse when a slot on the panel is right pressed
}


//required panel attributes

inv = -1; //stores the id of the linked inventory
slots = -1; //stores an array of slot instances