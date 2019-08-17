// stopping the bait

var bait = instance_find(o_bait,0);
bait.speed = 0;

var box = instance_create_layer(x,y,"Text",o_dialog_box);

if(position_meeting(bait.x,bait.y, o_fishing_location))
box.text = "You're waiting for a fish to bite...";	
else box.text = "You need to throw the bait in the water";	