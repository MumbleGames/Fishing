/// @func ATEX_tag_link(arguments, properties, sizes, event, poslist)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height
/// @arg {string} event Event for this tag
/// @arg {array} list of positions of text

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 0
if type=="names"
	return ["link", "lnk"]
if type=="type"
	return ATEX.ext
if type=="dynamic"
	return true
	
#endregion

if type=="position"
{
	var title=ATEX_get_prop(props, "title", "link");
	return title
}
else
if type=="draw"
{
}
else
if type=="start"
{
	var poslist=argument4, textlist=argument5; // array with text coordinates. You can use it to detect collision with cursor
	var moveon=0;
	if ATEX_mousemove_check(poslist)
	{
		var type=ATEX_get_prop(props, "type", global.ATEX_settings[? "link-type"]), link=ATEX_get_prop(props, "src", "https://marketplace.yoyogames.com/publishers/2522/vishnya-games", 1, "src");
		if is_real(link) type="scr"
		moveon=1
		if mouse_check_button_released(mb_left)
		if type=="scr"
			script_execute(link, args, props)
		else
			url_open(link)
	}
	
	var col=draw_get_colour();
	if moveon
	{
		if mouse_check_button(mb_left)
			var newcol=ATEX_get_prop(props, "cm", global.ATEX_settings[? "link-color-moveon"]);
		else
			var newcol=ATEX_get_prop(props, "cp", global.ATEX_settings[? "link-color-press"])
	}
	else
		var newcol=ATEX_get_prop(props, "c", global.ATEX_settings[? "link-color-idle"])
	
	if newcol>=0
		draw_set_colour(newcol)
	ATEX_drawself(textlist, argument6, argument7)
	draw_set_colour(col)
}
else
if type=="end"
{
}
else
if type=="init"
{
	global.ATEX_settings[? "link-color-idle"]=c_green
	global.ATEX_settings[? "link-color-moveon"]=c_lime
	global.ATEX_settings[? "link-color-press"]=c_green
	global.ATEX_settings[? "link-type"]="url"
}
/*
		You can use draw_set_... functions, you can draw your own things, you can doing what you want, really (just ask your mother for permission)
*/