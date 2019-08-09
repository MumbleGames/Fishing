/// @func ATEX_tag_TEMPLATE(arguments, properties, sizes, type)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 1
if type=="names"
	return ["sprite", "image", "picture", "pic", "spr", "img"]
if type=="type"
	return ATEX.element
	
#endregion

if type=="dynamic"
{
	if ATEX_get_prop(props, "fps", 0)!=0 
		return true
	else
		return false
}
if type=="position"
{
	var w=real(ATEX_get_prop(props, "w", -1)), h=real(ATEX_get_prop(props, "h", -1));
	var spr=ATEX_get_arg(args, 0, noone, 1, "sprite");
	if !sprite_exists(spr)
	{
		show_debug_message("sprite "+string(spr)+" doesn't exist")
		return [0, 0]
	}
	var sw=sprite_get_width(spr), sh=sprite_get_height(spr);
	if w=-2 w=sw
	if h=-2 h=sh
	if h=-1 if w=-1 h=H else h=w*(sh/sw)
	if w=-1 w=h*(sw/sh)
	if W!=-1 {w=min(W, w); h=w*sh/sw}
	return [w, h]
}
else
if type=="draw"
{
	var X=argument4, Y=argument5;
	var w=W, h=H, spd=real(ATEX_get_prop(props, "fps", 0)), frame=real(ATEX_get_prop(props, "frame", 0));
	var spr=ATEX_get_arg(args, 0, noone);
	
	if W=0 or H=0 return false
	draw_sprite_stretched(spr, frame+(current_time*0.001*spd), X, Y+sizes[3]-H, W, H)
}
else
if type=="start"
{
	var poslist=argument4, textlist=argument5;
	/*
			start of the tag, it calling when "position" event return text
	*/
}
else
if type=="end"
{
	var poslist=argument4, textlist=argument5; // array with text coordinates. You can use it to detect collision with cursor
	/*
			end of the tag, it calling when text returned in "position" event already drawn
	*/
}
else
if type=="init"
{
	/*
		initialization, usually in CREATE event
	*/
}
/*
		You can use draw_set_... functions, you can draw your own things, you can doing what you want, really (just ask your mother for permission)
*/