//draw the weapon behind the player
/*    if (aimDir >= 0 && aimDir < 180) 
    {
        draw_my_weapon();
    }*/
depth = -bbox_bottom;
//draw the ship
draw_self();

if turretUnlocked {
//draw the weapon
//    if (aimDir >= 180 && aimDir < 360)
//    {
    draw_my_weapon();
//    }
}

// draw ship healthbar
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_healthbar(camerax+16,cameray+48,camerax+(256*maxHP/500)+16,cameray+72,(hp/maxHP)*100,c_black,c_red,c_lime,0,true,true);
draw_sprite_ext(shipIcon_Sprite,1,camerax+10,cameray+48,0.3,0.3,0,c_white,100);