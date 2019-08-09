/// @arg content
/// @arg parse_too

var a0=argument[0], ptoo=false;
if argument_count>1
	ptoo=argument[1]

var l=a0[0];
for(var i=0; i<ds_list_size(l); i++)
{
	var info=l[| i], body=info[0];
	for(var j=0; j<ds_list_size(body); j++)
	{
		var cell=body[| j];
		if cell[0]=ATEX.tag
		{
			var tag=cell[1];
			if ptoo
			{
				ds_list_destroy(tag[1])
				ds_map_destroy(tag[2])
			}
		}
	}
	ds_list_destroy(body)
}
ds_list_destroy(l)