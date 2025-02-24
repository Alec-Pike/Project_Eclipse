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
mp_potential_step_object(goal.x, goal.y, move_speed, wall_Object);