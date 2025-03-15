if (global.enemiesToKill <= 0) && (global.currentWave < 5) {
    global.betweenRounds = true;
    end_wave();
} else {
    // victory screen
	if (global.currentWave >= 5 && global.enemiesToKill <= 0) { 
		room_goto(CreditsScreen); 
	}
}
