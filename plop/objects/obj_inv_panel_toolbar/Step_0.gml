//check if the user pressed a number on the keyboard
var _key = string_digits(keyboard_lastchar);

if(_key != "") {
	
	//get selected slot (offset by 1, since slot assigned to key 0 is the last)
	var _slot_index = (real(_key) + 9) mod 10;
	selected_slot = slots[_slot_index];
	
	//reset keyboard_lastchar
	keyboard_lastchar = "";
	
}