global.ATEX_macros=ds_map_create()
global.ATEX_macros_list=ds_map_create()
global.ATEX_scripts=ds_map_create()
global.ATEX_scripts_list=ds_list_create()
global.ATEX_font=0
global.ATEX_trigger_start="<"				/// start and end of the tag
global.ATEX_trigger_end	 =">"
global.ATEX_modes=0
global.ATEX_separating_symbols=[";", ","]
global.ATEX_symbol_number = 0
global.ATEX_symbol_draw = -1
global.ATEX_settings = ds_map_create()		// default settings
	global.ATEX_settings[? "back-color"]=c_orange
	global.ATEX_settings[? "back-alpha"]=0
	global.ATEX_settings[? "content-color"]=c_orange
	global.ATEX_settings[? "content-alpha"]=c_white
	global.ATEX_settings[? "content-font"]=-1
	global.ATEX_settings[? "content-halign"]=fa_left
	global.ATEX_settings[? "symbol-width"]=-1
global.ATEX_variables=ds_map_create()		// variables
global.ATEX_variables_list=ds_list_create()
	ATEX_variable_set("left", fa_left)
	ATEX_variable_set("right", fa_right)
	ATEX_variable_set("middle", fa_middle)
	ATEX_variable_set("center", fa_center)
global.ATEX_settings_default = global.ATEX_settings
global.ATEX_fast_index=-1

#macro ATEX_mode global.ATEX_modes

global.ATEX_mouse_dx=0
global.ATEX_mouse_dy=0
global.ATEX_isfast=0
global.ATEX_current_version="0.6 - alpha"

global.ATEX_modes_count=7

enum ATEX
{
	notags		=1,	// this mode makes drawing faster, but tags and macros will not work
	gui			=2,	// use it when you draw text in GUI event
	nomacros	=4,	// this mode makes drawing faster, but macros and variables will not work
	wrapping	=8,	// enable wordwrapping
	alignment	=16,// enable alignment
	debug		=32,// enable debug mode
	cutwords	=64,// enable cut words
	text		=0,
	tag			=1,
	standart	=-1,
	drawer		=0,
	element		=1,
	part		=1,
	effect		=2,
	ext			=3
}

/*
				You can create your own modes, just write:
					global.my_mode = ATEX_mode_add()
					
				And you can check it with function 
					ATEX_mode_is_enabled( global.my_mode )
				
				Example:
						global.smooth_mode = ATEX_mode_add()
						ATEX_mode = global.my_mode | ATEX.wrapping
				
				"|" - summ of tags, you can use "+" if you know that current mode didn't use
				Example:
						DO: ATEX_mode = global.my_mode | global.wrapping | global.my_mode
						DO: ATEX_mode = global.my_mode + global.wrapping
						NOT TO DO: ATEX_mode = global.my_mode + global.wrapping + global.my_mode
				
				To turn off all modes just write 
											ATEX_mode = 0
*/

ATEX_add_script(ATEX_tag_colour)
ATEX_add_script(ATEX_tag_font)
ATEX_add_script(ATEX_tag_text)
ATEX_add_script(ATEX_tag_link)
ATEX_add_script(ATEX_tag_shadow)
ATEX_add_script(ATEX_tag_outline)
ATEX_add_script(ATEX_tag_picture)
ATEX_add_script(ATEX_tag_underline)
ATEX_add_script(ATEX_effect_wave)
ATEX_add_script(ATEX_effect_rainbow)
ATEX_add_script(ATEX_effect_shake)
ATEX_add_script(ATEX_tag_runline)
ATEX_add_script(ATEX_tag_halign)
ATEX_add_script(ATEX_tag_props)
ATEX_add_script(ATEX_tag_style)
ATEX_add_script(ATEX_tag_space)
ATEX_add_script(ATEX_tag_symbol_width)
ATEX_add_script(ATEX_tag_shake)

show_debug_message("ATEX: initialization successfull")