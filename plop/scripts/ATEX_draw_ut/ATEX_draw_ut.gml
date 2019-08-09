/// @arg X
/// @arg Y
/// @arg w
/// @arg h
/// @arg text
/// @arg lineH
/// @arg scripts
/// @arg leffects

var queue=ds_priority_create(), X=argument0, Y=argument1,
	w=argument2, h=argument3, text=argument4,
	lineH=argument5, scripts=argument6, leffects=argument7,
	script=noone;

DEPTH=1
for(var z=0; z<ds_list_size(scripts); z+=4)
	ds_priority_add(queue, z, scripts[| z+3])
while !ds_priority_empty(queue)
{
	var ind=ds_priority_delete_max(queue), script=scripts[| ind], args=scripts[| ind+1], props=scripts[| ind+2], DEPTH=scripts[| ind+3];
	if DEPTH<=0
		break
	script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
}
if DEPTH!=0
{
	if ds_list_empty(leffects)
		ATEX_drawtext_dist(X, Y+lineH-h, text, ATEX_current_symboldist)
	else
	{
		var cX=X, cY=Y+lineH-h;
		for(var si=1; si<=string_length(text); si++)
		{
			var csymb=string_char_at(text, si), cpos=[cX, cY], candraw=1;
			for(var sii=0; sii<ds_list_size(leffects); sii+=4)
				candraw=min(candraw, script_execute(leffects[| sii], leffects[| sii+1], leffects[| sii+2], cpos, lineH, h, csymb, text, si))
			if candraw
				draw_text(cpos[0], cpos[1], csymb)
			if ATEX_current_symboldist==-1
				cX+=string_width(csymb)
			else
				cX+=ATEX_current_symboldist
		}
	}
	if script!=noone and DEPTH<0
		script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
}
else
	script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
while !ds_priority_empty(queue)
{
	var ind=ds_priority_delete_min(queue), script=scripts[| ind], args=scripts[| ind+1], props=scripts[| ind+2], DEPTH=scripts[| ind+3];
	script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
}

ds_priority_destroy(queue)