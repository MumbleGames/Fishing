//@ description throws the bait
///@arg throwing_time
///@arg throwing_speed

var throwing_time = argument0;
var throwing_speed = argument1;
var bait = instance_create_layer(x,y,"Instances", o_bait);
bait.fisher_x = x;
bait.fisher_y = y;

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
bait.speed = throwing_speed;
alarm[0] = throwing_time;
return bait;