//some variables for movement

	moveDir = 0;
	moveSpd = 2; // move 2 pixels per frame

	xspd = 0; //for moving left and right
	yspd = 0; //for moving up and down


// sprite control

centerYOffset = -26; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically

weaponOffsetDist = 11;
aimDir = 0; //deetermines direction the player is facing



face = 3; //face works as an index
sprite[0] = playerRight_Sprite;
sprite[1] = playerUp_Sprite;
sprite[2] = playerLeft_Sprite;
sprite[3] = playerDown_Sprite; //2 * 90 equals 270 degrees, straight down. 2 is the index of this array

//sprite_index = sprite[face]; this disappears???


//weapon info

	shootTimer = 0;
	//shootCooldown = 9; //9 frames
	
	
	bulletObj = bullet_Object;
	//weaponLength = 19;
	//weaponLength = sprite_get_bbox_right(bullet_Sprite);
	
	//weapon is a struct
	defaultGun = {
		
		sprite : gun_Sprite, //all these variables belong to the 'weapon' struct
		length : sprite_get_bbox_right(gun_Sprite),
		bulletObj : bullet_Object,
		cooldown : 9,
		
	}
	
	weapon = defaultGun;
	
	//you can use  these variables like:
	//weapon.sprite;
	
	
	
	