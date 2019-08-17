///@func	ex_craft_find_recipe(ingredients)
///@desc	Given a ds_list of ingredient keys, looks for a recipe and returns it as a ds_map (or -1 if not found)
///@arg		{ds_list} ingredients - ds_list of ingredient keys
///@return	{ds_map|integer} a recipe ds_map or -1 if nothing is found

var _ingredients = argument0;

//sort ingredients. If order is relevant, comment this out
ds_list_sort(_ingredients, true);

//generate recipe id
var _recipe_id = "";

for(var _i = 0; _i < ds_list_size(_ingredients); _i++) {
    _recipe_id += _ingredients[| _i];
}

_recipe_id = md5_string_utf8(_recipe_id);

//look for the recipe and return
if(ds_map_exists(global._ex_craft_recipes, _recipe_id)) {
	return global._ex_craft_recipes[? _recipe_id];
}
else {
	return -1;
}