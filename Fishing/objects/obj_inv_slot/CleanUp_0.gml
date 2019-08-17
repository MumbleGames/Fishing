///@desc destroy tags ds_map

//if the instance has a tags ds_map, destroy to free memory
if(tags >= 0) {
	ds_map_destroy(tags);
	tags = -1;
}
