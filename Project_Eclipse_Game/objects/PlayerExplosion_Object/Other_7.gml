//graphics display helpers
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    
    //display victory message
    Menu(camerax+150, cameray+125, 
        [["To Title", room_goto_previous]], "YOU WERE KILLED...");