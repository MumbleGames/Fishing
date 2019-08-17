/// @desc on mb right

/*
	Checks if the item can be added to the clicked slot. This is just a simple example
	on how to restrict slots based on the item attribute, adapt to your needs.
*/

//get slot and item
var _slot = other;
var _item = obj_inv_mouse.slot.item;

//set result variable
var _item_allowed = false;

//if mouse is empty, allow taking the item
if(_item < 0) {
	_item_allowed = true;
}

//else, check if the item is allowed in the slot. Left and right hand follow the same rules.
else {
	switch(_slot) {
	
		case slot_body:
			_item_allowed = _item[? "category"] == "cuirass";
		break;
	
		case slot_feet:
			_item_allowed = _item[? "category"] == "boots";
		break;
	
		case slot_head:
			_item_allowed = _item[? "category"] == "helmet";
		break;
	
		case slot_lhand:
		case slot_rhand:
			_item_allowed = _item[? "type"] == "weapon" || _item[? "category"] == "shield";
		break;
	}
}

//if the item is allowed, just perform the default event
if(_item_allowed) {
	event_inherited();
}
