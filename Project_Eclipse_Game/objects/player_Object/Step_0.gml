
//get inputs for movement

rightKey = keyboard_check(ord("D")); //if D is pressed
//then the rightKey variable turns into 1

leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));


// player movement
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