if( speed != 0) draw_sprite(sprite_index,image_index,x,y);

if (instance_exists(o_bait))
{
draw_set_color(c_white);
var pipi = instance_find(o_player,0);
draw_line_width(pipi.x , pipi.bbox_bottom, x, y, 1);
}
