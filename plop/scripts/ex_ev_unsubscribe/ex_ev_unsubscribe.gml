///@func	ex_ev_unsubscribe(inv, instance)
///@desc	Unsubscribes the specified instance from the inventory events
///@arg		{number} inv - inventory
///@arg		{instance} instance - the instance to unsubscribe

var _inv = argument0;
var _instance = argument1;

//get list of subscribers for this event
var _observers = _inv[? "observers"];

//remove from the subscribers
var _observers_count = ds_list_size(_observers);
for(var _i = _observers_count - 1; _i >= 0; _i--) {
	
	var _observer = _observers[| _i];
	
	if(_observer[0] == _instance) {
		ds_list_delete(_observers, _i);
	}
	
}