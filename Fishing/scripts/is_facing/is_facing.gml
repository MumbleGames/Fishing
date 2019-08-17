// @description check what kind of of object is in front
/// @arg object

object = argument0;

if (sprite_index == s_player_down and position_meeting(x,y+32, object))
return true;
if (sprite_index == s_player_up and position_meeting (x,y-32, object))
return true;
if (sprite_index == s_player_right and image_xscale == 1 and position_meeting(x+32, y, object))
return true;
if (sprite_index == s_player_right and image_xscale == -1 and position_meeting(x-32, y , object))
return true;

return false;