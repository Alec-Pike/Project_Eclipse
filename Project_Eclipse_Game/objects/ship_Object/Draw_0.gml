draw_self();

// draw ship healthbar
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_healthbar(camerax+8,cameray+48,camerax+256,cameray+72,(hp/startingHP)*100,c_black,c_red,c_lime,1,true,true);
