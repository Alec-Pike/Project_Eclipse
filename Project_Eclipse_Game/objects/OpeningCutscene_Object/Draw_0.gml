var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (_videoStatus == 0) // Video is playing without errors
{
	draw_surface(_videoData[1],0,0);
}

//draw_text(10, 10, string(video_get_status())); // Display status on screen
//this is that text you see at the top left, tells you status of the video





//array[0] = Playback status
//array[1] = Video Surface


if skipMessageShown {
    draw_set_font(fSilverHUD);
    draw_set_color(c_white);
    draw_text(x,y,"Press SPACE to skip");
}