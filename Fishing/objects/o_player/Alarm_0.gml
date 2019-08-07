// stopping the bait

var bait = instance_find(o_bait,0);
bait.speed = 0;
instance_create_layer(x,y,"UI",o_dialog_box);
			