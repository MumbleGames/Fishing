/// @func ATEX_parse_draw(x, y, body, w, h)
/// @arg {real} x
/// @arg {real} y
/// @arg {string} text
/// @arg {real} w
/// @arg {real} h
/// @arg {real} halign
var X=argument0, Y=argument1, parse=argument2, w=argument3, h=argument4;

var content=ATEX_position(parse, w, h);
ATEX_content_draw(content, X, Y, argument5)
ATEX_content_destroy(content)