/// @description On verra

#region Controls
left = keyboard_check(ord("Q")) or (gamepad_axis_value(0,gp_axislh) < -0.5) or gamepad_button_check(0,gp_padl);
right = keyboard_check(ord("D")) or (gamepad_axis_value(0,gp_axislh) > 0.5) or gamepad_button_check(0,gp_padr);
up = keyboard_check(ord("Z")) or (gamepad_axis_value(0,gp_axislv) < -0.5) or gamepad_button_check(0,gp_padu);
down = keyboard_check(ord("S")) or (gamepad_axis_value(0,gp_axislv) > 0.5) or gamepad_button_check(0,gp_padd);
fishing_button = keyboard_check_pressed(ord("F")) or gamepad_button_check_pressed(0,gp_face4);
echap = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0, gp_face2);

#endregion

switch (state)
{
#region Idle State
	case player.idle :
	image_index = 0;
	image_speed = 0;
	if ( right or left or up or down) state = player.moving;
	if (is_facing(o_fishing_location) and fishing_button) 
	{
		sprite = sprite_index;
		state = player.rod_out;
	}
	break;
#endregion
#region Moving State
	case player.moving :
	//Horizontal moving
	hspeed = (right - left)* max_speed;
	
	if (hspeed !=0) 
	{
		image_xscale = right - left;
		sprite_index = s_player_right;
	}
	// Vertical Moving
	vspeed = (down - up)* max_speed;
	if (down) sprite_index = s_player_down;
	if(up) sprite_index = s_player_up;
	//Activating sprite and changing state
	image_speed = 1;

	if(speed = 0) state = player.idle;
	break;
#endregion
#region Rod Out State
	case player.rod_out :	
		sprite_index = s_player_fishing;
		image_index = 0;
		//Take Rod Back
			if(echap)
		{
			sprite_index = sprite;
			state = player.idle;	
		}
		
		//Throwing the line
		if(fishing_button) 
		{
			bait = throw_bait(45,6);
			state = player.throwing
		}
		break;
#endregion
#region Throwing State
case player.throwing : 

	// Proceed to waiting phase is bait in water, go back to rod out if not.
	if (bait.speed == 0)
	{
		if(position_meeting(bait.x, bait.y, o_fishing_location)) 
		{
			state = player.waiting;
			alarm[1] = fishing_time; 
		}
		else state = player.rod_out;
	}	
	break;
#endregion
#region Waiting State
case player.waiting : 		
		
		// Cancel Fishing
		if(echap)
		{
			
			instance_destroy(bait);
			sprite_index = sprite;
			state = player.idle;	
		}
break;
#endregion
}