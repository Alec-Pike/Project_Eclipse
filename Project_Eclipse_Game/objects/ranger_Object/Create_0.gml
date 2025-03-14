// Inherit the parent event
event_inherited();
shootTimer = 0;
centerYOffset = -25; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically
//same thing for x
centerXOffset = 0; 
centerX = x + centerXOffset;

weaponOffsetDist = 3;
aimDir = 0; //determines direction the ranger is facing

	
	//weapon is a struct
	defaultGun = {
		
		sprite : rangerGun_Sprite, //all these variables belong to the 'weapon' struct
		length : sprite_get_bbox_right(rangerGun_Sprite),
		bulletObj : rangerBullet_Object,
		cooldown : 100,
		
	}
	
	weapon = defaultGun;
	