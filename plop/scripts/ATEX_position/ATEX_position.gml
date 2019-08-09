/// @func ATEX_position(body, [w])
/// @arg {array} body array that ATEX_parse returns
/// @arg {real} [w] Width of the text

var body=argument[0], nW=-1, nH=-1;
if argument_count>1 nW=argument[1]
var w=0, h=0, W=0, H=0, cH=0, cW=0, cell, content=ds_list_create(), line=ds_list_create(), text, linebreak=0, symb, linetext="";
var maxW=0, maxH=0, breakline=0;
var ncall, ntext, spcW;
ATEX_current_symboldist=global.ATEX_settings[? "symbol-width"];

#macro ATEX_newline if ds_list_size(line)>0 {var last=line[| ds_list_size(line)-1]; if last[0]==ATEX.text and string_char_at(last[1], 1)==" " {cW-=last[2]; ds_list_delete(line, ds_list_size(line)-1)}} ds_list_add(content, [line, cW, cH, breakline]) maxW=max(maxW, cW) maxH+=cH cH=0 cW=0 breakline=0 line=ds_list_create()
#macro ATEX_oldline if ds_list_size(line)>0 {var last=line[| ds_list_size(line)-1]; if last[0]==ATEX.text and string_char_at(last[1], 1)==" " {cW-=last[2]; ds_list_delete(line, ds_list_size(line)-1)}} ds_list_add(content, [line, cW, 0, breakline]) maxW=max(maxW, cW) breakline=0 line=ds_list_create()

global.ATEX_symbol_number=0
#region processing

for(var i=0; i<array_length_1d(body); i++)
{
	cell=body[i] 
	text=""
	if is_array(cell) 
		var type="tag";
	else
		var type="text";
	
	if type=="tag"
	{
		#region processing tag
		var tag=cell[0], tagtype=cell[3], tagmode=tag[3], stype="draw";
		if tagmode==ATEX.element 
			global.ATEX_symbol_number++
		if tagtype==1 
		{
			stype="end"
			var w=0, h=0;
		}
		else if tagmode=ATEX.drawer or tagmode==ATEX.effect
		{
			stype="start"
			var w=0, h=0;
		}
		else
		{
			var output=script_execute(tag[1], cell[1], cell[2], [nW, cH, cW], "position");
			if is_array(output)
				var w=output[0], h=output[1];
			else
			{
				var w=0, h=0;
				type="tag.text"
				text=string(output)
				stype="start"
			}
		
			if cW+w>=nW and nW!=-1
			{
				cH=max(cH, string_height("A"))
				ATEX_newline
			}
			cW+=w
			cH=max(cH, h)
		}
		ds_list_add(line, [ATEX.tag, cell, w, h, stype, global.ATEX_symbol_number])
		#endregion
	}
	else
		text=cell
	if text!=""
	{
		#region splitting text on words
		var words, word_i=1, psymb="";
		words[0]=""
		for(var j=1; j<=string_length(text); j++)
		{
			symb=string_char_at(text, j)
			if (symb!=" " and psymb==" ") or symb=="\n" or symb=="\r" or ATEX_in(symb, global.ATEX_separating_symbols)
			{
				word_i++
				words[word_i-1]=symb
				if symb=="\n" or symb=="\r"
				{
					words[word_i]=""
					word_i++
				}
			}
			else {
				words[word_i-1]+=symb 
			}
			psymb=symb
		}
		#endregion
		#region splitting text on lines
		var wordH=string_height("A");
		for(var j=0; j<word_i; j++)
		{
			var cword=words[j], wordW=ATEX_text_get_width(ATEX_current_symboldist, cword), newline=0;
			if cword=="\r"
			{
				ATEX_oldline
			}
			else
			if cword=="\n" or (cW+wordW>=nW and nW!=-1)
			{
				ATEX_newline 
				newline=1
				if cword==" " continue
			}
			if !ATEX_mode_is_enabled(ATEX.alignment) or string_char_at(cword, 1)!=" " or !newline
			{
				cW+=wordW
				cH=max(wordH, cH)
				if cword=="\n" cword=""
				ds_list_add(line, [ATEX.text, cword, wordW, wordH])
				global.ATEX_symbol_number+=string_length(cword)
			}
		}
		#endregion
	}
	if type=="tag.text"
	{
		ds_list_add(line, [ATEX.tag, cell, 0, 0, "end"])
	}
}

linebreak=1
if !ds_list_empty(line)
	{ATEX_newline}

ds_list_destroy(line)
#endregion

if ATEX_mode_is_enabled(ATEX.debug)
	show_debug_message("{debug} ATEX: positing ended")

if nW!=-1 maxW=nW
if nH=-1 nH=maxH
return [content, maxW, maxH, nH, global.ATEX_symbol_number]