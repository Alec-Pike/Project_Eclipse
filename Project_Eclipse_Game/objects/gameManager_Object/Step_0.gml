if (global.enemiesToKill <= 0) && (global.currentWave < 5) && (!global.betweenRounds){
    global.betweenRounds = true;
    end_wave();
} else {
    // victory screen
	if (global.currentWave >= 5 && global.enemiesToKill <= 0) { 
        audio_stop_all();
		room_goto(CreditsScreen); 
	}
}
