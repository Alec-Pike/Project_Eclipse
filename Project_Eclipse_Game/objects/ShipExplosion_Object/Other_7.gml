//graphics display helpers
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    global.betweenRounds = true; // player can't move now
    //display victory message
    Menu(camerax+200, cameray+125, 
        [["To Title", room_goto_previous]], "YOUR SHIP WAS DESTROYED...");

instance_destroy();