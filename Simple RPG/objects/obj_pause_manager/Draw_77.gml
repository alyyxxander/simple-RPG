//PAUSE MANAGER TAKEN FROM THIS VIDEO: https://www.youtube.com/watch?v=dNiLIX8jNOM

//disable alpha blending (we just want RGB from screen)
gpu_set_blendenable(false);

//draw frozen image to screen while paused
if (global.game_paused) {
    surface_set_target(application_surface);
    
    if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
    else {//restore from buffer if we lost the surface    
        pauseSurf = surface_create(gui_width, gui_height);
        if (!buffer_exists(pauseSurfBuffer)) pauseSurfBuffer = buffer_create(guiWidth * guiHeight * 4, buffer_fixed, 1);
        buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);    
    }
    
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
        
        //capture this game moment (wont capture draw gui contents though)
        pauseSurf = surface_create(gui_width, gui_height);
        surface_set_target(pauseSurf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
        
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
