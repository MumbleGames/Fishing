/// @arg body
/// @arg text
/// @arg halign

if argument1==argument0[? "text"]
	and argument2==argument0[? "halign"]
		exit

if argument2!=-1
	argument0[? "halign"]=argument2
argument0[? "text"]=argument1
ATEX_fast_update(argument0, true)