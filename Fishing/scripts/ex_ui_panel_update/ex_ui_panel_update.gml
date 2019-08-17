///@func	ex_ui_panel_update(inv, event, updated_slots)
///@desc	called whenever an inventory assigned to a panel changes (see notification system in the docs)
///@arg		{number} inv - affected inventory
///@arg		{number} event - event that generated the call (as in EX_EVENTS enum)
///@arg		{ds_list} updated_slots - ds_list of affected slots if inv_updated event (-1 in the other events)

var _inv = argument0;
var _event = argument1;
var _updated_slots = argument2;

switch(_event) {

	case EX_EVENTS.inv_updated:
		for(var _i = 0; _i < ds_list_size(_updated_slots); _i++) {
			var slot_index = _updated_slots[| _i];
			var _slot = slots[slot_index];
		
			with(_slot) { event_user(INV_SLOT_EVENTS.refresh); };
		}
	
	break;
	
	case EX_EVENTS.inv_destroyed:
	
		ex_ui_panel_close(id);
	
	break;
	
	case EX_EVENTS.inv_resized:
	
		/* 
			Do nothing, let the user customize this event.
			If you want to add a generic action for all panels for this event,
			add it below.
		*/
	
	break;

}
