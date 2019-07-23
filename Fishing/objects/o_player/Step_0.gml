/// @description On verra

#region Controls
left = keyboard_check(ord("Q")) or (gamepad_axis_value(0,gp_axislh) < -0.5);
right = keyboard_check(ord("D")) or (gamepad_axis_value(0,gp_axislh) > 0.5);
up = keyboard_check(ord("Z")) or (gamepad_axis_value(0,gp_axislv) < -0.5);
down = keyboard_check(ord("S")) or (gamepad_axis_value(0,gp_axislv) > 0.5);
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
		state = player.fishing;
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
#region Fishing State
	case player.fishing :	
		sprite_index = s_player_fishing;
		image_index = 0;
		
		if(fishing_button)
		throw_bait();
		//Leaving Fishing mode
		if(echap)
		{
			sprite_index = sprite;
			state = player.idle;	
		}
#endregion
}
