// draw HUD
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_sprite(singleScrap_sprite, 1, camerax+24, cameray+96);
draw_set_font(fSilverHUD);
draw_set_color(c_white);
draw_text(camerax+47, cameray+80, string(global.scrapCount));
draw_text(camerax+665, cameray+395, "Wave "+string(global.currentWave)+"/5");