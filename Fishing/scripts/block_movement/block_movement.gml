// Block movement against an object


var move_sprite = sprite_index

//switch to collision sprites
if(id == o_player.id) sprite_index = s_player_collision;
else sprite_index +=1;
other.sprite_index += 1;


//block movement
if(place_meeting(x,y,other))
{
hspeed = 0 ;
vspeed = 0;
x = xprevious;
y = yprevious;
state = player.idle;
}

//switch back to normal sprites;
other.sprite_index -=1;
sprite_index = move_sprite;

