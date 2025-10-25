function create_dialogue(_messages) {
    //dont do anything if dialogue already exists
    if (instance_exists(obj_dialogue)) return; 
         
    var _inst  = instance_create_depth(0, 0, 0, obj_dialogue);
    _inst.messages = _messages;
    _inst.current_message = 0;
};


character_colors = {
    "Congrats!": c_yellow,
    "Pink Girl": c_fuchsia,
    "PlayerName": c_aqua,
    "Other Guy": c_olive
};

character_portraits  = {
    "Pink Girl": spr_portrait_pink,
    "PlayerName": spr_portrait_player, 
    "Other Guy": spr_portrait_other,
};

other_guy_dialogue_1 = [
{
    name: "Other Guy",
    msg: "This is jusst aa demo. I dont haave aanything clever to say."
},{
    name: "PlayerName",
    msg: "Your speech has a lot of typos."
},{
    name: "Other Guy",
    msg: "Wow, you didnt need to call me out liiike thaat."
},{
    name: "Other Guy",
    msg: "Dick."
}
];

welcome_dialogue = [
{
    name: "Pink Girl",
    msg: "Hello! Welcome to the dungeon!!"
},{
    name: "PlayerName",
    msg: "Thanks!"
},{
    name: "Pink Girl",
    msg: "If you could kill all these monsters that'd be great."
},{
    name: "PlayerName",
    msg: "I'll try."
},{
    name: "Pink Girl",
    msg: "Doesn't matter if you fail, you'll just respawn."
},{
    name: "PlayerName",
    msg: "Oh. Good to know."
},{
    name: "Pink Girl",
    msg: "Yeaahhhhh.... Okay bye!"
}
];


