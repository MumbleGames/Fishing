/// @description  ts_replace_keyword(key, newtag)
/// @param key
/// @param  newtag
for(var i=0; i<ds_list_size(global.ts_flist); i+=2)
{
    if global.ts_flist[| i]=argument0
    {
        global.ts_flist[| i+1]=argument1
        break
    }
}
