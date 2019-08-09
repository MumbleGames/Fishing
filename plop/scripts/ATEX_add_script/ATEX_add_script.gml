/// @func ATEX_add_script(key, script, depth, type)
/// @desc create new tag
/// @arg {string} key tag name in text
/// @arg {real} script script that will draw element or change parameteres of drawing
/// @arg {real} depth Special depth of drawing script. Default - 0, <0 - above the text, >0 - below

var keys=script_execute(argument0, "names", 0, [0, 0], "names");
for(var i=0; i<array_length_1d(keys); i++)
{
	var container=[keys[i], argument0, 0, 0];
	container[2]=script_execute(argument0, "depth", 0, [0, 0], "depth")
	container[3]=script_execute(argument0, "type", 0, [0, 0], "type")
	global.ATEX_scripts[? keys[i]]=container
}

if container[3]!=ATEX.effect
		script_execute(argument0, 0, 0, [0, 0], "init", 0)