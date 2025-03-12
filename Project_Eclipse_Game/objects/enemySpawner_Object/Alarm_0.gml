if global.enemiesToSpawn > 0 {
    // choose an enemy to spawn
    var _spawnNext = enemies[irandom(global.currentWave-1)];
    // choose an edge to spawn it on
    switch(irandom(3)) {
        case 0:
            x = room_width + 64;
            y = random(room_height);
            break;
        case 1:
            x = random(room_width);
            y = room_height + 64;
            break;
        case 2:
            x = -64;
            y = random(room_height);
            break;
        case 3:
            x = random(room_width);
            y = -64;
            break;
    }
    // spawn it
    instance_create_layer(x, y, "Instances", _spawnNext);
    // decrement counter
    global.enemiesToSpawn--;
    
    // fleas spawn in groups of 3
    if _spawnNext == flea_object {
        alarm[1] = spawnInterval*0.2;
        alarm[2] = spawnInterval*0.4;
    }
    
    // spawns get faster towards the end of the wave
    if (global.enemiesToKill < global.currentWave*4) && (!spedUp) {
        spawnInterval /= 2;
        spedUp = true;
    }
    
    // reset timer
    alarm[0] = spawnInterval;
} else {
    // must be the end of the wave; reset the spawn interval to not be super fast
    spawnInterval *= 2;
    spedUp = false;
}