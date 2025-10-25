// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_shadow(_vertical_offset=0){
    //i added -8 to the vertical offset bc having origin of sprites
    //be at bottom-center instead of middle-center already offsets
    //the shadow by about -8 px. may need adjusted for each sprite
    draw_sprite_ext(spr_shadow, 0, x, y-8+_vertical_offset, 0.8, 1, 0, -1, 0.4);
}