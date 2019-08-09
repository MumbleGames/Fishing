/// @arg x
/// @arg y
/// @arg text
/// @arg sw

var sw=argument3;

if argument3==-1
	draw_text(argument0, argument1, argument2)
else
for(var i=1; i<=string_length(argument2); i++)
	draw_text(argument0+i*argument3, argument1, string_char_at(argument2, i))