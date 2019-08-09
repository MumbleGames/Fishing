/// @arg id
/// @arg variable_to_listen

ds_list_add(ds_map_find_value(argument0, "variable-listener"), [argument1, ATEX_variable_get(argument1)])