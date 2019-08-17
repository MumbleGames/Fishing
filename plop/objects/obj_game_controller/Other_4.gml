///@desc create the inventories

if(room == rm_ex_inv) {

	with(obj_inv_controller) {
		event_user(INV_CONTROLLER_EVENTS.create_inventories);
	}

}