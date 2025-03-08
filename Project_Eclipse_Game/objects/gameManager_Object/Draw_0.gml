draw_set_font(fSilverHUD);
var camerax = camera_get_view_x(view_camera[0]);
var cameray = camera_get_view_y(view_camera[0]);
draw_text(camerax+8, cameray+80, "Scrap: "+string(global.scrapCount));