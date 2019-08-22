left = keyboard_check_pressed(ord("Q")) or gamepad_button_check_pressed(0,gp_padl);
right = keyboard_check_pressed(ord("D")) or gamepad_button_check_pressed(0,gp_padr);

if(left or right)
image_index += right - left;