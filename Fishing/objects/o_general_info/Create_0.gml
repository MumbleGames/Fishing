//Inventory system

global.PlayerInventoryWidth = 6;
global.PlayerInventory = ds_grid_create(global.PlayerInventoryWidth, 1);

fish_category_number = 3;
global.fish_number = 3;
global.Fish_DB = ds_grid_create(fish_category_number, global.fish_number);
Fill_Fish_DB();

// Fish DataBase
#macro Sea 0
#macro River 1
#macro Lake 2

#macro Grand_Blue 0

randomize();
for(var i=0; i<5; i++)
{
	var location = ds_list_create();
	fish_spots_db[Sea,i] = location;
}

ds_list_add(fish_spots_db[Sea,0],"Moat Carp" , "Rainbow Trout" , "Sun Fish");
ds_list_add(fish_spots_db[Sea,1],"Eel" , "Bass" , "Red Fish");
ds_list_add(fish_spots_db[Sea,2],"Bastore Sardine" , "Bibiki Urchin" , "Bluetail");

