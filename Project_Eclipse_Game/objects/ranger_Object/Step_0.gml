// Inherit the parent event
event_inherited();
#region //ranger aiming
//enemy aiming
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction(x,centerY,player_Object.x, player_Object.y);
	//centerY is the center of the player
//sprite control

//shoot the weapon
if shootTimer > 0
{
	shootTimer--; 
}

if (distance_to_object(player_Object) < 300 && shootTimer <= 0)
{
	
	//reset the timer
	shootTimer = weapon.cooldown;
//shooting	
	//create the bullet
	var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir);
	var _bulletInst = instance_create_depth(x + _xOffset,centerY + _yOffset, depth-100, weapon.bulletObj);
	//creating an instance of a bullet object
	//and storing it's unique ID in _bulletInst
	
	//change the bullet's direction
	with(_bulletInst) 
	{
		dir = other.aimDir; //other refers to another object, player in this case
		_bulletInst.image_angle = point_direction(x, y, player_Object.x, player_Object.y);
	}
}
#endregion

