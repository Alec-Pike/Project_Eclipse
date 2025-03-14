//receive damage
get_damaged(DamageEnemy_Object); //put in the object you want to damage as the parameter

// check if dead
if (hp <= 0) {
    instance_destroy(self);
}

// move
// This line moves the enemy move_speed steps towards the goal
// while avoiding all obstacles.
if (instance_exists(goal)) && (distance_to_object(goal) > stopDistance && state == "walk") {
    mp_potential_step(goal.x, goal.y, move_speed, false);
    idling = false;
} 

//sprite control
#region
    // make sure sprite is facing correct direction
    // this line will need to be altered for the ranger, probably the boss too
    face = round(direction/90); //direction has a degree like 90, 180 or 270 and so on based on mouse direction
    if face == 4 { face = 0; }; //since a degree from direction like 350 will round up to 360, so when it does 360/9 it gets an index of 4 which we don't have
    //face has to be either 0,1,2,3 to use the code from create that changes sprite/changes player direction
    if face == 2 { // left and right use the same sprite
        face = 0; 
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }    

    //animate
    if state == "walk" {
        if (instance_exists(goal)) && (distance_to_object(goal) <= stopDistance) && idling {
            sprite_index = idle[face];
        } else {
            //set the enemy sprite
            mask_index = sprite[3];
            sprite_index = sprite[face]; 
        }
    }
    
    
#endregion
