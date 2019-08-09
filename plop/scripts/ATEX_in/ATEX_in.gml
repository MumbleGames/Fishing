for(var i=1; i<argument_count; i++)
	if is_array(argument[i])
	{
		var array=argument[i];
		for(var j=0; j<array_length_1d(array); j++)
			if argument[0]==array[j]
				return true
	}
	else
	if argument[0]==argument[i]
		return true
		
return false