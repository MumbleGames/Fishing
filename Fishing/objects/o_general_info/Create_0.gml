///Initialize the game and inventory system

//randomize seed
randomize();

//init inventory system and load database
ex_init();
ex_db_load("ex/fish.csv");

//Inventory system

global.inventory = ex_inv_create(10);

// Fish DataBase per location
#macro Sea 0
#macro River 1
#macro Lake 2

#macro Grand_Blue 0
#macro Misaki 0

for(var i=0; i<1; i++)
{
	var location = ds_list_create();
	fish_spots_db[Sea,i] = location;
}
for(var i=0; i<1; i++)
{
	var location = ds_list_create();
	fish_spots_db[River,i] = location;
}

ds_list_add(fish_spots_db[Sea,Grand_Blue],"fish_moat_carp" , "fish_rainbow_trout" , "fish_sunfish");
ds_list_add(fish_spots_db[River,Misaki],"fish_eel" , "fish_bass" , "fish_red_fish");
//ds_list_add(fish_spots_db[Sea,2],"Bastore Sardine" , "Bibiki Urchin" , "Bluetail");

