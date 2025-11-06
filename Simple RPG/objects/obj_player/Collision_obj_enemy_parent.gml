if(alarm[0] < 0) {
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red;
    
    if (hp <= 0) {
        obj_player.lives_remaining--;
        if (obj_player.lives_remaining == 0) room_goto(rm_restart);
        else {
            hp = hp_max; //reset health
            room_restart();
        }
    }
}