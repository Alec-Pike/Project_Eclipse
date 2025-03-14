
//end of windup
if array_contains(windup, sprite_index) {
    
    
    sprite_index = attacking[face];
    image_index = 0;
    
    //shooting	
            //create the bullet
            var _bulletInst = instance_create_depth(x,centerY, depth-100, weapon.bulletObj);
            //creating an instance of a bullet object
            //and storing it's unique ID in _bulletInst
            
            //change the bullet's direction
            with(_bulletInst) 
            {
                dir = other.aimDir; //other refers to another object, ranger in this case
                _bulletInst.image_angle = 90 * round((dir-90)/90); // only orthagonal
            }
        
} else if array_contains(attacking, sprite_index) {
    //end of attack
    sprite_index = sprite[face];
    state = "walk";
    
    
    
    //reset the timer
    shootTimer = weapon.cooldown;
}