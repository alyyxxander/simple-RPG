move_speed = 1;
tilemap = layer_tilemap_get_id("Tiles_Collision");

//direction the player is currently facing
//right=0, up=90, left=180, down=270
facing = 270;

//==========player stats
hp = 10;
hp_max = hp;
damage = 1;
level = 1;
xp = 0;
xp_to_level_up = 100; //xp needed until level up


//=============FUNCTIONS
function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    if  (xp >= xp_to_level_up) {
        level++;
        xp -= xp_to_level_up;
        xp_to_level_up *= 1.4; //increase xp needed for every level
        
        hp_max  += 5;
        hp =  hp_max;
        damage += 0.8;
        
        create_dialogue([ 
        {
            name: "Congrats!",
            msg: $"You leveled up! Your new stats are:\nLVL: {level}\nHP: {hp_max}\nDMG: {damage}"
        }
        ]);
    }
}

