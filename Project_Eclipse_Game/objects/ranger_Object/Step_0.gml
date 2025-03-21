// Inherit the parent event
event_inherited();


#region //ranger aiming
if instance_exists(goal) {
    //enemy aiming
    	centerY = y + centerYOffset;
        centerX = x + centerXOffset;
    	
    	//aim
    	aimDir = point_direction(x,centerY,goal.x, goal.y);
    	//centerY is the center of the player
    
    
    //shoot the weapon
    if shootTimer > 0
    {
    	shootTimer--; 
        
        // animate gun
        if shootTimer < weapon.cooldown/4 {
            weapon.sprite = rangerGunCharge_Sprite;
        }
    }
    
    if (distance_to_object(goal) < stopDistance && shootTimer <= 0)
    {
    	
    	//reset the timer
    	shootTimer = weapon.cooldown;
        
        // reset the weapon sprite
        weapon.sprite = rangerGun_Sprite;
        
    //shooting	
    	//create the bullet
    	var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
    	var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir);
    	var _bulletInst = instance_create_depth(x + _xOffset,centerY + _yOffset, depth-100, weapon.bulletObj);
    	//creating an instance of a bullet object
    	//and storing it's unique ID in _bulletInst
    	
    	//change the bullet's direction
    	with(_bulletInst) 
    	{
    		dir = other.aimDir; //other refers to another object, ranger in this case
    		_bulletInst.image_angle = dir;
    	}
    }
}
#endregion

