/// @description Initialize Controls and State Machine


enum player { idle, moving, rod_out,  throwing , fishing, waiting, catching, reeling }

state = player.idle;
sprite_index = s_player_down;
