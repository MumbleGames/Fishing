/// @func ATEX_content_draw(content, x, y)
/// @desc Draw current content. content - ds_list with lines. Use ATEX_position to create it. This function will return array [width, height] of text
/// @arg {real} content Current content
/// @arg {real} x
/// @arg {real} y
/// @arg {real} [halign]

var cnt=argument[0], gX=argument[1], gY=argument[2], body=cnt[0], maxW=cnt[1], maxH=cnt[1], nH=cnt[2], halign=0;
var X=gX, Y=gY, startX=gX, poslist=[], poslist_i=0, positing=0, textdraw=1, texta=[], text_i=0, DEPTH=1, scripts=ds_list_create(), queue=ds_priority_create(), qeffects=ds_priority_create(), leffects=ds_list_create();
var doutput=[], di=0, slimit=0;
ATEX_current_symboldist=real(global.ATEX_settings[? "symbol-width"])
if global.ATEX_symbol_draw>0 slimit=1
if argument_count>3
	ATEX_current_halign=argument[3]
else
	ATEX_current_halign=global.ATEX_settings[? "content-halign"]
if ATEX_current_halign==fa_left
	ATEX_current_halign=0
else
if ATEX_current_halign==fa_center
	ATEX_current_halign=0.5
else
if ATEX_current_halign==fa_right
	ATEX_current_halign=1

for(var i=0; i<ds_list_size(body); i++)
{
	var lineinfo=ds_list_find_value(body, i), line=lineinfo[0], lineW=lineinfo[1], lineH=lineinfo[2], linebreak=lineinfo[3];
	if !(ATEX_mode_is_enabled(ATEX.alignment) and !linebreak)
		X=gX+(maxW-lineW)*ATEX_current_halign
	else
		X=0
	var dW=(ATEX_mode_is_enabled(ATEX.alignment) and !linebreak)*(maxW-lineW)/max(ds_list_size(line)-1, 1)
	for(var j=0; j<ds_list_size(line); j++)
	{
		var element=ds_list_find_value(line, j), type=element[0];
		if type==ATEX.text
		{
			#region processing text
			var text=element[1], w=element[2], h=element[3], script=noone;
			if slimit {
				if string_length(text)>global.ATEX_symbol_draw 
				{
					text=string_copy(text, 1, global.ATEX_symbol_draw)
					global.ATEX_symbol_draw=0
				}
				else
					global.ATEX_symbol_draw-=string_length(text)
			}
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
							candraw=min(candraw, script_execute(leffects[| sii], "", leffects[| sii+1], leffects[| sii+2], cpos, lineH, h, csymb, text, si))
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
				X+=w+dW
			}
			else
				script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
			while !ds_priority_empty(queue)
			{
				var ind=ds_priority_delete_min(queue), script=scripts[| ind], args=scripts[| ind+1], props=scripts[| ind+2], DEPTH=scripts[| ind+3];
				script_execute(script, args, props, [w, h], "draw", text, X, Y+lineH-h)
			}
			#endregion
		}
		else if type==ATEX.tag
		{
			var cell=element[1], w=element[2], h=element[3], ctype=element[4], tag=cell[0], DEPTH=tag[2];
			var ssymb=global.ATEX_symbol_draw;
			if slimit
			if tag[3]==ATEX.element global.ATEX_symbol_draw--
			if ctype=="start"
			{
				if tag[3]==ATEX.ext
				{
					texta=[]
					text_i=0
					poslist=[]
					if DEPTH==0
					{
						#region get positions and text
						var br=0;
						for(i=i; i<ds_list_size(body); i++)
						{
							lineinfo=body[| i]
							line=lineinfo[0]
							lineW=lineinfo[1]
							lineH=lineinfo[2]
							linebreak=lineinfo[3];
							if j=-1
								X=gX+(maxW-lineW)*ATEX_current_halign*!(ATEX_mode_is_enabled(ATEX.alignment) and !linebreak)
							var dW=(ATEX_mode_is_enabled(ATEX.alignment) and !linebreak)*(maxW-lineW)/max(ds_list_size(line)-1, 1)
							for(var j=j+1; j<ds_list_size(line); j++)
							{
								var cElement=line[| j], cType=cElement[0];
								if cType==ATEX.tag
									{
										j--
										br=1
										break
									}
								else
									{
										var cw=cElement[2], ch=cElement[3];
										texta[text_i]=[X, Y, cElement[1]]
										poslist[text_i]=[X, Y, X+cw, Y+ch]
										text_i++
										X+=cw+dW
									}
							}
							if br break
							j=-1
							Y+=lineH
							X=gX+(maxW-lineW)*ATEX_current_halign*!(ATEX_mode_is_enabled(ATEX.alignment) and !linebreak)
						}
						#endregion
					}
				}
				else
				{
					if tag[3]==ATEX.effect
						ds_list_add(leffects, tag[1], cell[1], cell[2], DEPTH)
					else
						ds_list_add(scripts, tag[1], cell[1], cell[2], DEPTH)
				}
				if tag[3]!=ATEX.effect
					script_execute(tag[1], cell[1], cell[2], [w, h], ctype, poslist, texta, scripts, leffects)
				if global.ATEX_isfast and script_execute(tag[1], cell[1], cell[2], [w, h], "dynamic")
				{
					var nscr=ds_list_create(), neff=ds_list_create();
					ds_list_copy(nscr, scripts)
					ds_list_copy(neff, leffects)
					doutput[di]=[tag[1], cell[1], cell[2], [w, h], ctype, poslist, texta, nscr, neff, global.ATEX_font, draw_get_color(), ssymb]
					di++
				}
			}
			else if ctype=="end"
			{
				text_i=0
				DEPTH=1
				if tag[3]!=ATEX.effect
					script_execute(tag[1], cell[1], cell[2], [w, h], ctype, poslist, texta, scripts, leffects)
				poslist=[]
				texta=[]
				if tag[3]=ATEX.drawer	
				{
					for(var z=ds_list_size(scripts)-1; z>=0; z-=4)
						if scripts[| z-3]==tag[1]
							{repeat 4 ds_list_delete(scripts, z-3); break}
				}
				else if tag[3]==ATEX.effect
					for(var z=ds_list_size(leffects)-1; z>=0; z-=4)
						if leffects[| z-3]==tag[1]
							{repeat 4 ds_list_delete(leffects, z-3); break}
			}
			else
			{
				script_execute(tag[1], cell[1], cell[2], [w, h, lineW, lineH], ctype, X, Y, scripts, leffects)
				DEPTH=1
				if global.ATEX_isfast and script_execute(tag[1], cell[1], cell[2], [w, h, lineW, lineH], "dynamic")
				{
					var nscr=ds_list_create(), neff=ds_list_create();
					ds_list_copy(nscr, scripts)
					ds_list_copy(neff, leffects)
					doutput[di]=[tag[1], cell[1], cell[2], [w, h, lineW, lineH], ctype, X, Y, nscr, neff, global.ATEX_font, draw_get_color(), global.ATEX_symbol_draw]
					di++
				}
			}
			X+=w+dW
		}
		if ATEX_mode_is_enabled(ATEX.debug) or keyboard_check(vk_f11)
		{
			draw_line(X-dW, Y, X, Y+lineH)
		}
		if slimit and global.ATEX_symbol_draw<=0 {
			i=ds_list_size(body)
			break
		}
	}
	Y+=lineH
	X=startX
}

ds_list_destroy(scripts)
ds_priority_destroy(queue)
ds_priority_destroy(qeffects)
ds_list_destroy(leffects)

return doutput