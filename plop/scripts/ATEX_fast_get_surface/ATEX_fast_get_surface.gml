/// @arg body

var surf=argument0[? "surf"]
if !surface_exists(surf)
{
	ATEX_fast_update(argument0, false)
	surf=argument0[? "surf"]
}
return surf