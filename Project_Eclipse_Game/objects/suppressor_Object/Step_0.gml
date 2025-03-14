// Inherit the parent event
event_inherited();


#region //ranger aiming
if instance_exists(goal) {
    //enemy aiming
    	centerY = y + centerYOffset;
        centerX1 = x + centerXOffset1;
        centerX2 = x + centerXOffset2;
    	
    	//aim
    	aimDir1 = point_direction(centerX1,centerY,goal.x, goal.y);
        aimDir2 = point_direction(centerX2,centerY,goal.x, goal.y);
    	//centerY is the center of the suppressor
    
    
    //attacking
    if attackTimer > 0
    {
    	attackTimer--; 
        
        idling = true;
    }
    
    if (distance_to_object(goal) < stopDistance && attackTimer <= 0 && state == "walk")
    {
        idling = false;
        sprite_index = attacking[face];
        image_index = 0;
        state = "attacking";
        bulletsShot = 0;
        
    }
    
    if state == "attacking" {
        if shootTimer > 0 {
            shootTimer--;
        } else {
            //reset the timer
            shootTimer = weapon.cooldown;
            
            //shooting	
            //create the bullet
            var _bulletInst1 = instance_create_depth(centerX1,centerY, depth-100, weapon.bulletObj);
            //creating an instance of a bullet object
            //and storing it's unique ID in _bulletInst
            
            //change the bullet's direction
            with(_bulletInst1) 
            {
                dir = other.aimDir1; //other refers to another object, suppressor in this case
            }
            
            //again for the other gun
            var _bulletInst2 = instance_create_depth(centerX2,centerY, depth-100, weapon.bulletObj);
            with(_bulletInst2) {
                dir = other.aimDir2; 
            }
            
            bulletsShot++;
        }
    
       if bulletsShot >= 5 {
           //end of attack
           sprite_index = sprite[face];
           image_index = 0;
           state = "walk";
           attackTimer = attackInterval;
       }
        
    }

    
}
#endregion

