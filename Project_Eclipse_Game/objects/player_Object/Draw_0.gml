//draw the weapon behind the player
	if (aimDir >= 0 && aimDir < 180) 
	{
		draw_my_weapon();
	}

//draw the player
draw_self();

//draw the weapon
	if (aimDir >= 180 && aimDir < 360)
	{
	   draw_my_weapon();
	}
	
//draw hp as a bar
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_healthbar(camerax+16,cameray+8,camerax+(256*maxHP/100)+16,cameray+32,(hp/maxHP)*100,c_black,c_red,c_lime,0,true,true);
draw_sprite_ext(playerIcon_Sprite,1,camerax+6,cameray+8,2.1,2.1,0,c_white,100);