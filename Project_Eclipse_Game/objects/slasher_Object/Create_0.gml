// Inherit the parent event
event_inherited();

shootTimer = 0;
centerYOffset = -48; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically

aimDir = 0; //determines direction the slasher is facing

    
    //weapon is a struct
    defaultGun = {
        
        bulletObj : slasherAttack_Object,
        cooldown : 200,
        
    }
    
    weapon = defaultGun;
    
