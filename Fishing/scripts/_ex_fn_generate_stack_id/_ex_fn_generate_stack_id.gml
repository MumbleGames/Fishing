///@func	_ex_fn_generate_stack_id(tags)
///@desc	PRIVATE FUNCTION! used only internally
///@arg		{ds_map} tags
///@return	{string}

return md5_string_unicode(json_encode(argument0));
