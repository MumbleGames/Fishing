///@func	ex_ev_notify(inv, event)
///@desc	Fires an event notification to all subscribers (internal use only! Do not call manually)
///@arg		{number} inv - affected inventory
///@arg		{enum} event - event to fire

var _inv = argument0;
var _event = argument1;

//get observers as a copy (in case the original gets modified during the loop)
var _observers = ds_list_create(); ds_list_copy(_observers, _inv[? "observers"]);
var _observers_count = ds_list_size(_observers);

//initialize update slots variable
var _updated_slots = -1;

//if update event, prepare slots list
if(_event == EX_EVENTS.inv_updated) {

	//get updated slots
	_updated_slots = _inv[? "updated_slots"];
	var _updated_slots_count = ds_list_size(_updated_slots);
	
	//if no slots have been updated, exit, no need to fire the event
	if(_updated_slots_count == 0) { exit; }
	
	//remove duplicates
	for(var _i = _updated_slots_count - 1; _i > 0; _i--) {
		if(_updated_slots[| _i] == _updated_slots[| _i - 1]) { ds_list_delete(_updated_slots, _i); }
	}

	//replace updated slots with an empty list before notifying
	_inv[? "updated_slots"] = ds_list_create();

}

//cycle through observers and notify the event
for(var _o = 0; _o < _observers_count; _o++) {
	
	var _observer =	_observers[| _o];
	
	var _instance =	_observer[0];
	var _script = _observer[1];
	
	//skip if instance doesn't exist
	if(!instance_exists(_instance)) { continue; }
	
	with(_instance) {
		script_execute(_script, _inv, _event, _updated_slots);
	} 

}

//if update event, clear updated slots
if(_event == EX_EVENTS.inv_updated) {
	ds_list_destroy(_updated_slots);
}

//clear observers copy
ds_list_destroy(_observers);