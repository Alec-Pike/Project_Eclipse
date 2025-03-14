//damage setup
    maxHP = startingHP;
	get_damaged_create(maxHP, true);

//some variables for movement

	moveDir = 0;
	moveSpd = 2; // move 2 pixels per frame

	xspd = 0; //for moving left and right
	yspd = 0; //for moving up and down


// sprite control

centerYOffset = -20; //distance away from the origin point on sprite
centerY = y + centerYOffset; //set in step event, we need to get this dynamically
//same thing for x
centerXOffset = 0; 
centerX = x + centerXOffset;

weaponOffsetDist = 3;
aimDir = 0; //deetermines direction the player is facing

bulletCount = 1; //default to shooting 1 bullet


face = 3; //face works as an index
sprite[0] = playerRight_Sprite;
sprite[1] = playerUp_Sprite;
sprite[2] = playerRight_Sprite;
sprite[3] = playerDown_Sprite; //2 * 90 equals 270 degrees, straight down. 2 is the index of this array
//sprite[4] = idleMain_Sprite; //main idle
//sprite_index = sprite[face]; this disappears???

//array for controlling idle animations I guess
idle[0] = idleMainSide_Sprite;
idle[1] = idleMainNorth_Sprite;
idle[2] = idleMainSide_Sprite;
idle[3] = idleMain_Sprite;

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
		cooldown : wCooldown,
		
	}
	
	weapon = defaultGun;
	
	//you can use  these variables like:
	//weapon.sprite;
	
	// a couple more variables for dodging
    dodgeTimer = 0;
    dodgeLegth = 30; 