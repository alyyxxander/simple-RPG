///@description setting sprite depth

//the END STEP event runs after every step, so after
// every instance has already moved to its new position.
// Here we will overlap the sprites to be on top of other
// sprites that are behind it

//with(all) means it'll loop through all instances in the room
with (all) {
    depth  = -bbox_bottom;
}