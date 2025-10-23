
//====================DRAW BACKGROUND BOX
var _dx = 0;
var _dy = gui_height * 0.7; //70% of the way down vertically
var _box_width = gui_width;
var _box_height = gui_height - _dy;

draw_sprite_stretched(spr_box, 0, _dx, _dy, _box_width, _box_height);



//=====================DISPLAY NAME
//where the name will be drawn
_dx += 16;
_dy += 16;
draw_set_font(Font1);

var _name = messages[current_message].name;
var temp_var = global.character_colors[$ _name];
draw_set_color(global.character_colors[$ _name]);

draw_text(_dx, _dy, _name);
draw_set_color(c_white);  //reset text color



//===================DRAWING MESSAGE
_dy += 40; //draw text 40 pixels below the name

//draw_text_ext() lets you set a max width the text will go before
//wrapping to the next line
draw_text_ext(_dx, _dy, draw_message, -1, _box_width-_dx*2);




