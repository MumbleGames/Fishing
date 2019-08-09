var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return -1
if type=="names"
	return ["style", "stl", "sl", "set"]
if type=="type"
	return ATEX.ext
	
#endregion

if type=="position" {
	var f=ATEX_get_prop(props, "font", undefined);
	if f==undefined
		f=ATEX_get_prop(props, "f", undefined)
	if f!=undefined
		draw_set_font(f)
	return [0, 0] // first value - width, second - height. You can write your values
}
else
if type=="draw" {
	var ch=ATEX_get_prop(props, "halign", undefined);
	if ch==undefined 
		ch=ATEX_get_prop(props, "hlgn", undefined)
	if ch==undefined 
		ch=ATEX_get_prop(props, "h", undefined)
	
	if ch!=undefined 
	if ch==fa_left
		ATEX_current_halign=0
	else
	if ch==fa_center
		ATEX_current_halign=0.5
	else
	if ch==fa_right
		ATEX_current_halign=1
		
	var c=ATEX_get_prop(props, "color", undefined);
	if c==undefined
		c=ATEX_get_prop(props, "col", undefined)
	if c==undefined
		c=ATEX_get_prop(props, "c", undefined)
	if c!=undefined	
		draw_set_color(c)
		
	var a=ATEX_get_prop(props, "alpha", undefined);
	if a==undefined
		a=ATEX_get_prop(props, "a", undefined)
	if a!=undefined 
		draw_set_alpha(a/255)
	
	var f=ATEX_get_prop(props, "font", undefined);
	if f==undefined
		f=ATEX_get_prop(props, "f", undefined)
	if f!=undefined {
		draw_set_font(f)
		global.ATEX_font=f
	}
	
	var sw=ATEX_get_prop(props, "symbol-width", undefined);
	if sw==undefined
		f=ATEX_get_prop(props, "sw", undefined)
	if sw!=undefined {
		ATEX_current_symboldist=real(sw)
	}
		
	return true
}