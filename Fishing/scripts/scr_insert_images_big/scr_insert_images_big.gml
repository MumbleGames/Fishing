var input=argument0, output=ts_line();

for(var i=0; i<ds_list_size(input); i++)
{
    output+=ts_image(ds_list_find_value(input, i), ts.original, ts.original)
}

return output+ts_line();
