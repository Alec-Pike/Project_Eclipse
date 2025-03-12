//initialize vars
global.betweenRounds = false;
global.scrapCount = 0;
global.currentWave = 1;
global.enemiesToSpawn = 10 + global.currentWave*5;
global.enemiesToKill = 10 + global.currentWave*5;
//randomize();
/*TODO OPTIONAL: 
 * uncomment the above to make  the enemy 
 * placement, drops, etc truly random
 */
//load scrap sprites
//sprite_prefetch(object_get_sprite(scrapSmall_Object));
//sprite_prefetch(object_get_sprite(scrapBig_Object));