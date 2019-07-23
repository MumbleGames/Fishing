/// @description Blocking Player
var sprite = sprite_index;
sprite_index = s_player_collision;
if(place_meeting(x,y,other))
{
hspeed = 0 ;
vspeed = 0;
x = xprevious;
y = yprevious;
state = player.idle;

}
sprite_index = sprite;