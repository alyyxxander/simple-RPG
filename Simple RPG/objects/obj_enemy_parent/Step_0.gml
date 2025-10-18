if  (alarm[1] >= 0) { //if alarm iis active
    target_x = x + knockback_x;
    target_y = y + knockback_y;
}

var _hor = clamp(target_x-x, -1, 1);
var _ver = clamp(target_y-y, -1, 1);

move_and_collide(_hor*move_speed, _ver*move_speed, [tilemap, obj_enemy_parent]);