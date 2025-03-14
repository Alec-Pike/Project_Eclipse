//initialize vars
global.betweenRounds = false;
global.scrapCount = 0;
global.currentWave = 1;
global.enemiesToSpawn = 11;
global.enemiesToKill = 11;

Menu(515, 500, [["Start", room_goto_next], ["View Controls", viewControls]]);
