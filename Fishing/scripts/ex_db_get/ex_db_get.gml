///@func	ex_db_get(key)
///@desc	gets an item and its attributes from the database as a ds_map
///@arg		{string} key - key of the item to return
///@return	{ds_map} the ds_map containing the item data. This ds_map should NOT be deleted nor modified

return global._ex_db[? argument0];
