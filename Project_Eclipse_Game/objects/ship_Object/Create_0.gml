
maxHP = startingHP;
get_damaged_create(maxHP);

centerYOffset = -48; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically
//same thing for x
centerXOffset = -33; 
centerX = x + centerXOffset; 

weaponOffsetDist = 3;
aimDir = 0;

turretUnlocked = false;

//weapon info

    shootTimer = 0;
    //shootCooldown = 9; //9 frames
    
    
    bulletObj = shipBullet_Object;
    //weaponLength = 19;
    //weaponLength = sprite_get_bbox_right(bullet_Sprite);
    
    //weapon is a struct
    defaultGun = {
        
        sprite : turret_Sprite, //all these variables belong to the 'weapon' struct
        length : sprite_get_bbox_right(turret_Sprite),
        bulletObj : shipBullet_Object,
        cooldown : wCooldown,
        
    }
    weapon = defaultGun;

    bulletCount = 1;