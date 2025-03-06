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
	
//draw hp as number
//	draw_text(x,y,string(hp));
// as a bar
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_healthbar(camerax+8,cameray+8,camerax+256,cameray+32,(hp/startingHP)*100,c_black,c_red,c_lime,0,true,true);
