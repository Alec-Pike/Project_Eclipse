// "N" is for "Next"

if (keyboard_check(vk_alt)) {
   
   // destroy all enemies
   var _enemies = enemySpawner_Object.enemies;
   for (var i=0; i<array_length(_enemies)-1; i++) {
       //don't need to go to the very end bc fleas are in there twice
       while(instance_exists(_enemies[i])) {
           instance_destroy(_enemies[i]);
       }
   }
   
   // indicate end of round with global vars
   global.enemiesToSpawn = 0;
   global.enemiesToKill = 0;
}