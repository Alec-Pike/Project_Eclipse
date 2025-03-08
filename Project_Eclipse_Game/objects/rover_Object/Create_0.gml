// Inherit the parent event
event_inherited();
shootTimer = 0;
centerYOffset = -25; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically

weaponOffsetDist = 3;
aimDir = 0; //determines direction the player is facing


bulletObj = roverBullet_Object;
	//weaponLength = 19;
	//weaponLength = sprite_get_bbox_right(bullet_Sprite);
	
	//weapon is a struct
	defaultGun = {
		
		sprite : rangerGun_Sprite, //all these variables belong to the 'weapon' struct
		length : sprite_get_bbox_right(rangerGun_Sprite),
		bulletObj : roverBullet_Object,
		cooldown : 50,
		
	}
	
	weapon = defaultGun;
	