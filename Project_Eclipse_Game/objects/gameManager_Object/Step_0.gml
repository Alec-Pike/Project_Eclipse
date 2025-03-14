if (global.enemiesToKill <= 0) && (global.currentWave < 5) {
    global.betweenRounds = true;
    end_wave();
} else {
    // victory screen
	if (global.currentWave >= 5 && global.enemiesToKill <= 0) { 
		instance_destroy();
		room_goto(EndScreen); 
	}
}
