// Draws a box
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var size = sprite_get_width(argument0) /3;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;

var horizontal = abs(x2 - x1);
var vertical = abs(y2 - y1);
var nombre_de_lignes = ceil(vertical / size);
var nombre_de_colonnes = ceil(horizontal / size);

// Corners
draw_set_alpha(1);
//top left
draw_sprite_part(argument0, 0, 0,0,size,size,x1,y1);
//top right
draw_sprite_part(argument0, 0, size*2, 0, size, size, x2 - size, y1);
//bottom left
draw_sprite_part(argument0,0,0, size*2,size, size, x1, y2 - size);
//bottom right
draw_sprite_part(argument0, 0, size*2, size*2, size, size, x2 - size, y2- size);


// Edges
for (var i=1; i <nombre_de_lignes - 2; i++)
{
	//left edge
	draw_sprite_part(argument0, 0, 0, size, size, size, x1, y1 + i * size);
	//right edge
	draw_sprite_part(argument0, 0, size*2, size, size, size, x2 - size, y1 + i * size);
}
for (var i=1; i <nombre_de_colonnes - 2; i++)
{
	//top edge
	draw_sprite_part(argument0, 0, size, 0, size, size, x1 + i * size, y1);
	//bottom edge
	draw_sprite_part(argument0, 0, size, size*2, size, size, x1 + i * size, y2 - size);
}

//small gap left/right borders
var taille_y = (y2 - size) - (y1 + (nombre_de_lignes - 2)*size); 
var ratio_y = taille_y/size;
draw_sprite_part_ext(argument0,0 ,0, size,size, size, x1, y2 -size - taille_y, 1, ratio_y, c_white ,1);
draw_sprite_part_ext(argument0,0 ,size*2, size,size, size, x2 - size, y2 - size - taille_y, 1, ratio_y, c_white , 1);

//small gap top/bottom borders
var taille_x = (x2 - size) - (x1 + (nombre_de_colonnes - 2)*size); 
var ratio_x = taille_x/size;
draw_sprite_part_ext(argument0,0 ,size, 0,size, size, x2 - size - taille_x , y1, ratio_x, 1, c_white , 1);
draw_sprite_part_ext(argument0,0 ,size, size*2,size, size, x2 - size - taille_x, y2 - size, ratio_x, 1, c_white , 1);


// Middle

for (var i =1 ; i <= nombre_de_lignes - 2; i++)
{
	for (var j = 1 ; j <= nombre_de_colonnes - 2; j++)
	{
		// generic middle
		if (j!= nombre_de_colonnes -2 and i!= nombre_de_lignes -2 ) 
		draw_sprite_part(argument0, 0, size, size, size, size, x1 + size*j, y1 + size*i);	
		
		//right gap
		if (j == nombre_de_colonnes - 2 and i!= nombre_de_lignes -2)
		draw_sprite_part_ext(argument0,0 ,size, size,size, size, x1 + size*j, y1 + size*i, ratio_x, 1, c_white , 1);
		if(i == nombre_de_lignes - 2 and j!= nombre_de_colonnes -2)
		draw_sprite_part_ext(argument0,0 ,size, size,size, size, x1 +size*j, y2 - size - taille_y, 1, ratio_y, c_white , 1);
		if ( (j== nombre_de_colonnes - 2) and  (i == nombre_de_lignes - 2) )
		draw_sprite_part_ext(argument0,0 ,size, size,size, size, x2 -size - taille_x , y2 - size - taille_y, ratio_x, ratio_y, c_white , 1);
		
	}
	
}

