// Inherit the parent event
event_inherited();

#region // aiming
if instance_exists(goal) {
    //enemy aiming
        centerY = y + centerYOffset;
        
        //aim
        aimDir = point_direction(x,centerY,goal.x, goal.y);
        //centerY is the center of the player
    //sprite control
    
    //shoot the weapon
    if shootTimer > 0
    {
        shootTimer--; 
        idling = true;
    }
    
    if (distance_to_object(goal) < stopDistance && shootTimer <= 0 && state == "walk")
    {
        idling = false;
        sprite_index = windup[face];
        image_index = 0;
        state = "windup";
        
    }
}
#endregion
