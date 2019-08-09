/// @arg {array} textlist Array with positions and text
/// @arg scripts
/// @arg leffects

for(var i=0; i<array_length_1d(argument0); i++)
{
	var cell=argument0[i], text=cell[2];
	if global.ATEX_symbol_draw>-1 {
		if string_length(text)>=global.ATEX_symbol_draw {
			text=string_copy(text, 1, global.ATEX_symbol_draw)
			global.ATEX_symbol_draw=0
			i=array_length_1d(argument0)
		}
		else
			global.ATEX_symbol_draw-=string_length(text)
	}
	ATEX_draw_ut(cell[0], cell[1], string_width(text), string_height(text), text, string_height(text), argument1, argument2)
}