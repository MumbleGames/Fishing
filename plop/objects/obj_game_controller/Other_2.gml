///@desc	init game and inv system

//randomize seed
randomize();

//init inventory system and load database
ex_init();
ex_db_load("ex/armors.csv", "ex/foods.csv", "ex/potions.csv", "ex/weapons.csv");

//initialize the crafting system
ex_craft_init();