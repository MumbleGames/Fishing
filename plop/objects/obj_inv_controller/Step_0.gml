///@desc	handle user input


/*
	TOGGLE INVENTORIES
*/

if(keyboard_check_pressed(ord("I"))) {	
	if(inventory_is_open) { 
		event_user(INV_CONTROLLER_EVENTS.close_toggable_inventories);
	}
	else {
		event_user(INV_CONTROLLER_EVENTS.open_toggable_inventories);
	}
}

/*
	SAVE INVENTORIES
	
	Save all the player inventories to a single file in the sandbox.
*/

if(keyboard_check_pressed(ord("S"))) {
	var _file = file_text_open_write("ex/player_inventory.json");
	file_text_write_string(_file, ex_inv_write(global.inv_mouse)); //inv_mouse
	file_text_writeln(_file);
	file_text_write_string(_file, ex_inv_write(global.inv_backpack)); //inv_player
	file_text_writeln(_file);
	file_text_write_string(_file, ex_inv_write(global.inv_toolbar)); //inv_toolbar
	file_text_writeln(_file);
	file_text_write_string(_file, ex_inv_write(global.inv_equipment)); //inv_equipment
	file_text_writeln(_file);
	file_text_write_string(_file, ex_inv_write(global.inv_craft)); //inv_craft
	file_text_close(_file);
	show_message_async("Inventories saved");
}

/*
	LOAD INVENTORIES
	
	Load the player inventories from file
*/

if(keyboard_check_pressed(ord("L"))) {
	if(file_exists("ex/player_inventory.json")) {
		
		//destroy all current inventories, we are replacing them with the saved data
		event_user(INV_CONTROLLER_EVENTS.destroy_inventories);
		
		//read the file
		var _file = file_text_open_read("ex/player_inventory.json");
		global.inv_mouse = ex_inv_read(file_text_read_string(_file));
		file_text_readln(_file);
		global.inv_backpack = ex_inv_read(file_text_read_string(_file));
		file_text_readln(_file);
		global.inv_toolbar = ex_inv_read(file_text_read_string(_file));
		file_text_readln(_file);
		global.inv_equipment = ex_inv_read(file_text_read_string(_file));
		file_text_readln(_file);
		global.inv_craft = ex_inv_read(file_text_read_string(_file));
		
		//open the inventory panels again
		event_user(INV_CONTROLLER_EVENTS.open_static_inventories);
		if(inventory_is_open) {
			inventory_is_open = false;
			//event_user(INV_CONTROLLER_EVENTS.open_toggable_inventories);
		}
		
		show_message_async("Inventories loaded");
		
	}
}

