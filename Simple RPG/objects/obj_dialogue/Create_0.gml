messages = [];
current_message = -1; //this equals -1 when dialogue hasnt started yet
current_char = 0;
draw_message = ""; //holds only the characters that need to be displayed rn

char_speed  = 0.5; //how fast characters appear
input_key = vk_space; //key used to move to next message

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();