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