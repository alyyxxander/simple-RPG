//every few seconds, the enemy will choose a new coord to travel to,
//depending on their distance to the player

_old_x = x; // store current x for direction check later
_old_y = y;

//if enemy is close enough, follow the player
if (instance_exists(obj_player) && distance_to_object(obj_player) < distance_before_follow) {
    target_x =  obj_player.x;
    target_y =  obj_player.y;
} else { //otherwise choose a random coord within a spec. range
    target_x = random_range(xstart-100, xstart+100);
    target_y = random_range(ystart-100, ystart+100);
}


//Check if enemy’s target is to the left or right of current position
if (target_x < _old_x) {
    moving_left = true;
    moving_right = false;
} else if (target_x > _old_x) {
    moving_right = true;
    moving_left = false;
} else {
    moving_left = false;
    moving_right = false;
}

if (moving_left) {
    sprite_index = moving_left_spr;
} else {
    sprite_index = moving_right_spr;
}

//we want this to run again in 1-3 seconds
alarm[0] = random_range(60,180);