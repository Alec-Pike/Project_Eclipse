//receive damage

if place_meeting(x,y,DamageEnemy_Object)
{
    var _inst = instance_place(x,y,DamageEnemy_Object);
    
    //take damage from specific instance
    hp -= _inst.damage;
    
    //tell the damage instance to destroy itself
    
    _inst.destroy = true;	
}

// check if dead
if (hp <= 0) {
    instance_destroy(self);
}

// move
// This line moves the enemy move_speed steps towards the goal
// while avoiding all obstacles.
// For the rammer (hovering enemy), just change the last param to solidWall_object
mp_potential_step_object(goal.x, goal.y, move_speed, solidWall_object);

//sprite control
#region
    // make sure sprite is facing correct direction
    // this line will need to be altered for the ranger, probably the boss too
    face = round(direction/90); //direction has a degree like 90, 180 or 270 and so on based on mouse direction
    if face == 4 { face = 0; }; //since a degree from direction like 350 will round up to 360, so when it does 360/9 it gets an index of 4 which we don't have
    //face has to be either 0,1,2,3 to use the code from create that changes sprite/changes player direction
    
    //animate
    if (hspeed == 0 && vspeed == 0) { //we don't have animation yet lol
        image_index = 0; //if enemy no move, the current sprite stays in frame 1, which does not move because it's a still image
    }
    
    //set the enemy sprite
    mask_index = sprite[3];
    sprite_index = sprite[face];
#endregion
