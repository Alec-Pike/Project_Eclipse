//draw the player
draw_self();

//draw the weapon
var _weaponYscl = 1;

if (aimDir > 90 && aimDir < 270) {
	_weaponYscl = -1;
}

draw_sprite_ext(gun_Sprite, 0, x, centerY, 1, _weaponYscl, aimDir, c_white,1);

