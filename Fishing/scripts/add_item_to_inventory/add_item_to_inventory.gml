/// @function addItem
/// Add an item to a grid
/// @argument0 Grid_To_Add DSGrid
/// @argument1 Item_Name String
/// @argument2 Item_type String
/// @argument3 Item_Amount Int 
/// @argument4 Item_Description String 
/// @argument5 Item_Sprite Sprite 
/// @argument6 Item_Script Script 
#macro IName 0
#macro IType 1
#macro IAmount 2
#macro IDesc 3
#macro ISprite 4
#macro IScript 5

gridToAddTo = argument0;
newItemName = argument1;
newItemType = argument2
newItemAmount = argument3;
newItemDescription = argument4;
newItemSprite = argument5;
newItemScript = argument6;

// Case 1 : Item is already in the inventory
for(var i =0;i < ds_grid_height(gridToAddTo); i++)
{
	if(ds_grid_get(gridToAddTo,IName, i) == newItemName) 
	{ds_grid_set(gridToAddTo,IAmount,i, ds_grid_get(gridToAddTo,IAmount,i)+ newItemAmount);
	 return true;	
	}	
}
// Case 2 : Item isn't in the inventory
if (ds_grid_get(gridToAddTo,IName,0) !=0)
	ds_grid_resize(gridToAddTo,global.PlayerInventoryWidth,ds_grid_height(gridToAddTo)+1);

var NewItemSpot = ds_grid_height(gridToAddTo) - 1;
ds_grid_set(gridToAddTo,IName,NewItemSpot,newItemName);
ds_grid_set(gridToAddTo,IType,NewItemSpot,newItemType);
ds_grid_set(gridToAddTo,IAmount,NewItemSpot,newItemAmount);
ds_grid_set(gridToAddTo,IDesc,NewItemSpot,newItemDescription);
ds_grid_set(gridToAddTo,ISprite,NewItemSpot,newItemSprite);
ds_grid_set(gridToAddTo,IScript,NewItemSpot,newItemScript);

return false;

