//check if alarm was not set yet (alarms will be set to -1 when they are not set)
if (alarm[1] < 0) { 
    hp -= other.damage; //subtract the players damage from enemys health
    
    image_blend = c_red; //change color to show enemy has been hit
    
    knockback_x = sign(x - other.x);
    knockback_y = sign(y - other.y);
    
    alarm[1] = 20; //knockback will run for 20 frames
}