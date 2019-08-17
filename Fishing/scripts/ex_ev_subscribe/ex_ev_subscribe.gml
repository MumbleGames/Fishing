///@func	ex_ev_subscribe(inventory, instance, script)
///@desc	Subscribe the specified instance to the inventory events. Whenever an event for the inventory is fired, the specified script is run.
///@arg		{number} inventory - the inventory to subscribe to
///@arg		{instance} instance - id of the instance that is subscribing
///@arg		{script} script - the script to run when an event gets fired

var _inv = argument0;
var _instance = argument1;
var _script = argument2;

//get list of subscribers for this event
var _observers = _inv[? "observers"];

//create observer array
var _observer = array_create(2);

//add instance
_observer[0] = _instance;

//add script
_observer[1] = _script;

//register
ds_list_add(_observers, _observer);