// Inherit the parent event
event_inherited();

//draw the weapon behind the enemy
	if (aimDir >= 0 && aimDir < 180) 
	{
		draw_my_weapon();
	}

//draw the enemy
draw_self();

//draw the enemy weapon
	if (aimDir >= 180 && aimDir < 360)
	{
	draw_my_weapon();
	}