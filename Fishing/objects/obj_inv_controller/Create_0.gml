///@desc	initialize

//ensure there's only one inventory controller at any time
if(instance_number(object_index) > 1) {
	instance_destroy();
}

//identifies if the toggable player inventory panels are open or closed
inventory_is_open = false;

//define the inventory controller events
enum INV_CONTROLLER_EVENTS {
    create_inventories = 0, 
	destroy_inventories = 1, 
	open_toggable_inventories = 2, 
	close_toggable_inventories = 3, 
	open_static_inventories = 4, 
	close_static_inventories = 5
}