
//get inputs for movement

rightKey = keyboard_check(ord("D")); //if D is pressed
//then the rightKey variable turns into 1

leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));


// player movement
#region

	//get direction
	var _horizKey = rightKey - leftKey; //difference of our right and left key
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0,0,_horizKey, _vertKey);
	
	//get x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance(0,0,_horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel,0,1);
	//restricting diagonal distances that are more than 1 unit long
	
	_spd = moveSpd * _inputLevel; //inputlevel returns either 0 or 1
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	//add collisions for the walls that exist for pits, water
	if place_meeting(x + xspd , y , wall_Object) {
		xspd = 0;
	}
	
	if place_meeting(x , y + yspd , wall_Object) {
		yspd = 0;
	}
	
	
	//move the player
	x += xspd;
	y += yspd;
	
	//depth
	depth = -bbox_bottom;
	
#endregion

//player aiming
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction(x,centerY,mouse_x, mouse_y);
	//centerY is the center of the player
//sprite control
#region
	// make sure player is facing correct direction
	face = round(aimDir/90); //aimDir has a degree like 90, 180 or 270 and so on based on mouse direction
	if face == 4 { face = 0; }; //since a degree from moveDir like 350 will round up to 360, so when it does 360/9 it gets an index of 4 which we don't have
	//face has to be either 0,1,2,3 to use the code from create that changes sprite/changes player direction
	
	//animate
	if (xspd == 0 && yspd == 0) { //we don't have animation yet lol
		image_index = 0; //if player no move, the current sprite stays in frame 1, which does not move because it's a still image
	}
	
	//set the player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
#endregion

