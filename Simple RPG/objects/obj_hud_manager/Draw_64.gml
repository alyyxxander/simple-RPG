var _scale = global.pixel_scale;
var _target_width = gui_width / _scale;
var _target_height = gui_height / _scale;
var _stat_font_size = 9;

// Check and create the surface if it doesn't exist
if (!surface_exists(ui_surface)) {
    ui_surface = surface_create(_target_width, _target_height);
}

// ----------------------------------------------------------------------
// A. Draw to the 1x Surface
// ----------------------------------------------------------------------

surface_set_target(ui_surface);
draw_clear_alpha(c_black, 0); // Clear surface to transparent

// Define UN-SCALED variables (these are the true pixel positions)
var dx = 8;
var dy = 8;
var statbar_height = 12;
var statbar_width = 64;
var margin = 4;


//=====================HEALTH BAR
// Get UN-SCALED Health Bar Width
var health_bar_width = statbar_width * (obj_player.hp / obj_player.hp_max);

// healthbar background
draw_sprite_stretched(spr_box, 0, dx, dy, statbar_width, statbar_height);

// remaining health (on top of background)
draw_sprite_stretched(spr_health, 1, dx, dy, health_bar_width, statbar_height);


//====================XP BAR
var _xp_bar_width = statbar_width * (obj_player.xp/obj_player.xp_to_level_up);
var _XP_dy = dy + statbar_height + margin; 

//xp bar background
draw_sprite_stretched(spr_box, 0, dx, _XP_dy, statbar_width, statbar_height); 

//current xp (on top of background)
draw_sprite_stretched(spr_xp, 1, dx, _XP_dy, _xp_bar_width, statbar_height);


//===============DRAW HEARTS (remaining lives) TO SCREEN
var _hearts_dy = _XP_dy + margin + sprite_get_height(spr_heart);
draw_sprite(spr_heart, 1, dx, _hearts_dy);

for (var i = 0; i<global.lives_remaining-1; i++) { 
    dx += sprite_get_width(spr_heart) + margin;
    draw_sprite(spr_heart, 1, dx, _hearts_dy);   
}





// ----------------------------------------------------------------------
// B. Draw the Surface Scaled to Screen
// ----------------------------------------------------------------------

surface_reset_target();

// Draw the 1x surface, stretching it by the scale factor (e.g., 3x)
// This makes everything drawn above look crisp and pixel-perfect.
draw_surface_stretched(ui_surface, 0, 0, gui_width, gui_height);


dx = 8;

// We add the "_statbar_width/2" to center the text
// You must set the font scale to 1 to ensure it's not blurry
draw_set_font(fnt_HUD); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed((dx + statbar_width/2) * _scale, (dy + statbar_height/2) * _scale, "HP", 1, 1, 0);

//the "$" means the string can contain variables
draw_text((dx+statbar_width/2)*_scale, (_XP_dy+statbar_height/2)*_scale, $"LEVEL {obj_player.level}");





//=====================ENEMIES LEFT
dx = gui_width - (gui_width/10);
dy = 48;
draw_text_transformed(dx, dy, obj_player.enemies_remaining, 1, 1, 0);


