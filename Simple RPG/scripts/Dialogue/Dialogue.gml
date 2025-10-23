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




other_dialogue = [
{
    name: "Pink Girl",
    msg: "Hello!"
},{
    name: "Other Guy",
    msg: "More text here!!"
},{
    name: "Pink Girl",
    msg: "Bing bong"
},{
    name: "Pink Girl",
    msg: "This is the 4th message"
},{
    name: "Other Guy",
    msg: "5th message....."
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