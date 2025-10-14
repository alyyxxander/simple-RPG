//every second, the enemy will choose a new coord to travel to,
//depending on their distance to the player

//if enemy is close enough, follow the player
if (instance_exists(obj_player) && distance_to_object(obj_player) < distance_before_follow) {
    target_x =  obj_player.x;
    target_y =  obj_player.y;
} else { //otherwise choose a random coord within a spec. range
    target_x = random_range(xstart-100, xstart+100);
    target_y = random_range(ystart-100, ystart+100);
}

//we want this to run every second
alarm[0] = 60;