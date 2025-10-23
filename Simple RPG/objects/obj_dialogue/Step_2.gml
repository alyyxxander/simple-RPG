if (current_message < 0) exit;

var _str = messages[current_message].msg;    


//if we havent displayed the full string yet
if (current_char < string_length(_str)) {
    //keyboard_check(input_key) = 1 when pressed. So when space is pressed,
    // the character speed will be twice as fast, since it'll be char_speed*(1+1)
    current_char += char_speed * (1 + keyboard_check(input_key));

    
    //display string that is part of the message
    draw_message = string_copy(_str, 0, current_char);
} 
//when full message is displayed on screen, wait for user to press key
else if (keyboard_check_pressed(input_key)) { 
    current_message++; //go to next message
    
    //if thats the end of all the dialogue, end dialogue
    if (current_message >= array_length(messages)) {
        instance_destroy();
    } else {
        //reset so next message can start from the beginning
        current_char = 0;  
    }
}
    