/// @desc on mb right

var _slot = other;

//if the pressed slot is not the result slot, behave normally
if(_slot != slot_result) {
	event_inherited();
	exit;
}