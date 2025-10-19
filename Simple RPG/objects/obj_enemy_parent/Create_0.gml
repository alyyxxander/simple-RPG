target_x  = x;
target_y = y;
tilemap =  layer_tilemap_get_id("Tiles_Collision");
alarm[0] = 60;

//knockback (how much the enemy is moving while alarm[1] is active)
knockback_x = 0;
knockback_y = 0;

_old_x = x;
_old_y = y;

moving_left = false;
moving_right  = true;

moving_left_spr = spr_enemy1_old;
moving_right_spr = spr_enemy1_old;
idle_left_sprite = spr_enemy1_old;
idle_right_sprite = spr_enemy1_old;