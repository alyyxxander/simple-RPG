///@description load player stats/info
with (obj_carry_data) {
    other.level = level;
    other.xp = xp;
    other.xp_to_level_up = xp_to_level_up;
    other.hp = hp;
    other.hp_max = hp_max;
    
    //we no longer need this instance of obj_carry_data once 
    //all of the info has been transferred back to the player
    instance_destroy(); 
}
