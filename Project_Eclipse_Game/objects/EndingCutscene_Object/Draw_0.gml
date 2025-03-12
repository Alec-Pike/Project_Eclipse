var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (_videoStatus == 0) // Video is playing without errors
{
	draw_surface(_videoData[1],0,0);
}

draw_text(10, 10, string(video_get_status())); // Display status on screen
//lets you know if video is working lol





//array[0] = Playback status
//array[1] = Video Surface
