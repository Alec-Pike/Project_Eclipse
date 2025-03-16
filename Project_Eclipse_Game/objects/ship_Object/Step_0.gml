if (!global.betweenRounds) {
    
    //depth
    depth = -bbox_bottom;
    
    get_damaged(DamagePlayer_Object);
    
    if turretUnlocked {
        
        sprite_index = shipTurret_Sprite;
        
        //ship aiming 
        centerY = y + centerYOffset;
        centerX = x + centerXOffset;
            
        
        if instance_exists(EnemyParent_Object) {
            //aim
            var _aimAt = instance_nearest(centerX,centerY,EnemyParent_Object);
        
           aimDir = point_direction(centerX,centerY,_aimAt.x, _aimAt.y);
           
           //shoot the weapon
               if shootTimer > 0
               {
                   shootTimer--; 
               }
               
               if (shootTimer <= 0)
               {
                   
                   //reset the timer
                   shootTimer = weapon.cooldown;
                   
                   //create the bullet
                   var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
                   var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir);
                   var _bulletInst = instance_create_depth(centerX+_xOffset,centerY+_yOffset, depth-100, weapon.bulletObj);
                   //creating an instance of a bullet object
                   //and storing it's unique ID in _bulletInst
                   
                   //change the bullet's direction
                   with(_bulletInst) {
                       dir = other.aimDir; //other refers to another object, ship in this case
                       image_angle = other.aimDir;
                   }
                   
               }
        }	
    }
    
    
    // check if dead
    if hp <= 0 {
        instance_destroy(self);
    }
        
}