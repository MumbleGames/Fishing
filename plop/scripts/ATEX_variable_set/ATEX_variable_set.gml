/// @arg variable
/// @arg value

ds_map_set(global.ATEX_variables, argument0, argument1)
if ds_list_find_index(global.ATEX_variables_list, argument0)==-1
	ds_list_add(global.ATEX_variables_list, argument0)