///@desc	create inventories

//get a list of all the keys in our inventory, used to generate random items
var _db_keys = ex_db_keys();
var _db_size = ds_list_size(_db_keys);

//create an inventory for the mouse.
global.inv_mouse = ex_inv_create(1);

//generate a player inventory, and insert some random items
global.inv_backpack = ex_inv_create(30);
for(var _i = 0; _i < 30; _i++) {
	if(choose(true, true, false)) { //try not to fill every slot
		var _item = _db_keys[| irandom(_db_size - 1)];
		ex_item_add(global.inv_backpack, _item, irandom(64), _i);
	}
}

//create a toolbar
global.inv_toolbar = ex_inv_create(10);

//create an equipment inventory 
global.inv_equipment = ex_inv_create(5);

//create a crafting inventory 
global.inv_craft = ex_inv_create(5);