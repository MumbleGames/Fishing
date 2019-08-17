///@func	ex_craft_add_recipe(result_key, result_amount, ...ingredients)
///@desc	Adds a crafting recipe to the crafting system
///@arg		{string} result_key - key of the resulting item
///@arg		{number} result_amount - amount of the resulting item
///@arg		{...string} ...ingredients - keys of the required ingredient(s)

//create the recipe and add the resulting item data
var _recipe = ds_map_create();
_recipe[? "result_key"] = argument[0];
_recipe[? "result_amount"] = argument[1];

//store ingredients in a ds_list in order to be sorted
var _ingredients = ds_list_create();

for(var _i = 2; _i < argument_count; _i++) {
    ds_list_add(_ingredients, argument[_i]);
}

//sort ingredients. If order is relevant, comment this out
ds_list_sort(_ingredients, true);

//generate recipe id
var _recipe_id = "";

for(var _i = 0; _i < ds_list_size(_ingredients); _i++) {
    _recipe_id += _ingredients[| _i];
}

_recipe_id = md5_string_utf8(_recipe_id);

//cleanup
ds_list_destroy(_ingredients);

//add to recipe to recipes map
ds_map_add_map(global._ex_craft_recipes, _recipe_id, _recipe);