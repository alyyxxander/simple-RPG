//PAUSE MANAGER BASED OFF THIS VIDEO: https://www.youtube.com/watch?v=dNiLIX8jNOM

//disable alpha blending (we just want RGB from screen)
gpu_set_blendenable(false); // Optimization: makes drawing the image faster/cleaner

//draw frozen image to screen while paused
if (global.game_paused) {
    
    // =========================================================
    // 2. DRAW THE FROZEN FRAME
    // =========================================================
    surface_set_target(application_surface); // IMPORTANT: We are drawing *onto* the screen's main surface
    
    if (surface_exists(pauseSurf)) {
        //This is the exact line that draws the frozen frame: 
        //It takes the snapshot you saved in Step 1 and paints it over the application_surface to simulate a freeze frame.
       draw_surface(pauseSurf, 0, 0); 
    } else {//restore from buffer if we lost the surface    
        pauseSurf = surface_create(gui_width, gui_height);
        if (!buffer_exists(pauseSurfBuffer)) pauseSurfBuffer = buffer_create(gui_width * gui_height * 4, buffer_fixed, 1);
        buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);    
    }
    
    
    // =========================================================
    // 3. DRAW THE OVERLAY (Paused Screen Effect)
    // =========================================================
    
    //we need to temporarily enable alpha blending so we can have a slightly opaque overlay
    gpu_set_blendenable(true);
    
    draw_set_alpha(0.5); //set to 50% opacity
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_width, gui_height, false);
    draw_set_color(c_white); //reset color
    draw_set_alpha(1); //reset opacity
    
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    //draw_text_ext_transformed(gui_width/2, gui_height/2, "PAUSED", 1, gui_width, 3, 3, 0);
    draw_text_transformed(gui_width/2, gui_height/2, "PAUSED", 3, 3, 0);
    
    draw_set_valign(fa_top); //reset to default
    draw_set_halign(fa_left); //reset to default
    //==========================================================
    surface_reset_target();
}

if (keyboard_check_pressed(ord("P"))) {
    
    global.game_paused = !global.game_paused; //toggle pause
    
    if (global.game_paused) {
        
        //deactive evertything other than this instance
        //instance_deactivate_all(true);
        instance_deactivate_layer("Instances");
        
        //NOTE:
        //If you need to pause anything like animating sprites, tiles, room backgrounds,
        //etc. you need to do that separately, unfortunately!
        
        // =========================================================
        // 1. CAPTURE AN IMAGE FROM THE SCREEN
        // =========================================================
        
        //capture this game moment (wont capture draw gui contents though)
        pauseSurf = surface_create(gui_width, gui_height); // Creates a new surface
        surface_set_target(pauseSurf); // Tells GMS2 to draw *to* this new surface
        draw_surface(application_surface, 0, 0); // *** COPIES THE CURRENT SCREEN ***
        surface_reset_target(); // Tells GMS2 to resume drawing to the screen
        
        //back up this surface to a buffer in case we lose it (screen focus, etc.)
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer); 
        pauseSurfBuffer = buffer_create(gui_width * gui_height * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
    
    } else {
        instance_activate_all();
        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
}


//enable alpha blending again 
gpu_set_blendenable(true);