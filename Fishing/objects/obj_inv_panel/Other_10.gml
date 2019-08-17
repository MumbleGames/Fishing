///@desc on open

/*
	This event is called right after the panel is opened.
	You should override this in your panels in order to create your slot instances.
*/

/* 
	Subscribe to inventory notifications and assign the general update script.
*/

ex_ev_subscribe(inv, id, ex_ui_panel_update);