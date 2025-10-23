//if dialogue box is up, dont run anything below so that
//the enemy wont be able to move
if (instance_exists(obj_dialogue)) exit;
    
if  (alarm[1] >= 0) { //if alarm is active
    target_x = x + knockback_x;
    target_y = y + knockback_y;
} 

var _hor = clamp(target_x-x, -1, 1);
var _ver = clamp(target_y-y, -1, 1);

move_and_collide(_hor*move_speed, _ver*move_speed, [tilemap, obj_enemy_parent]);

//if (_old_x==x && _old_y==y) {
//    if (moving_left) sprite_index = idle_left_sprite;
//    else             sprite_index = idle_right_sprite;
//}

