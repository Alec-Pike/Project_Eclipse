event_inherited();

dir = 0;
spd = 5;
xspd = 0;
yspd = 0;

//cleanup, bullet dies after certain distance
maxDist = 250; //250 pixels before getting destroyed
destroy = false;
enemyDestroy = true; 
//bullets go through enemies when enemyDestroy set to false
//bullets don't go through when set to true