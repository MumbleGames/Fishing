///@func	ex_init()
///@desc	initializes the inventory system (to be called only once at game start)

//init db globals

global._ex_db = ds_map_create();
global._ex_db_keys = ds_list_create();
global._ex_db_groups = ds_map_create();

//event system

enum EX_EVENTS {
    inv_updated, 
    inv_destroyed, 
    inv_resized
}

//find function constants

enum EX_FIND {
    first, 
    last, 
    low, 
    high
}

//inventory grid colums

enum EX_COLS {
    index, 
    key, 
    amount, 
    stack_id, 
    item, 
    tags, 
	size
}