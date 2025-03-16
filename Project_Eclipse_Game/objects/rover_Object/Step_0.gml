// Inherit the parent event
event_inherited();


#region //attacking
if instance_exists(goal) {
    
    //decrement timer
    if attackTimer > 0 && state == "walk"
    {
    	attackTimer--;
         idling = true;
    }
    
    if (distance_to_object(goal) < stopDistance && attackTimer <= 0 && state == "walk")
    {
    	idling = false;
        
        state = "attacking";
        sprite_index = attacking[face];
        image_index = 0;
        
        attackTimer = attackInterval;
        shootTimer = weapon.cooldown;
    }
    
    if state == "attacking" {
        if shootTimer > 0 {
            shootTimer--;
        } else {
            //reset the timer
             shootTimer = weapon.cooldown;
            
            // calculate mortar position
            var _xoffset = 0;
            if face % 2 == 0 { // if facing to the side
                _xoffset = -15 * image_xscale;
            }
            
            //fire rocket
            var _rocket = instance_create_depth(x+_xoffset,y-25,depth+100,roverRocket_Object);
            with (_rocket) {
                dir = 90;//straight up
            }
             
             //place target	        
             var _target = instance_create_depth(goal.x, goal.y, depth-100, weapon.bulletObj);
            with _target {
                targetGoal = other.goal;
            }
            
            //end of attack
                    sprite_index = sprite[face];
                    image_index = 0;
                    state = "walk";
                    
        }
    }
}
#endregion

