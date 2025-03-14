// Inherit the parent event
event_inherited();
goal = player_Object;
shootTimer = 0;
centerYOffset = -73; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically
//same thing for x
centerXOffset1 = -60; 
centerX1 = x + centerXOffset1;
// twice bc 2 guns
centerXOffset2 = 60; 
centerX2 = x + centerXOffset2;

aimDir1 = 0; //determines direction the ranger is facing
aimDir2 = 0;


	//weapon is a struct
	defaultGun = {
		
		//sprite : suppressorGun_Sprite, //all these variables belong to the 'weapon' struct
		//length : sprite_get_bbox_right(suppressorGun_Sprite),
		bulletObj : suppressorBullet_Object,
		cooldown : 10,
		
	}
	
	weapon = defaultGun;
	
attackInterval = 100;
attackTimer = attackInterval;

attacking[0] = suppressorAttackDown_Sprite;
attacking[1] = suppressorAttackUp_Sprite;
attacking[2] = suppressorAttackDown_Sprite;
attacking[3] = suppressorAttackDown_Sprite;

bulletsShot = 0;