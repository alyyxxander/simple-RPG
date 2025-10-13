//this = 1 when D is pressed, and = -1 when A is pressed
//its set up this way, because to move to the right, you need to add +1 to 
//the x coord, and subtract -1 from the x coord to move left
var _hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));

//this = 1 when S is pressed, and -1 when W is pressed
var _vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));


//movement and collision all in one function!! =D
move_and_collide(_hinput*move_speed, _vinput*move_speed, tilemap);



//if player is moving
if (_hinput != 0 || _vinput != 0) {
    if (_vinput > 0) sprite_index = spr_player_walk_down; 
    else if (_vinput < 0) sprite_index = spr_player_walk_up; 
    else if (_hinput > 0) sprite_index = spr_player_walk_right;
    else if (_hinput < 0) sprite_index = spr_player_walk_left;    
} 
//player is idle
else {
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left; 
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;           
}
