/// @description Manage environment visisibility

var top_layer_id = layer_get_id("Decorations_top");
var bottom_layer_id = layer_get_id("Decorations_bottom");


//Move Decoration into top layer if coming from top
if ((bbox_bottom < other.bbox_bottom) and other.layer==bottom_layer_id )
other.layer = top_layer_id;



// Move Decoration into bottom layer if coming from bottom
if ( (bbox_bottom >= other.bbox_bottom) and other.layer==top_layer_id)
other.layer = bottom_layer_id;

block_movement();