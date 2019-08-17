///@func	ex_db_load(...filenames)
///@desc	loads items into the database from one or more CSV files. A group is created for every file, using the filename as name
///@arg		{...string} filenames - up to 15 CSV filenames to load the data from

var _headers_row = 0;
var _types_row = 1;

for(var _arg = 0; _arg < argument_count; _arg++) {


    var _filename = argument[_arg];
	var _csv = load_csv(_filename);
	var _width = ds_grid_width(_csv);
	var _height = ds_grid_height(_csv);

	for(var _row = 2; _row < _height; _row++) {
		var _data = ds_map_create();
		
		for(var _col = 0; _col < _width; _col++) {
			switch(_csv[# _col, _types_row]) {
				case "real": 
					var _value = real(_csv[# _col, _row]);
					break;
				case "asset":
					var _value = asset_get_index(_csv[# _col, _row]);
					break;
				default:
					var _value = string(_csv[# _col, _row]);
			}
            _data[? _csv[# _col, _headers_row]] = _value;
        }
        
		//add item to the database
		var _group = filename_change_ext(filename_name(_filename), "");
		ex_db_add(_data, _group);
		
	}

	ds_grid_destroy(_csv);
	
}