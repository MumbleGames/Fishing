///@desc on close

/*
	This event is called right before the panel is closed.
*/

//destroy all slot instances linked to this panel
if(is_array(slots)) {
 
	for(var _i = 0; _i < array_length_1d(slots); _i++) {
        with(slots[_i]) { instance_destroy(); }
    }
	
}

//unsubscribe instance from all inventory events
ex_ev_unsubscribe(inv, id);