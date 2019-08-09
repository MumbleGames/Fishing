/// @func ATEX_fast_create(text, w, halign)
/// @arg text
/// @arg w
/// @arg halign


var text=argument0, w=argument1, halign=argument2, container=ds_map_create();

container[? "text"]=argument0
container[? "w"]=argument1
container[? "halign"]=argument2
container[? "body"]=-1
container[? "surf"]=-1
container[? "symbs"]=0
container[? "draw-symbs"]=-1
ds_map_add_list(container, "variable-listener", ds_list_create())
ds_map_add_map(container, "props", ds_map_create())
ds_map_copy(container[? "props"], global.ATEX_settings_default)

return container