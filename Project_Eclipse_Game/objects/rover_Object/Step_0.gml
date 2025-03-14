// Inherit the parent event
event_inherited();


#region //attacking
if instance_exists(goal) {
    
    //decrement timer
    if attackTimer > 0
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
        
        var _rocket = instance_create_depth(x,y,depth+100,roverRocket_Object);
        with (_rocket) {
            dir = 90;//straight up
        }
    }
    
    if state == "attacking" {
        if shootTimer > 0 {
            shootTimer--;
        } else {
            
             //reset the timer
             shootTimer = weapon.cooldown;
             //shooting	        
             instance_create_depth(goal.x, goal.y, depth-100, weapon.bulletObj);
            
            //end of attack
                    sprite_index = sprite[face];
                    image_index = 0;
                    state = "walk";
                    attackTimer = attackInterval;
        }
    }
}
#endregion

