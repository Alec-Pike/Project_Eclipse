event_inherited();

// movement settings
mp_potential_settings(45, 5, move_speed+7, true);

// randomly select target (player or ship)
goal = choose(player_Object, ship_Object);

face = 3; //face works as an index
sprite[0] = right_sprite;
sprite[1] = up_sprite;
sprite[2] = right_sprite;
sprite[3] = down_sprite;

//array for controlling idle animations I guess
idle[0] = idleSide;
idle[1] = idleUp;
idle[2] = idleSide;
idle[3] = idleDown;

idling = false;
state = "walk";


get_damaged_create(startingHP);
