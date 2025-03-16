alarm[1] = 70; // this is how long the target stays on screen before exploding
if instance_exists(targetGoal) {
    x = targetGoal.x;
    y = targetGoal.y;
    if targetGoal == ship_Object {
        depth = targetGoal.depth - 100; // should show on top of the ship
    } else {
        depth = targetGoal.depth + 100; // should show undetneath the player
    }
}
visible = true;
var _rocket = instance_create_depth(x, y-350, depth-100, roverRocket_Object);
with(_rocket) {
    dir = -90; //straight down
}