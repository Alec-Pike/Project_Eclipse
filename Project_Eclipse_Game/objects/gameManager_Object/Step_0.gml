if (global.enemiesToKill <= 0) && (global.currentWave < 5) {
    global.betweenRounds = true;
    end_wave();
} else {
    //TODO: victory screen
	//room_goto(EndScreen);
	if (global.currentWave == 5 && global.enemiesToKill == 0) { 
		instance_destroy();
		room_goto(EndScreen); 
	}
}
