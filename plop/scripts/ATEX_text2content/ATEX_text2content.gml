/// @arg text
/// @arg [width]

var w=-1;
if argument_count>1
	w=argument[1]

return ATEX_position(ATEX_parse(argument[0]), w)