/// @func ATEX_draw(x, y, text, w, h)
/// @arg {real} x
/// @arg {real} y
/// @arg {string} text
/// @arg {real} w
/// @arg {real} halign
var X=argument0, Y=argument1, text=argument2, w=argument3;

var parse=ATEX_parse(text);
var content=ATEX_position(parse, w);
ATEX_content_draw(content, X, Y, argument4)
ATEX_content_destroy(content, true)