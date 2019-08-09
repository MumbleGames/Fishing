var args=argument0, props=argument1;

var text=ATEX_get_prop(props, "title", "");

clipboard_set_text(text)
dtext=text+" copied"
dalpha=1