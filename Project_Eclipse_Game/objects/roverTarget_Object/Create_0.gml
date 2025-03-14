alarm[0] = 70; // this is how long the target stays on screen before exploding
var _rocket = instance_create_depth(x, y-350, depth-100, roverRocket_Object);
with(_rocket) {
    dir = -90; //straight down
}