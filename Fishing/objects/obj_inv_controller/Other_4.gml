/*
	At room start we open the static inventories that should always be displayed (like toolbar or mouse).
	In order to ensure that they exist when this event is called, an alarm is set to 1 step and only
	when the alarm fires the inventories are actually opened.
*/

alarm[0] = 1;