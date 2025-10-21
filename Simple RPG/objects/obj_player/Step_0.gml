//this = 1 when D is pressed, and = -1 when A is pressed
//its set up this way, because to move to the right, you need to add +1 to 
//the x coord, and subtract -1 from the x coord to move left
var _hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));

//this = 1 when S is pressed, and -1 when W is pressed
var _vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _xmove = _hinput * move_speed;
var _ymove = _vinput * move_speed;



#region Nudge adjustment to prevent getting stuck
// --- Nudge adjustment to prevent getting stuck (Before movement) ---

// We use place_meeting() to check for collision at the current position (x, y).
// The third argument is the Tilemap ID, which is a valid target for place_meeting.
//if (place_meeting(x, y, tilemap)) {
    // The instance is currently stuck *inside* the tilemap collision boundary.
    
    // Nudge ONLY if the player is NOT trying to move down, 
    // which prevents the push from interfering with downward movement.
//    if (_vinput >= 0) {
        // Move the player's position down by 1 pixel to pull them out of the collision
//        y += 1; 
//    }
//}
#endregion



//movement and collision all in one function!! =D
move_and_collide(_xmove, _ymove, tilemap, 2, undefined, undefined, move_speed, move_speed);


//if player is moving
if (_hinput != 0 || _vinput != 0) {
    if      (_vinput > 0) sprite_index = spr_player_walk_down; 
    else if (_vinput < 0) sprite_index = spr_player_walk_up; 
    else if (_hinput > 0) sprite_index = spr_player_walk_right;
    else if (_hinput < 0) sprite_index = spr_player_walk_left;    
    
    //update player direction
    facing = point_direction(0, 0, _hinput, _vinput);
} 
//player is idle
else {
    if      (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left; 
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;           
}


//create attack animation
if (keyboard_check_pressed(vk_space)) {
    var _attack_inst;
    
    if (facing == 270) { //adjustment to account for sprite origin being at bottom of sprite
        _attack_inst = instance_create_depth(x, y-7, depth, obj_attack);
    } else if (facing == 90) {
        _attack_inst = instance_create_depth(x, y-5, depth, obj_attack);
    } else  {
        _attack_inst = instance_create_depth(x, y, depth, obj_attack);
    }
    
    //change angle to match the direction the player is facing
    _attack_inst.image_angle = facing;
    
    _attack_inst.damage *= damage;
}


