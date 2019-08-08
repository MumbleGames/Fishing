/// @description  ts_smoothspace(array, last)
/// @param array
/// @param  last

var token=argument0[argument1];

if global.ts_j
if is_string(token)
{
    if string_char_at(token, string_length(token))=" "
    {
        argument0[@ argument1]=string_delete(token, string_length(token), 1)
        return 0
    }
}
