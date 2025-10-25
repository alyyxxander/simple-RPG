

#region drawing health and level bars on screen

//positions of display to be drawn
var _dx = 16;
var _dy = 16;

var _statbar_height = 32;
var _statbar_width = 256;

//space between statbars
var _margin = 8;

//properties
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//healthbar
var _health_bar_width = _statbar_width * (obj_player.hp/obj_player.hp_max);

//healthbar background
draw_sprite_stretched(spr_box, 0, _dx, _dy, _statbar_width, _statbar_height); 

//remaining health (on top of background)
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_bar_width, _statbar_height, c_red, 0.6);

//we add the "_statbar_width/2" to center the text
draw_text(_dx+_statbar_width/2, _dy+_statbar_height/2, "HP");

//XP
var _xp_bar_width = _statbar_width * (obj_player.xp/obj_player.xp_to_level_up);
_dy += _statbar_height + _margin; 

//xp bar background
draw_sprite_stretched(spr_box, 0, _dx, _dy, _statbar_width, _statbar_height); 

//current xp (on top of background)
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _xp_bar_width, _statbar_height, c_blue, 0.6);

//the "$" means the string can contain variables
draw_text(_dx+_statbar_width/2, _dy+_statbar_height/2, $"LEVEL {obj_player.level}");

//reset properties
draw_set_halign(fa_left);
draw_set_valign(fa_top);

#endregion




//============ENEMIES LEFT
_dx = gui_width - (gui_width/10);
_dy = 16;
draw_text_transformed(_dx, _dy, obj_player.enemies_remaining, 2, 2, 0);


