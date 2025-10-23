if (instance_exists(obj_dialogue)) exit;
    
if (instance_exists((obj_player)) && distance_to_object(obj_player) < distance_threshold) {
    player_is_close = true;
    
    if (keyboard_check_pressed(input_key)) {
        create_dialogue(dialogue);
    }
} else  {
    player_is_close = false;
}