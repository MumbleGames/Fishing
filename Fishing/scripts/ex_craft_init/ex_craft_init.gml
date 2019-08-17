///@func	ex_craft_init()
///@desc	initializes the crafting system, and generates all the available recipes

global._ex_craft_recipes = ds_map_create();

ex_craft_add_recipe("potion_health", 2, "food_cheese", "food_bread");
ex_craft_add_recipe("potion_mana", 2, "food_fish", "food_bread");
ex_craft_add_recipe("potion_stamina", 2, "food_carrot", "food_bread");
