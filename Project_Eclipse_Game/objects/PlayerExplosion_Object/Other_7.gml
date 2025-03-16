//graphics display helpers
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    
global.betweenRounds = true;
    //display victory message
    Menu(camerax+250, cameray+125, 
        [["To Title", room_goto_previous]], "YOU WERE KILLED...");

instance_destroy();