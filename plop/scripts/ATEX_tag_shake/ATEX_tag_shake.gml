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
	return ["fshake", "tshake", "tShake", "fShake"]
if type=="type"
	return ATEX.ext
if type=="dynamic"
	return true
	
#endregion

if type=="position"
{
	var title=ATEX_get_prop(props, "text", "");
	if title=="" title=ATEX_get_prop(props, "title", "");
	if title=="" title=ATEX_get_prop(props, "t", "")
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
	var size=ATEX_get_prop(props, "size", -1);
	if size==-1 size=ATEX_get_prop(props, "strong", -1);
	if size==-1 size=ATEX_get_prop(props, "s", 0);
	size=real(size)
	
	for(var i=0; i<array_length_1d(textlist); i++)
	{
		var cell=textlist[i], text=cell[2];
		if global.ATEX_symbol_draw>-1 {
			if string_length(text)>=global.ATEX_symbol_draw {
				text=string_copy(text, 1, global.ATEX_symbol_draw)
				global.ATEX_symbol_draw=0
				i=array_length_1d(textlist) 
			}
			else
				global.ATEX_symbol_draw-=string_length(text)
		}
		var cx=cell[0], cy=cell[1], len=string_length(text);
		for(var j=1; j<=len; j++) {
			var s=string_char_at(text, j)
			draw_text(cx+random(size)-size/2, cy+random(size)-size/2, s)
			cx+=string_width(s)
		}
	}
}
else
if type=="end"
{
}
else
if type=="init"
{
}