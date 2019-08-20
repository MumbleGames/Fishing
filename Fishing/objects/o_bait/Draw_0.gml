if( speed != 0) draw_sprite(sprite_index,image_index,x,y);

if (instance_exists(o_bait))
{
draw_set_color(c_white);
var pipi = instance_find(o_player,0);
if(pipi.sprite_index == s_player_fishing)
draw_line_width(pipi.x-2 , pipi.bbox_bottom, x, y, 1);

if(pipi.sprite_index == s_player_fishing_right)
draw_line_width(pipi.x - pipi.sprite_xoffset*pipi.image_xscale + pipi.sprite_height*(pipi.image_xscale +1)/2 , pipi.y - 14, x, y, 1);

if(pipi.sprite_index == s_player_fishing_up)
draw_line_width(pipi.x+1 , pipi.y - pipi.sprite_yoffset, x, y, 1);
}
