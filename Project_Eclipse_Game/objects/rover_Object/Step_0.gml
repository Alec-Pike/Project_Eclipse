// Inherit the parent event
event_inherited();


#region //attacking
if instance_exists(goal) {
    
    //decrement timer
    if shootTimer > 0
    {
    	shootTimer--;
         
    }
    
    if (distance_to_object(goal) < stopDistance && shootTimer <= 0 )
    {
    	idling = true;
    	//reset the timer
    	shootTimer = weapon.cooldown;
        //shooting	        
        instance_create_depth(goal.x, goal.y, depth-100, weapon.bulletObj);
    }
}
#endregion

