
function draw_shadow(_vertical_offset=0){
    //i added -8 to the vertical offset bc having origin of sprites
    //be at bottom-center instead of middle-center already offsets
    //the shadow by about -8 px. may need adjusted for each sprite
   
    //draw_sprite_ext(spr_shadow, 0, x, y-8+_vertical_offset, 0.8, 1, 0, -1, 0.4);


// 1. Store the object's current dynamic depth
    var _old_depth = depth; 
    
    // 2. Temporarily set the drawing depth to a fixed high number (low depth value)
    // This forces the shadow to draw *before* the wall tops (e.g., depth = -100)
    // We use a low number like 1000 to ensure it's drawn early.
    gpu_set_depth(-1000); 
    
    // 3. Draw the Shadow
    // i added -8 to the vertical offset bc having origin of sprites be at bottom-center instead of middle-center already offsets. the shadow by about -8 px. may need adjusted for each sprite
    draw_sprite_ext(spr_shadow, 0, x, y-8+_vertical_offset, 0.8, 1, 0, -1, 0.4);
    
    // 4. Reset the drawing depth back to the object's original dynamic depth
    // This is CRITICAL so draw_self() draws at the correct Y-Sorted depth.
    gpu_set_depth(_old_depth);
}