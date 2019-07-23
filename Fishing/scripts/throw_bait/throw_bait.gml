//@ description throws the bait

var bait = instance_create_layer(x,y,"Instances", o_bait);

switch(sprite)
	{
		
	case s_player_down : bait.direction = 270;
	break;
	case s_player_up : bait.direction = 90;
	break;
	case s_player_right : 
	if (image_xscale == -1) bait.direction = 180;
	else bait.direction = 0;
	break; 
	}
bait.speed = 6;