/// @description init
// You can write your code in this editor

ATEX_init() // initialization extension


// loading example text from json file
var src="", f=file_text_open_read("text.txt");

while !file_text_eof(f)
{
	src+=file_text_read_string(f);
	file_text_readln(f);
}
file_text_close(f);

// decode json
texts=json_decode(src);

// some fucking variables for buttons
button_a=0.4;
back_a  =0.4;