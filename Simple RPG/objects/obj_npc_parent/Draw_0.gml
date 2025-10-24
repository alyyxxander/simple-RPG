///@description when player is within talking range, show icon above NPC

draw_self();

if (player_is_close && !instance_exists(obj_dialogue)) {
    draw_sprite(spr_talk, 0, x, y-24); //y-24 so that the icon appers 16px above npc
}