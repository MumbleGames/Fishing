/// @func ATEX_parse(text)
/// @desc parse current text
/// @arg {string} text


var text=argument[0];

var body=[];
var W=0, H=0, w=0, h=0, symb, word="";

if ATEX_mode_is_enabled(ATEX.debug)
	show_debug_message("{debug} ATEX: started parsing "+text)

if !ATEX_mode_is_enabled(ATEX.nomacros) {
	for(var i=0; i<ds_list_size(global.ATEX_variables_list); i++) {
		var key=global.ATEX_variables_list[| i], value=global.ATEX_variables[? key];
		if value!=undefined
			text=string_replace_all(text, "${"+string(key)+"}", value)
	}
}

#region pasring
for(var i=1; i<=string_length(text); i++)
{
	symb=string_char_at(text, i)
	
	#region processing_tag
	if symb == global.ATEX_trigger_start
	and string_char_at(text, i-1)!="/"
	{
		if word!=""
		{
			if ATEX_mode_is_enabled(ATEX.debug)
				show_debug_message("{debug} ATEX: string pushed "+word)
			body[array_length_1d(body)]=word
			word=""
		}
		
		i++
		var csymb=string_char_at(text, i), tag="";
		#region take_tag
		var tagtype=0;
		while(csymb!="|" and csymb!="?" and csymb!=" " and csymb!=";" and csymb!="," and csymb!=":" and csymb!=global.ATEX_trigger_end and i<=string_length(text))
		{
			if csymb!=" " tag+=csymb
			i++
			csymb=string_char_at(text, i)
		}
		if string_char_at(tag, 1)=="/"
		{
			tagtype=1
			tag=string_delete(tag, 1, 1)
		}
		if ATEX_mode_is_enabled(ATEX.debug)
			show_debug_message("{debug} ATEX: tag detected - "+tag)
		#endregion
		#region take_args
		var args=ds_list_create(), props=ds_map_create();
		if csymb!=global.ATEX_trigger_end // if it isn't end of tag, tage arguments and properties
		{
			#region parsing arguments
			var vtype=csymb, cvar="", cval, cutspaces=1, tokens=[], cword="", brackets=0;
			for(i=i+1; i<=string_length(text); i++)
			{
				csymb=string_char_at(text, i)
				if csymb=="\""
					brackets=!brackets
				else
				if csymb==global.ATEX_trigger_end and !brackets
					break
				else
				if (csymb=" " or csymb=="=" or csymb==":" or csymb==";" or csymb=="," or csymb=="|" or csymb=="?") and !brackets
				{
					if cword!=""
						tokens[array_length_1d(tokens)]=cword
					if csymb=="=" or csymb==":"
						tokens[array_length_1d(tokens)]=csymb
					cword=""
				}
				else
					cword+=csymb
			}
			if cword!=""
				tokens[array_length_1d(tokens)]=cword
			#endregion
			#region processing arguments
			for(var j=0; j<array_length_1d(tokens); j++)
			{
				if j+1<array_length_1d(tokens) and (tokens[j+1]=="=" or tokens[j+1]==":")
				{
					if j+2<array_length_1d(tokens)
						ds_map_add(props, tokens[j], tokens[j+2])
					else if ATEX_mode_is_enabled(ATEX.debug)
						show_debug_message("{DEBUG} ATEX: incorrect number of arguments")
					j+=2
				}
				else
					ds_list_add(args, tokens[j])
			}
			#endregion
		}
		#endregion
		#region find index of argument
		var tag_index=ds_map_find_value(global.ATEX_scripts, tag);
		if tag_index==undefined
			show_debug_message("ATEX: TAG "+tag+" DOES NOT EXISTS!")
		else
		#endregion
		#region create conainer for tag and push it in body
		{
			var container=[tag_index, args, props, tagtype];
			body[array_length_1d(body)]=container
			if ATEX_mode_is_enabled(ATEX.debug)
				show_debug_message("{debug} ATEX: tag successfully pushed to body")
		}
		#endregion
	}
	else 
	if symb!="/" or (string_char_at(text, i+1)!=global.ATEX_trigger_end and string_char_at(text, i+1)!=global.ATEX_trigger_start)
		word+=symb
	#endregion
}
if word!=""
{
	if ATEX_mode_is_enabled(ATEX.debug)
		show_debug_message("{debug} ATEX: string pushed "+word)
	body[array_length_1d(body)]=word
}
#endregion

if ATEX_mode_is_enabled(ATEX.debug)
	show_debug_message("{debug} ATEX: parsing ended ^^^")
return body