/// @description Blocking Player

if(place_meeting(x,y,other))
{
hspeed = 0 ;
vspeed = 0;
x = xprevious;
y = yprevious;
state = player.idle;

}
