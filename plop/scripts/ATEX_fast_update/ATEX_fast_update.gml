/// @arg body
/// @arg update_content

var surf=argument0[? "surf"], body=argument0[? "body"];
var a=draw_get_alpha(), c=draw_get_color();

global.ATEX_fast_index=argument0
global.ATEX_settings=argument0[? "props"]
if body=-1 or argument1
{
	ds_map_copy(argument0[? "props"], global.ATEX_settings_default)
	if body!=-1 ATEX_content_destroy(body, true)
	body=ATEX_position(ATEX_parse(argument0[? "text"]), argument0[? "w"])
	argument0[? "symbs"]=global.ATEX_symbol_number
}

if surface_exists(surf)
if surface_get_width(surf)!=body[1]
or surface_get_height(surf)!=body[2]
	surface_free(surf)

if !surface_exists(surf)
	surf=surface_create(max(1, body[1]), max(1, body[2]))
	
global.ATEX_isfast=true
global.ATEX_font=global.ATEX_settings[? "content-font"]
global.ATEX_symbol_draw=argument0[? "draw-symbs"]

var props=global.ATEX_settings;
if font_exists(props[? "content-font"]) draw_set_font(props[? "content-font"])
draw_set_color(props[? "content-color"])
draw_set_alpha(props[? "content-alpha"])

surface_set_target(surf)
draw_clear_alpha(props[? "back-color"], props[? "back-alpha"])

argument0[? "delements"]=ATEX_content_draw(body, 0, 0, argument0[? "halign"])

surface_reset_target()
global.ATEX_isfast=false
global.ATEX_fast_index=-1
global.ATEX_settings=global.ATEX_settings_default
global.ATEX_symbol_draw=-1

argument0[? "surf"]=surf
argument0[? "body"]=body

draw_set_alpha(a)
draw_set_color(c)