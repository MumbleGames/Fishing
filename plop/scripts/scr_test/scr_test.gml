var summ=0;
if !is_array(argument0)
	return show_debug_message("ERROR in scr_test: argument0 must be array! argument0 = "+string(argument0))
for (var i=1; i<array_length_1d(argument0); i++)
	summ+=real(argument0[i])
	
return summ
	
	
/* 

	this function created for test ATEX_convert_argument function.
	
	argument0[0] - name of current script
	argument0[1..length] - arguments