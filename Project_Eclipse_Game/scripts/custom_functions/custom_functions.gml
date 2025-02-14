//drawing the player's weapon

function draw_my_weapon() 
{

	//draw the weapon
		//get the weapon off the player's body
		var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);

	//flip the weapon right
	var _weaponYscl = 1;

	if (aimDir > 90 && aimDir < 270) 
	{
		_weaponYscl = -1;
	}

	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white,1);

}